module antlr.v4.runtime.atn.BasicBlockStartState;

import antlr.v4.runtime.atn.BlockStartState;
import antlr.v4.runtime.atn.StateNames;

// Class BasicBlockStartState
/**
 * TODO add class description
 */
class BasicBlockStartState : BlockStartState
{

    /**
     * @uml
     * @override
     */
    public override int getStateType()
    {
        return StateNames.BLOCK_START;
    }

}
