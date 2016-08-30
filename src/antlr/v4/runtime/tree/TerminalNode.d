module antlr.v4.runtime.tree.TerminalNode;

import antlr.v4.runtime.tree.ParseTree;

// Interface TerminalNode
/**
 * TODO add interface description
 */
interface TerminalNode :ParseTree
{

    public Token getSymbol();

}
