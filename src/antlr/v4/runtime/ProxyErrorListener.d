module antlr.v4.runtime.ProxyErrorListener;

import std.bitmanip;
import antlr.v4.runtime.ANTLRErrorListener;
import antlr.v4.runtime.Recognizer;
import antlr.v4.runtime.RecognitionException;
import antlr.v4.runtime.atn.ParserATNSimulator;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.Parser;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.atn.ATNConfigSet;

// Class ProxyErrorListener
/**
 * @uml
 * This implementation of {@link ANTLRErrorListener} dispatches all calls to a
 * collection of delegate listeners. This reduces the effort required to support multiple
 * listeners.
 */
class ProxyErrorListener : ANTLRErrorListener!(Token, ParserATNSimulator)
{

    public ANTLRErrorListener!(Token, ParserATNSimulator)[] delegates;

    public this(ANTLRErrorListener!(Token, ParserATNSimulator)[] delegates)
    {
	if (delegates is null) {
            ASSERT(0, "Null pointer exception delegates");
        }
        this.delegates = delegates;
    }

    public void syntaxError(Recognizer!(Token, ParserATNSimulator) recognizer, Object offendingSymbol,
        int line, int charPositionInLine, string msg, RecognitionException!(Token, ParserATNSimulator) e)
    {
	foreach (ANTLRErrorListener listener; delegates) {
            listener.syntaxError(recognizer, offendingSymbol, line, charPositionInLine, msg, e);
        }
    }

    public void reportAmbiguity(DFA dfa, int startIndex, int stopIndex, bool exact, BitArray ambigAlts,
        ATNConfigSet configs)
    {
	foreach (ANTLRErrorListener listener; delegates) {
            listener.reportAmbiguity(recognizer, dfa, startIndex, stopIndex, exact, ambigAlts, configs);
        }
    }

    public void reportAttemptingFullContext(Parser recognizer, DFA dfa, int startIndex, int stopIndex,
        BitArray conflictingAlts, ATNConfigSet configs)
    {
	foreach (ANTLRErrorListener listener; delegates) {
            listener.reportAttemptingFullContext(recognizer, dfa, startIndex, stopIndex, conflictingAlts, configs);
        }
    }

    public void reportContextSensitivity(Parser recognizer, DFA dfa, int startIndex, int stopIndex,
        int prediction, ATNConfigSet configs)
    {
	foreach (ANTLRErrorListener listener; delegates) {
            listener.reportContextSensitivity(recognizer, dfa, startIndex, stopIndex, prediction, configs);
        }
    }

}
