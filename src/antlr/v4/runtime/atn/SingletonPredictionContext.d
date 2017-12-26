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

module antlr.v4.runtime.atn.SingletonPredictionContext;

import std.conv;
import antlr.v4.runtime.atn.ATNState;
import antlr.v4.runtime.atn.PredictionContext;
import antlr.v4.runtime.atn.ContextID;

// Class SingletonPredictionContext
/**
 * TODO add class description
 */
class SingletonPredictionContext : PredictionContext
{

    public PredictionContext parent;

    public int returnState;

    public this(PredictionContext parent, int returnState)
    {
        super(parent !is null ? calculateHashCode(parent, returnState) : calculateEmptyHashCode);
        assert(returnState != ATNState.INVALID_STATE_NUMBER);
        this.parent = parent;
        this.returnState = returnState;
        //this.id = new ContextID().instance.getNextId;
    }

    public static SingletonPredictionContext create(PredictionContext parent, int returnState)
    {
        if (returnState == EMPTY_RETURN_STATE && parent is null ) {
            // someone can pass in the bits of an array ctx that mean $
            return cast(SingletonPredictionContext)EMPTY;
        }
        return new SingletonPredictionContext(parent, returnState);
    }

    /**
     * @uml
     * @override
     */
    public override size_t size()
    {
        return 1;
    }

    /**
     * @uml
     * @override
     */
    public override PredictionContext getParent(int index)
    {
        assert(index == 0);
        return parent;
    }

    /**
     * @uml
     * @override
     */
    public override int getReturnState(int index)
    {
        assert(index == 0);
        return returnState;
    }

    /**
     * @uml
     * @override
     */
    public override bool opEquals(Object o)
    {
        if (this is o) {
            return true;
        }
        else if (o.classinfo != SingletonPredictionContext.classinfo) {
            return false;
        }

        if (this.toHash != (cast(PredictionContext)o).toHash) {
            return false; // can't be same if hash is different
        }

        SingletonPredictionContext s = cast(SingletonPredictionContext)o;
        return returnState == s.returnState &&
            (parent !is null && parent.opEquals(s.parent));
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        string up = parent !is null ? parent.toString() : "";
        if (up.length) {
            if (returnState == EMPTY_RETURN_STATE ) {
                return "$";
            }
            return to!string(returnState);
        }
        return to!string(returnState) ~ " " ~ up;
    }

}
