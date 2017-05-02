module antlr.v4.runtime.tree.Trees;

import std.array;
import std.conv;
import antlr.v4.runtime.Parser;
import antlr.v4.runtime.RuleContext;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.tree.TerminalNode;
import antlr.v4.runtime.tree.ErrorNode;
import antlr.v4.runtime.tree.Tree;
import antlr.v4.runtime.tree.ParseTree;
import antlr.v4.runtime.misc.Utils;

// Class Trees
/**
 * TODO add class description
 * @uml
 * A set of utility routines useful for all kinds of ANTLR trees
 */
class Trees
{

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
    public static string toStringTree(Tree t, Parser recog)
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

    public static string getNodeText(Tree t, Parser recog)
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
    }

    /**
     * @uml
     * Return true if t is u's parent or a node on path to root from u.
     * Use == not equals().
     */
    public static bool isAncestorOf(Tree t, Tree u)
    {
    }

    public static ParseTree[] findAllTokenNodes(ParseTree t, int ttype)
    {
    }

    public static ParseTree findAllRuleNodes(ParseTree t, int ruleIndex)
    {
    }

    public static ParseTree[] findAllNodes(ParseTree t, int index, bool findTokens)
    {
    }

    public static void _findAllNodes(ParseTree t, int index, bool findTokens, ParseTree[] nodes)
    {
    }

}
