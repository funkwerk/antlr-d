module antlr.v4.runtime.InsertAfterOp;

import antlr.v4.runtime.InsertBeforeOp;

/**
 * Distinguish between insert after/before to do the "insert afters"
 *  first and then the "insert befores" at same index. Implementation
 *  of "insert after" is "insert before index+1".
 */
class InsertAfterOp : InsertBeforeOp
{

    public this(size_t index, Object text)
    {
        super(index+1, text); // insert after is insert before index+1
    }

}
