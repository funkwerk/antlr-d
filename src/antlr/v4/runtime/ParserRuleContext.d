/*
 * [The "BSD license"]
 *  Copyright (c) 2013 Terence Parr
 *  Copyright (c) 2013 Sam Harwell
 *  Copyright (c) 2017 Egbert Voigt
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *  3. The name of the author may not be used to endorse or promote products
 *     derived from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 *  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 *  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

module antlr.v4.runtime.ParserRuleContext;

import std.algorithm;
import std.variant;
import std.format;
import std.conv;
import antlr.v4.runtime.RuleContext;
import antlr.v4.runtime.tree.ParseTree;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.InterfaceParser;
import antlr.v4.runtime.RecognitionException;
import antlr.v4.runtime.tree.ErrorNode;
import antlr.v4.runtime.tree.ErrorNodeImpl;
import antlr.v4.runtime.tree.TerminalNode;
import antlr.v4.runtime.tree.TerminalNodeImpl;
import antlr.v4.runtime.tree.ParseTreeListener;
import antlr.v4.runtime.atn.InterfaceParserATNSimulator;
import antlr.v4.runtime.misc.Interval;

// Class ParserRuleContext
/**
 * A rule invocation record for parsing.
 *
 * Contains all of the information about the current rule not stored in the
 * RuleContext. It handles parse tree children list, Any ATN state
 * tracing, and the default values available for rule invocations:
 * start, stop, rule index, current alt number.
 *
 * Subclasses made for each rule and grammar track the parameters,
 * return values, locals, and labels specific to that rule. These
 * are the objects that are returned from rules.
 *
 * Note text is not an actual field of a rule return value; it is computed
 * from start and stop using the input stream's toString() method.  I
 * could add a ctor to this so that we can pass in and store the input
 * stream, but I'm not sure we want to do that.  It would seem to be undefined
 * to get the .text property anyway if the rule matches tokens from multiple
 * input streams.
 *
 * I do not use getters for fields of objects that are used simply to
 * group values such as this aggregate.  The getters/setters are there to
 * satisfy the superclass interface.
 */
class ParserRuleContext : RuleContext
{

    /**
     * If we are debugging or building a parse tree for a visitor,
     * we need to track all of the tokens and rule invocations associated
     * with this rule's context. This is empty for parsing w/o tree constr.
     * operation because we don't the need to track the details about
     * how we parse this rule.
     */
    public Variant[] children;

    public Token start;

    public Token stop;

    /**
     * @uml
     * The exception that forced this rule to return. If the rule successfully
     * completed, this is {@code null}.
     */
    public RecognitionException!(Token, InterfaceParserATNSimulator) exception;

    public this()
    {
    }

    /**
     * @uml
     * COPY a ctx (I'm deliberately not using copy constructor) to avoid
     * confusion with creating node with parent. Does not copy children.
     */
    public void copyFrom(ParserRuleContext ctx)
    {
        this.parent = ctx.parent;
        this.invokingState = ctx.invokingState;

        this.start = ctx.start;
        this.stop = ctx.stop;
    }

    public this(ParserRuleContext parent, int invokingStateNumber)
    {
        super(parent, invokingStateNumber);
    }

    public void enterRule(ParseTreeListener listener)
    {
    }

    public void exitRule(ParseTreeListener listener)
    {
    }

    /**
     * @uml
     * Does not set parent link; other add methods do that
     */
    public TerminalNode addChild(TerminalNode t)
    {
        children ~= Variant(t);
        return t;
    }

    public RuleContext addChild(RuleContext ruleInvocation)
    {
        children ~= Variant(ruleInvocation);
        return ruleInvocation;
    }

    /**
     * @uml
     * Used by enterOuterAlt to toss out a RuleContext previously added as
     * we entered a rule. If we have # label, we will need to remove
     * generic ruleContext object.
     */
    public void removeLastChild()
    {
        if (children !is null) {
            children.length--;
        }
    }

    public TerminalNode addChild(Token matchedToken)
    {
        TerminalNodeImpl t = new TerminalNodeImpl(matchedToken);
        addChild(t);
        t.parent = this;
        return t;
    }

