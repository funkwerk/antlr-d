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

module antlr.v4.runtime.tree.Trees;

import std.array;
import std.conv;
import antlr.v4.runtime.InterfaceRecognizer;
import antlr.v4.runtime.ParserRuleContext;
import antlr.v4.runtime.RuleContext;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenConstantDefinition;
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.tree.TerminalNode;
import antlr.v4.runtime.tree.ErrorNode;
import antlr.v4.runtime.tree.Tree;
import antlr.v4.runtime.tree.TerminalNodeImpl;
import antlr.v4.runtime.tree.ParseTree;
import antlr.v4.runtime.misc.Utils;
import antlr.v4.runtime.misc.Interval;
import antlr.v4.runtime.misc.Predicate;

// Class Trees
/**
 * TODO add class description
 * @uml
 * A set of utility routines useful for all kinds of ANTLR trees
 */
class Trees
{

    private this()
    {
    }

    /**
     * @uml
     * Print out a whole tree in LISP form. {@link #getNodeText} is used on the
     * node payloads to get the text for the nodes.  Detect
     * parse trees and extract data appropriately.
     */
    public static string toStringTree(Tree t)
    {
        return toStringTree(t, cast(string[])null);
    }

    /**
     * @uml
     * Print out a whole tree in LISP form. {@link #getNodeText} is used on the
     * node payloads to get the text for the nodes.  Detect
     * parse trees and extract data appropriately.
     */
    public static string toStringTree(Tree t, InterfaceRecognizer recog)
    {
        string[] ruleNames = recog !is null ? recog.getRuleNames() : null;
        string[] ruleNamesList = ruleNames !is null ? ruleNames : null;
        return t.toStringTree ~ to!string(ruleNamesList);
    }

    /**
     * @uml
     * rint out a whole tree in LISP form. {@link #getNodeText} is used on the
     * node payloads to get the text for the nodes.
     */
    public static string toStringTree(Tree t, string[] ruleNames)
    {
        string s = Utils.escapeWhitespace(getNodeText(t, ruleNames), false);
        if ( t.getChildCount()==0 ) return s;
        auto buf = appender!(string);
		buf.put("(");
		s = Utils.escapeWhitespace(getNodeText(t, ruleNames), false);
		buf.put(s);
		buf.put(' ');
		for (int i = 0; i<t.getChildCount(); i++) {
			if ( i>0 ) buf.put(' ');
			buf.put(toStringTree(t.getChild(i), ruleNames));
		}
		buf.put(")");
		return buf.data;
    }

    public static string getNodeText(Tree t, InterfaceRecognizer recog)
    {
        string[] ruleNames = recog !is null ? recog.getRuleNames() : null;
        string[] ruleNamesList = ruleNames !is null ? ruleNames : null;
        return getNodeText(t, ruleNamesList);

    }

    public static string getNodeText(Tree t, string[] ruleNames)
    {
	if (ruleNames) {
            if (t.classinfo == RuleContext.classinfo) {
                int ruleIndex = (cast(RuleContext)t).getRuleContext().getRuleIndex();
                string ruleName = ruleNames[ruleIndex];
                int altNumber = (cast(RuleContext) t).getAltNumber();
                if (altNumber != ATN.INVALID_ALT_NUMBER) {
                    return ruleName ~ ":" ~ to!string(altNumber);
                }
                return ruleName;
            }
            else if (t.classinfo == ErrorNode.classinfo) {
                return "..."; // t.toString();
            }
            else if (t.classinfo == TerminalNode.classinfo) {
                Token symbol = (cast(TerminalNode)t).getSymbol();
                if (symbol !is null) {
                    string s = symbol.getText();
                    return s;
                }
            }
        }
        // no recog for rule names
        Object payload = t.getPayload();
        if (payload.classinfo == Token.classinfo) {
            return (cast(Token)payload).getText();
        }
        return t.getPayload().toString();
    }

    /**
     * @uml
     * Return ordered list of all children of this node
     */
    public static Tree[] getChildren(Tree t)
    {
        Tree[] kids;
        for (int i=0; i<t.getChildCount(); i++) {
            kids ~= t.getChild(i);
        }
        return kids;
    }

    /**
     * @uml
     * Return a list of all ancestors of this node.  The first node of
     * list is the root and the last is the parent of this node.
     */
    public static Tree[] getAncestors(Tree t)
    {
        Tree[] emptyTrees;
	if (t.getParent() is null) return emptyTrees;
        Tree[] ancestors;
        t = t.getParent();
        while (t !is null) {
            ancestors = t ~ ancestors; // insert at start
            t = t.getParent();
        }
        return ancestors;
    }

