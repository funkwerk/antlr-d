module antlr.v4.runtime.atn.ErrorInfo;

import antlr.v4.runtime.atn.DecisionEventInfo;

// Class ErrorInfo
/**
 * @uml
 * This class represents profiling event information for a syntax error
 * identified during prediction. Syntax errors occur when the prediction
 * algorithm is unable to identify an alternative which would lead to a
 * successful parse.
 *
 *  @see Parser#notifyErrorListeners(Token, String, RecognitionException)
 *  @see ANTLRErrorListener#syntaxError
 */
class ErrorInfo : DecisionEventInfo
{

    public undefined x;

    /**
     * @uml
     * Constructs a new instance of the {@link ErrorInfo} class with the
     *          * specified detailed syntax error information.
     *          *
     *          * @param decision The decision number
     *          * @param configs The final configuration set reached during prediction
     *          * prior to reaching the {@link ATNSimulator#ERROR} state
     *          * @param input The input token stream
     *          * @param startIndex The start index for the current prediction
     *          * @param stopIndex The index at which the syntax error was identified
     *  @param fullCtx {@code true} if the syntax error was identified during LL
     *  prediction; otherwise, {@code false} if the syntax error was identified
     *  during SLL prediction
     */
    public this(int decision)
    {
    }

}