    public ErrorNode addErrorNode(Token badToken)
    {
	ErrorNodeImpl t = new ErrorNodeImpl(badToken);
        addChild(t);
        t.parent = this;
        return t;
    }

    /**
     * @uml
     * Override to make type more specific
     * @override
     */
    public override ParserRuleContext getParent()
    {
        return cast(ParserRuleContext)super.getParent();
    }

    /**
     * @uml
     * @override
     */
    public override ParseTree getChild(int i)
    {
        return children !is null && i>=0 && i < to!int(children.length) ? *children[i].peek!(ParseTree) : null;
    }

    public auto getChild(T)(T ctxType, int i)
    {
        if (children is null || i < 0 || i >= children.length) {
            return null;
        }

        int j = -1; // what element have we found with ctxType?
        foreach (ParseTree o; children) {
            if (ctxType.isInstance(o)) {
                j++;
                if (j == i) {
                    return cast(T)(o);
                }
            }
        }
        return null;
    }

    public TerminalNode getToken(int ttype, int i)
    {
	if (children is null || i < 0 || i >= children.length) {
            return null;
        }

        int j = -1; // what token with ttype have we found?
        foreach (o; children) {
            if (o.type == typeid(TerminalNode)) {
                TerminalNode tnode = o.get!(TerminalNode);
                Token symbol = tnode.getSymbol();
                if ( symbol.getType()==ttype ) {
                    j++;
                    if ( j == i ) {
                        return tnode;
                    }
                }
            }
        }
        return null;
    }

    public TerminalNode[] getTokens(int ttype)
    {
        TerminalNode[] emptyList;
	if (children is null) {
            return emptyList;
        }

        TerminalNode[] tokens = null;
        foreach (o; children) {
            if (o.type == typeid(TerminalNode)) {
                TerminalNode tnode = o.get!(TerminalNode);
                Token symbol = tnode.getSymbol();
                if (symbol.getType() == ttype) {
                    if (tokens is null) {
                        tokens.length = 0;
                    }
                    tokens ~= tnode;
                }
            }
        }

        if (tokens is null) {
            return emptyList;
        }
        return tokens;
    }

    public auto getRuleContext(T)(T ctxType, int i)
    {
        return getChild(ctxType, i);
    }

    public auto getRuleContexts(T)(T ctxType)
    {
        if (children is null) {
            ParserRuleContext[] l;
            return l;
        }
        T[] contexts = null;
        foreach (ParseTree o; children) {
            if (ctxType.classinfo == o.classinfo) {
                if (contexts is null) {
                    contexts = new T[];
                }
                contexts ~= cast(o)ctxType;
            }
        }

        if (contexts is null) {
            ParserRuleContext[] l;
            return l;
        }
        return contexts;
    }

    /**
     * @uml
     * @override
     */
    public override int getChildCount()
    {
        return children !is null ? to!int(children.length) : 0;
    }

    /**
     * @uml
     * @override
     */
    public override Interval getSourceInterval()
    {
        if (start is null) {
            return new Interval(-1, -2); // INVALID
        }
        if (stop is null || stop.getTokenIndex()<start.getTokenIndex()) {
            return Interval.of(start.getTokenIndex(), start.getTokenIndex()-1); // empty
        }
        return Interval.of(start.getTokenIndex(), stop.getTokenIndex());
    }

    /**
     * @uml
     * Get the initial token in this context.
     * Note that the range from start to stop is inclusive, so for rules that do not consume anything
     * (for example, zero length or error productions) this token may exceed stop.
     */
    public Token getStart()
    {
        return start;
    }

    /**
     * @uml
     * Get the final token in this context.
     * Note that the range from start to stop is inclusive, so for rules that do not consume anything
     * (for example, zero length or error productions) this token may precede start.
     */
    public Token getStop()
    {
        return stop;
    }

    /**
     * Used for rule context info debugging during parse-time, not so much for ATN debugging
     */
    public string toInfoString(InterfaceParser recognizer)
    {
        string[] rules = recognizer.getRuleInvocationStack(this);
        rules.reverse();
        return format("ParserRuleContext{ %1$s " ~
                      "start=%2$s, stop=%3$s}", rules,
                      start.getText, stop.getText);
    }

}
