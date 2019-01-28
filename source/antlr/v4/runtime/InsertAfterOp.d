/*
 * Copyright (c) 2012-2019 The ANTLR Project. All rights reserved.
 * Use of this file is governed by the BSD 3-clause license that
 * can be found in the LICENSE.txt file in the project root.
 */

module antlr.v4.runtime.InsertAfterOp;

import antlr.v4.runtime.InsertBeforeOp;

/**
 * Distinguish between insert after/before to do the "insert afters"
 *  first and then the "insert befores" at same index. Implementation
 *  of "insert after" is "insert before index+1".
 */
class InsertAfterOp : InsertBeforeOp
{

    public this(size_t index, string text)
    {
        super(index+1, text); // insert after is insert before index+1
   		debug(TokenStreamRewriter) {
			import std.stdio : writefln;
			writefln("InsertAfterOp constructor: index = %s, text = %s", index, text);
		}
    }

}
