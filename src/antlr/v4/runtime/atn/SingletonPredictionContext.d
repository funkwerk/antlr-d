module antlr.v4.runtime.atn.SingletonPredictionContext;

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

    public this(SingletonPredictionContext parent, int returnState)
    {
        super(parent != null ? calculateHashCode(parent, returnState) : calculateEmptyHashCode());
        assert(returnState != ATNState.INVALID_STATE_NUMBER);
        this.parent = parent;
        this.returnState = returnState;
        this.id = ContextID().getNextId;
    }

    public SingletonPredictionContext create(PredictionContext parent, int returnState)
    {
        if ( returnState == EMPTY_RETURN_STATE && parent == null ) {
            // someone can pass in the bits of an array ctx that mean $
            return EMPTY;
        }
        return new SingletonPredictionContext(parent, returnState);
    }

    /**
     * @uml
     * @override
     */
    public override PredictionContext getParent(int index)
    {
    }

    /**
     * @uml
     * @override
     */
    public override int getReturnState(int index)
    {
    }

    /**
     * @uml
     * @override
     */
    public override bool opEquals(Object o)
    {
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
    }

}
