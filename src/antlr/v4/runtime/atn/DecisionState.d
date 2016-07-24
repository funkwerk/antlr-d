module antlr.v4.runtime.atn.DecisionState;

import antlr.v4.runtime.atn.ATNState;

// Class DecisionState
/**
 * TODO add class description
 */
abstract class DecisionState : ATNState
{

    public int decision = -1;

    public bool nonGreedy;

}
