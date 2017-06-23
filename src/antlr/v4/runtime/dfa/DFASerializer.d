module antlr.v4.runtime.dfa.DFASerializer;

import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.dfa.DFAState;
import antlr.v4.runtime.Vocabulary;
import antlr.v4.runtime.VocabularyImpl;

// Class DFASerializer
/**
 * @uml
 * A DFA walker that knows how to dump them to serialized strings.
 */
class DFASerializer
{

    public DFA dfa;

    public Vocabulary vocabulary;

    public this(DFA dfa, string[] tokenNames)
    {
        this(dfa, VocabularyImpl.fromTokenNames(tokenNames));
    }

    public this(DFA dfa, Vocabulary vocabulary)
    {
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
    }

    public string getEdgeLabel(int i)
    {
    }

    public string getStateString(DFAState s)
    {
    }

}