    /**
     * @uml
     * Return true if t is u's parent or a node on path to root from u.
     * Use == not equals().
     */
    public static bool isAncestorOf(Tree t, Tree u)
    {
        if (t is null || u is null || t.getParent() is null) return false;
		Tree p = u.getParent();
		while (p !is null) {
			if (t is p) return true;
			p = p.getParent();
		}
		return false;
    }

    public static ParseTree[] findAllTokenNodes(ParseTree t, int ttype)
    {
        return findAllNodes(t, ttype, true);
    }

    public static ParseTree[] findAllRuleNodes(ParseTree t, int ruleIndex)
    {
        return findAllNodes(t, ruleIndex, false);
    }

    public static ParseTree[] findAllNodes(ParseTree t, int index, bool findTokens)
    {
        ParseTree[] nodes;
        _findAllNodes(t, index, findTokens, nodes);
        return nodes;
    }

    public static void _findAllNodes(ParseTree t, int index, bool findTokens, ParseTree[] nodes)
    {
	// check this node (the root) first
        if ( findTokens && t.classinfo == TerminalNode.classinfo) {
            TerminalNode tnode = cast(TerminalNode)t;
            if (tnode.getSymbol().getType() == index) nodes ~= t;
        }
        else if (!findTokens && t.classinfo == ParserRuleContext.classinfo) {
            ParserRuleContext ctx = cast(ParserRuleContext)t;
            if ( ctx.getRuleIndex() == index ) nodes ~= t;
        }
        // check children
        for (int i = 0; i < t.getChildCount(); i++){
            _findAllNodes(t.getChild(i), index, findTokens, nodes);
        }
    }

    /**
     * @uml
     * Get all descendents; includes t itself.
     */
    public static ParseTree[] getDescendants(ParseTree t)
    {
        ParseTree[] nodes;
        nodes ~= t;

        int n = t.getChildCount();
        for (int i = 0 ; i < n ; i++){
            nodes ~= getDescendants(t.getChild(i));
        }
        return nodes;
    }

    public static ParseTree[] descendants(ParseTree t)
    {
        return getDescendants(t);
    }

    /**
     * @uml
     * Find smallest subtree of t enclosing range startTokenIndex..stopTokenIndex
     * inclusively using postorder traversal.  Recursive depth-first-search.
     */
    public static ParserRuleContext getRootOfSubtreeEnclosingRegion(ParseTree t, int startTokenIndex,
        int stopTokenIndex)
    {
	int n = t.getChildCount();
        for (int i = 0; i<n; i++) {
            ParseTree child = t.getChild(i);
            ParserRuleContext r = getRootOfSubtreeEnclosingRegion(child, startTokenIndex, stopTokenIndex);
            if (r !is null) return r;
        }
        if (t.classinfo == ParserRuleContext.classinfo) {
            ParserRuleContext r = cast(ParserRuleContext)t;
            if (startTokenIndex >= r.getStart().getTokenIndex() && // is range fully contained in t?
                (r.getStop() is null || stopTokenIndex <= r.getStop().getTokenIndex()) )
                {
                    // note: r.getStop()==null likely implies that we bailed out of parser and there's nothing to the right
                    return r;
                }
        }
        return null;
    }

    /**
     * @uml
     * Replace any subtree siblings of root that are completely to left
     * or right of lookahead range with a CommonToken(Token.INVALID_TYPE,"...")
     * node. The source interval for t is not altered to suit smaller range!
     *
     * WARNING: destructive to t.
     */
    public static void stripChildrenOutOfRange(ParserRuleContext t, ParserRuleContext root,
        int startIndex, int stopIndex)
    {
        if (t is null) return;
        for (int i = 0; i < t.getChildCount(); i++) {
            ParseTree child = t.getChild(i);
            Interval range = child.getSourceInterval();
            if (child.classinfo == ParserRuleContext.classinfo && (range.b < startIndex || range.a > stopIndex) ) {
                if (isAncestorOf(child, root)) { // replace only if subtree doesn't have displayed root
                    CommonToken abbrev = new CommonToken(TokenConstantDefinition.INVALID_TYPE, "...");
                    t.children[i] =  new TerminalNodeImpl(abbrev);
                }
            }
        }
    }

    /**
     * @uml
     * Return first node satisfying the pred
     */
    public static Tree findNodeSuchThat(Tree t, Predicate!Tree pred)
    {
        if (pred.test(t) ) return t;

        int n = t.getChildCount();
        for (int i = 0 ; i < n ; i++){
            Tree u = findNodeSuchThat(t.getChild(i), pred);
            if (u !is null ) return u;
        }
        return null;
    }

}
