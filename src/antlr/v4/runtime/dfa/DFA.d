module antlr.v4.runtime.dfa.DFA;

import antlr.v4.runtime.dfa.DFAState;

// Class DFA
/**
 * TODO add class description
 */
class DFA
{

    /**
     * @uml
     * A set of all DFA states. Use {@link Map} so we can get old state back
     * ({@link Set} only allows you to see if it's there).
     */
    public DFAState[DFAState] states;

    public DFAState s0;

    public int decision;

}
