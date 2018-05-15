module antlr.v4.runtime.dfa.LexerDFASerializer;

import std.conv;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.dfa.DFASerializer;
import antlr.v4.runtime.VocabularyImpl;

// Class LexerDFASerializer
/**
 * TODO add class description
 */
class LexerDFASerializer : DFASerializer
{

    public this(DFA dfa)
    {
	super(dfa, new VocabularyImpl(null, null, null));
    }

    /**
     * @uml
     * @override
     */
    public override string getEdgeLabel(int i)
    {
	return "'" ~ to!string(i) ~ "'";
    }

}
