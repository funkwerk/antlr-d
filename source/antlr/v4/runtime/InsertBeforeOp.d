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
class InsertBeforeOp(T) : RewriteOperation!T
{

    public this(size_t index, T text)
    {
        super(index, text);
    }

    /**
     * @uml
     * @override
     */
    public override size_t execute(ref T buf)
    {
        buf ~= to!T(text);
        if (tokens.get(to!int(index)).getType != TokenConstantDefinition.EOF)
            {
                static if (is(T == string))
                    buf ~= tokens.get(to!int(index)).getText;
                else
                    buf ~= getPositionText(tokens.get(to!int(index)));
            }
        return index+1;
    }

}
