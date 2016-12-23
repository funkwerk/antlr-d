module antlr.v4.runtime.atn.StarBlockStartState;

import antlr.v4.runtime.atn.BlockStartState;
import antlr.v4.runtime.atn.StateNames;

// Class StarBlockStartState
/**
 * TODO add class description
 */
class StarBlockStartState : BlockStartState
{

    /**
     * @uml
     * @override
     */
    public override int getStateType()
    {
        return StateNames.STAR_BLOCK_START;
    }

}
