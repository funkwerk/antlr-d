module antlr.v4.runtime.BaseErrorListener;

import antlr.v4.runtime.ANTLRErrorListener;

// Class Template BaseErrorListener
/**
 * @uml
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
