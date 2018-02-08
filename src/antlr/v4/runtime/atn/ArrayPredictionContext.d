/*
 * Copyright (c) 2012-2017 The ANTLR Project. All rights reserved.
 * Use of this file is governed by the BSD 3-clause license that
 * can be found in the LICENSE.txt file in the project root.
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
        if (this is o) {
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
