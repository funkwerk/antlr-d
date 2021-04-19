module antlr.v4.runtime.tree.ParseTreeWalker;

import antlr.v4.runtime.ParserRuleContext;
import antlr.v4.runtime.tree.ErrorNode;
import antlr.v4.runtime.tree.RuleNode;
import antlr.v4.runtime.tree.TerminalNode;
import antlr.v4.runtime.tree.ParseTreeWalker;
import antlr.v4.runtime.tree.ParseTreeListener;
import antlr.v4.runtime.tree.ParseTree;

class ParseTreeWalker
{
    public static immutable ParseTreeWalker DEFAULT;

    /**
     * Performs a walk on the given parse tree starting at the root and going down recursively
     * with depth-first search. On each node, {@link ParseTreeWalker#enterRule} is called before
     * recursively walking down into child nodes, then
     * {@link ParseTreeWalker#exitRule} is called after the recursive call to wind up.
     * @param listener The listener used by the walker to process grammar rules
     * @param t The parse tree to be walked on
     */
    public void walk(ParseTreeListener listener, ParseTree t)
    {
        if (cast(ErrorNode) t) {
            listener.visitErrorNode(cast(ErrorNode)t);
            return;
        }
        else if (cast(TerminalNode) t) {
            listener.visitTerminal(cast(TerminalNode)t);
            return;
        }
        RuleNode r = cast(RuleNode) t;
        enterRule(listener, r);
        int n = r.getChildCount();
        for (int i = 0; i<n; i++) {
            walk(listener, r.getChild(i));
        }
        exitRule(listener, r);
    }

	/**
	 * Enters a grammar rule by first triggering the generic event {@link ParseTreeListener#enterEveryRule}
	 * then by triggering the event specific to the given parse tree node
	 * @param listener The listener responding to the trigger events
	 * @param r The grammar rule containing the rule context
	 */
    protected void enterRule(ParseTreeListener listener, RuleNode r)
    {
        ParserRuleContext ctx = cast(ParserRuleContext) r.getRuleContext();
        listener.enterEveryRule(ctx);
        ctx.enterRule(listener);
    }

	/**
	 * Exits a grammar rule by first triggering the event specific to the given parse tree node
	 * then by triggering the generic event {@link ParseTreeListener#exitEveryRule}
	 * @param listener The listener responding to the trigger events
	 * @param r The grammar rule containing the rule context
	 */
    public void exitRule(ParseTreeListener listener, RuleNode r)
    {
        ParserRuleContext ctx = cast(ParserRuleContext) r.getRuleContext();
        ctx.exitRule(listener);
        listener.exitEveryRule(ctx);
    }
}
