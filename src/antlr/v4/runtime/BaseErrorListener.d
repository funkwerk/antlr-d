module antlr.v4.runtime.BaseErrorListener;

import antlr.v4.runtime.ANTLRErrorListener;
import antlr.v4.runtime.Recognizer;
import antlr.v4.runtime.RecognitionException;
import antlr.v4.runtime.Parser;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.atn.ATNConfigSet;
import antlr.v4.runtime.misc.BitSet;

// Class Template BaseErrorListener
/**
 * Provides an empty default implementation of {@link ANTLRErrorListener}. The
 * default implementation of each method does nothing, but can be overridden as
 * necessary.
 */
class BaseErrorListener(U, V) : ANTLRErrorListener!(U, V)
{

    public void syntaxError(Recognizer!(U, V) recognizer, Object offendingSymbol, int line,
        int charPositionInLine, string msg, RecognitionException!(U,V) e)
    {
    }

    public void reportAmbiguity(Parser recognizer, DFA dfa, int startIndex, int stopIndex,
        bool exact, BitSet ambigAlts, ATNConfigSet configs)
    {
    }

    public void reportAttemptingFullContext(Parser recognizer, DFA dfa, int startIndex, int stopIndex,
        BitSet conflictingAlts, ATNConfigSet configs)
    {
    }

    public void reportContextSensitivity(Parser recognizer, DFA dfa, int startIndex, int stopIndex,
        int prediction, ATNConfigSet configs)
    {
    }

}
