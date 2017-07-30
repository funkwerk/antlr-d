/*
 * [The "BSD license"]
 *  Copyright (c) 2013 Terence Parr
 *  Copyright (c) 2017 Sam Harwell
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

module antlr.v4.runtime.TraceListener;

import std.stdio;
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.tree.ParseTreeListener;
import antlr.v4.runtime.tree.ErrorNode;
import antlr.v4.runtime.tree.TerminalNode;
import antlr.v4.runtime.Parser;
import antlr.v4.runtime.TokenFactory;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.ParserRuleContext;

// Class TraceListener
/**
 * TODO add class description
 */
class TraceListener : Parser, ParseTreeListener
{

    public void enterEveryRule(ParserRuleContext ctx)
    {
        writeln("enter   " ~ getRuleNames()[ctx.getRuleIndex()] ~
                ", LT(1)=" ~ _input.LT(1).getText());
    }

    public void visitTerminal(TerminalNode node)
    {
        writeln("consume " ~ node.getSymbol().getText ~ " rule " ~
                getRuleNames()[ctx_.getRuleIndex()]);
    }

    public void visitErrorNode(ErrorNode node)
    {
    }

    /**
     * @uml
     * @override
     */
    public override void exitEveryRule(ParserRuleContext ctx)
    {
        writeln("exit   " ~ getRuleNames()[ctx.getRuleIndex()] ~
                ", LT(1)=" ~ _input.LT(1).getText());
    }

    /**
     * @uml
     * @override
     */
    public override string[] getTokenNames()
    {
        return null;
    }

    /**
     * @uml
     * @override
     */
    public override string getGrammarFileName()
    {
        return "";
    }

    /**
     * @uml
     * @override
     */
    public override ATN getATN()
    {
        return null;
    }

    /**
     * @uml
     * @override
     */
    public override string[] getRuleNames()
    {
        return null;
    }

    /**
     * @uml
     * @override
     */
    public override TokenFactory!CommonToken tokenFactory()
    {
        return null;
    }

    /**
     * @uml
     * @override
     */
    public override void tokenFactory(TokenFactory!CommonToken input)
    {
    }

}
