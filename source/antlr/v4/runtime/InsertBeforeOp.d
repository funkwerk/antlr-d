/*
 * Copyright (c) 2012-2019 The ANTLR Project. All rights reserved.
 * Use of this file is governed by the BSD 3-clause license that
 * can be found in the LICENSE.txt file in the project root.
 */

module antlr.v4.runtime.InsertBeforeOp;

import antlr.v4.runtime.RewriteOperation;
import antlr.v4.runtime.TokenConstantDefinition;
import std.conv;

/**
 * Rewriter operation
 */
class InsertBeforeOp : RewriteOperation
{

    public this(size_t index, string text)
    {
        super(index, text);
    }

    /**
     * @uml
     * @override
     */
    public override size_t execute(ref string buf)
    {
        buf ~= to!string(text);
        if (tokens.get(to!int(index)).getType != TokenConstantDefinition.EOF)
            {
                buf ~= tokens.get(to!int(index)).getText;
            }
        return index+1;
    }

}
