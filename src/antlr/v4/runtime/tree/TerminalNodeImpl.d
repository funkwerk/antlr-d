/*
 * [The "BSD license"]
 *  Copyright (c) 2012 Terence Parr
 *  Copyright (c) 2012 Sam Harwell
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

module antlr.v4.runtime.tree.TerminalNodeImpl;

import antlr.v4.runtime.tree.TerminalNode;
import antlr.v4.runtime.tree.ParseTree;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenConstants;
import antlr.v4.runtime.InterfaceRecognizer;
import antlr.v4.runtime.misc.Interval;
import antlr.v4.runtime.atn.StateNames;

// Class TerminalNodeImpl
/**
 * TODO add class description
 */
class TerminalNodeImpl : TerminalNode
{

    public Token symbol;

    public ParseTree parent;

    public this(Token symbol)
    {
        this.symbol = symbol;	
    }

    public ParseTree getChild(int i)
    {
        return null;
    }

    public Token getSymbol()
    {
        return symbol;
    }

    public ParseTree getParent()
    {
        return parent;
    }

    public Object getPayload()
    {
        return cast(Object)symbol;
    }

    public Interval getSourceInterval()
    {
        if (symbol is null)
            return new Interval(-1,-2); // INVALID
        int tokenIndex = symbol.getTokenIndex();
        return new Interval(tokenIndex, tokenIndex);

    }

    public int getChildCount()
    {
        return 0;
    }

    public V accept(V, U)(ParseTreeVisitor!U visitor)
    {
        return visitor.visitTerminal(this);
    }

    public string getText()
    {
        return symbol.getText();
    }

    public string toStringTree(InterfaceRecognizer parser)
    {
        return toString();
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        if (symbol.getType() == TokenConstants.EOF )
            return "<EOF>";
        return symbol.getText();
    }

    public string toStringTree()
    {
        return toString();
    }

}
