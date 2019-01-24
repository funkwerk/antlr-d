/*
 * Copyright (c) 2012-2019 The ANTLR Project. All rights reserved.
 * Use of this file is governed by the BSD 3-clause license that
 * can be found in the LICENSE.txt file in the project root.
 */

module antlr.v4.runtime.ReplaceOp;

import antlr.v4.runtime.RewriteOperation;
import std.conv;
import std.format;

/**
 * I'm going to try replacing range from x..y with (y-x)+1 ReplaceOp
 *  instructions.
 */
class ReplaceOp : RewriteOperation
{

    private size_t lastIndex;

    public this(size_t from, size_t to, string text)
    {
        super(from, text);
        lastIndex = to;
    }

    /**
     * @uml
     * @override
     */
    public override size_t execute(ref string buf)
    {
        if (text) {
            buf ~= to!string(text);
        }
        return lastIndex+1;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        if (text is null)
            {
                return format("<DeleteOp@%s..%s>", tokens.get(to!int(index)),
                              tokens.get(to!int(lastIndex)));
            }
        return format("<ReplaceOp@%s..%s:\"%s\">", tokens.get(to!int(index)),
                      tokens.get(to!int(lastIndex)), text);
    }

}
