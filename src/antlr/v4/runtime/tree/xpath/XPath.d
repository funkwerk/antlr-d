/*
 * [The "BSD license"]
 *  Copyright (c) 2012 Terence Parr
 *  Copyright (c) 2012 Sam Harwell
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

module antlr.v4.runtime.tree.xpath.XPath;

import std.stdio;
import std.file;
import antlr.v4.runtime.Parser;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.CommonTokenStream;
import antlr.v4.runtime.ANTLRInputStream;
import antlr.v4.runtime.tree.ParseTree;
import antlr.v4.runtime.tree.xpath.XPathElement;
import antlr.v4.runtime.tree.xpath.XPathLexer;
import antlr.v4.runtime.tree.xpath.XPathLexerRecover;

// Class XPath
/**
 * @uml
 * Represent a subset of XPath XML path syntax for use in identifying nodes in
 * parse trees.
 *
 * <p>
 * Split path into words and separators {@code /} and {@code //} via ANTLR
 * itself then walk path elements from left to right. At each separator-word
 * pair, find set of nodes. Next stage uses those as work list.</p>
 *
 * <p>
 * The basic interface is
 * {@link XPath#findAll ParseTree.findAll}{@code (tree, pathString, parser)}.
 * But that is just shorthand for:</p>
 *
 * <pre>
 * {@link XPath} p = new {@link XPath#XPath XPath}(parser, pathString);
 * return p.{@link #evaluate evaluate}(tree);
 * </pre>
 *
 * <p>
 * See {@code org.antlr.v4.test.TestXPath} for descriptions. In short, this
 * allows operators:</p>
 *
 * <dl>
 * <dt>/</dt> <dd>root</dd>
 * <dt>//</dt> <dd>anywhere</dd>
 * <dt>!</dt> <dd>invert; this must appear directly after root or anywhere
 * operator</dd>
 * </dl>
 *
 * <p>
 * and path elements:</p>
 *
 * <dl>
 * <dt>ID</dt> <dd>token name</dd>
 * <dt>'string'</dt> <dd>any string literal token from the grammar</dd>
 * <dt>expr</dt> <dd>rule name</dd>
 * <dt>*</dt> <dd>wildcard matching any node</dd>
 * </dl>
 *
 * <p>
 * Whitespace is not allowed.</p>
 */
class XPath
{

    /**
     * @uml
     * word not operator/separator
     */
    public static immutable string WILDCARD = "*";

    /**
     * @uml
     * word for invert operator
     */
    public static immutable string NOT = "!";

    protected string path;

    protected XPathElement[] elements;

    protected Parser parser;

    public this(Parser parser, string path)
    {
        this.parser = parser;
        this.path = path;
        elements = split(path);
        debug writefln("%s", elements);
    }

    /**
     * @uml
     * TODO: check for invalid token/rule names, bad syntax
     */
    public XPathElement[] split(string path)
    {
        ANTLRInputStream ins;
        try {
            ins = new ANTLRInputStream(readText(path));
        }
        catch (Exception ioe) {
            throw new IllegalArgumentException("Could not read path: " ~ path, ioe);
        }
        XPathLexer lexer = new XPathLexerRecover(ins);
        lexer.removeErrorListeners();
        lexer.addErrorListener(new XPathLexerErrorListener());
        CommonTokenStream tokenStream = new CommonTokenStream(lexer);
        try {
            tokenStream.fill();
        }
        catch (LexerNoViableAltException e) {
            int pos = lexer.getCharPositionInLine();
            String msg = "Invalid tokens or characters at index "+pos+" in path '"+path+"'";
            throw new IllegalArgumentException(msg, e);
        }

        Token[] tokens = tokenStream.getTokens();
        //		System.out.println("path="+path+"=>"+tokens);
        XPathElement[] elements;
        int n = tokens.length;
        int i=0;
    loop:
        while ( i<n ) {
            Token el = tokens[i];
            Token next = null;
            switch ( el.getType() ) {
            case XPathLexer.ROOT :
            case XPathLexer.ANYWHERE :
                boolean anywhere = el.getType() == XPathLexer.ANYWHERE;
                i++;
                next = tokens[i];
                boolean invert = next.getType()==XPathLexer.BANG;
                if ( invert ) {
                    i++;
                    next = tokens[i];
                }
                XPathElement pathElement = getXPathElement(next, anywhere);
                pathElement.invert = invert;
                elements.add(pathElement);
                i++;
                break;

            case XPathLexer.TOKEN_REF :
            case XPathLexer.RULE_REF :
            case XPathLexer.WILDCARD :
                elements.add( getXPathElement(el, false) );
                i++;
                break;

            case Token.EOF :
                break loop;

            default :
                throw new IllegalArgumentException("Unknowth path element "+el);
            }
        }
        return elements.toArray(new XPathElement[0]);
    }

    /**
     * @uml
     * Convert word like {@code *} or {@code ID} or {@code expr} to a path
     * element. {@code anywhere} is {@code true} if {@code //} precedes the
     * word.
     */
    public XPathElement getXPathElement(Token wordToken, bool anywhere)
    {
    }

    public ParseTree findAll(ParseTree tree, string xpath, Parser parser)
    {
    }

    /**
     * @uml
     * Return a list of all nodes starting at {@code t} as root that satisfy the
     * path. The root {@code /} is relative to the node passed to
     * {@link #evaluate}.
     */
    public ParseTree[] evaluate(ParseTree t)
    {
    }

}
