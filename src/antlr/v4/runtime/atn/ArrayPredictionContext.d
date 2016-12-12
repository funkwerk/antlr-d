/*
 * [The "BSD license"]
 *  Copyright (c) 2016 Terence Parr
 *  Copyright (c) 2016 Sam Harwell
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

module antlr.v4.runtime.atn.ArrayPredictionContext;

import std.stdio;
import std.conv;
import std.array;
import std.container.array;
import antlr.v4.runtime.atn.PredictionContext;
import antlr.v4.runtime.atn.SingletonPredictionContext;

// Class ArrayPredictionContext
/**
 * TODO add class description
 */
class ArrayPredictionContext : PredictionContext
{

    /**
     * @uml
     * Parent can be null only if full ctx mode and we make an array
     * from {@link #EMPTY} and non-empty. We merge {@link #EMPTY} by using null parent and
     * returnState == {@link #EMPTY_RETURN_STATE}.
     */
    public PredictionContext[] parents;

    /**
     * @uml
     * Sorted for merge, no duplicates; if present,
     * {@link #EMPTY_RETURN_STATE} is always last.
     */
    public int[] returnStates;

    public this(SingletonPredictionContext a)
    {
        PredictionContext[] parents;
        parents ~= a.parent;
        int[] returnStates;
        returnStates ~= a.returnState;
        this(parents, returnStates);
    }

    public this(PredictionContext[] parents, int[] returnStates)
    {
        super.calculateHashCode(parents, returnStates);
        assert(parents && parents.length>0);
        assert(returnStates && returnStates.length>0);
        this.parents = parents;
        this.returnStates = returnStates;
    }

    /**
     * @uml
     * @override
     */
    public override bool isEmpty()
    {
        // since EMPTY_RETURN_STATE can only appear in the last position, we
        // don't need to verify that size==1
        return returnStates[0] == EMPTY_RETURN_STATE;
    }

    /**
     * @uml
     * @override
     */
    public override size_t size()
    {
        return returnStates.length;
    }

    /**
     * @uml
     * @override
     */
    public override PredictionContext getParent(int index)
    {
        return parents[index];
    }

    /**
     * @uml
     * @override
     */
    public override int getReturnState(int index)
    {
        return returnStates[index];
    }

    /**
     * @uml
     * @override
     */
    public override bool opEquals(Object o)
    {
        if (this == o) {
            return true;
        }
        else if (typeid(typeof(o)) != typeid(ArrayPredictionContext*) ) {
            return false;
        }

        if (this.toHash != o.toHash) {
            return false; // can't be same if hash is different
        }

        ArrayPredictionContext a = cast(ArrayPredictionContext)o;
        if (parents.length != a.parents.length) return false;
        Array!int rs = returnStates;
        Array!int ars = a.returnStates;
        if (!rs.opEquals(ars)) return false;
        for (int i = 0; i < parents.length; i++)
            if (parents[i].opEquals(a.parents[i])) return false;
        return true;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        if (isEmpty() ) return "[]";
        auto buf = appender!string;
        buf.put("[");
        for (int i=0; i<returnStates.length; i++) {
            if ( i>0 ) buf.put(", ");
            if ( returnStates[i]==EMPTY_RETURN_STATE ) {
                buf.put("$");
                continue;
            }
            buf.put(to!string(returnStates[i]));
            if (parents[i]) {
                buf.put(' ');
                buf.put(parents[i].toString());
            }
            else {
                buf.put("null");
            }
        }
        buf.put("]");
        return buf.data;
    }

}

unittest
{
    auto spc = new SingletonPredictionContext();
    auto apc = new ArrayPredictionContext(spc);
}
