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

    public this()
    {
    }

    public this(PredictionContext parent, int returnState)
    {
        super(parent !is null ? calculateHashCode(parent, returnState) : calculateEmptyHashCode);
        assert(returnState != ATNState.INVALID_STATE_NUMBER);
        this.parent = parent;
        this.returnState = returnState;
        this.id = new ContextID().instance.getNextId;
    }

    public SingletonPredictionContext create(PredictionContext parent, int returnState)
    {
        if (returnState == EMPTY_RETURN_STATE && parent is null ) {
            // someone can pass in the bits of an array ctx that mean $
            return EMPTY;
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
        if (this == o) {
            return true;
        }
        else if (typeid(typeof(o)) != typeid(SingletonPredictionContext*)) {
            return false;
        }

        if (this.hashCode() != (cast(PredictionContext)o).hashCode()) {
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
