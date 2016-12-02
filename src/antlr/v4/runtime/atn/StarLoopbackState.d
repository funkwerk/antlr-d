module antlr.v4.runtime.atn.StarLoopbackState;

import antlr.v4.runtime.atn.ATNState;
import antlr.v4.runtime.atn.StateNames;
import antlr.v4.runtime.atn.StarLoopEntryState;

// Class StarLoopbackState
/**
 * TODO add class description
 */
class StarLoopbackState : ATNState
{

    public StarLoopbackState getLoopEntryState()
    {
        return cast(StarLoopEntryState)transition(0).target;
    }

    /**
     * @uml
     * @override
     */
    public override int getStateType()
    {
        return StateNames.STAR_LOOP_BACK;
    }

}
