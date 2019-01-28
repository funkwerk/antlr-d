/*
 * Copyright (c) 2012-2019 The ANTLR Project. All rights reserved.
 * Use of this file is governed by the BSD 3-clause license that
 * can be found in the LICENSE.txt file in the project root.
 */

module antlr.v4.runtime.RewriteOperation;

import antlr.v4.runtime.TokenStreamRewriter;
import std.conv;
import std.format;

/**
 * TODO add class description
 */
class RewriteOperation : TokenStreamRewriter
{

    /**
     * What index into rewrites List are we?
     */
    public size_t instructionIndex;

    /**
     * Token buffer index.
     */
    public size_t index;

    public string text;

    public this(size_t index)
    {
	this.index = index;
    }

    public this(size_t index, string text)
    {
	this.index = index;
        this.text = text;
        debug(TokenStreamRewriter) {
            import std.stdio : writefln;
            writefln("RewriteOperation constructor: index = %s, text = %s", index, text);
        }
    }

    /**
     * Execute the rewrite operation by possibly adding to the buffer.
     *  Return the index of the next token to operate on.
     */
    public size_t execute(ref string buf)
    {
	return index;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        string opName = this.classinfo.name;
        //int dollar_index = opName.indexOf('$');
        // opName = opName.substring(dollar_index+1, opName.length());
        return format("<%s@%s:\"%s\">", opName, tokens.get(to!int(index)),
                      text);
    }

}
