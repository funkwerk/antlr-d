module antlr.v4.runtime.atn.RuleStartState;

import antlr.v4.runtime.atn.ATNState;
import antlr.v4.runtime.atn.RuleStopState;

// Class RuleStartState
/**
 * TODO add class description
 */
class RuleStartState : ATNState
{

    public RuleStopState stopState;

    public bool isLeftRecursiveRule;

    /**
     * @uml
     * @override
     */
    public override int getStateType()
    {
    }

}
