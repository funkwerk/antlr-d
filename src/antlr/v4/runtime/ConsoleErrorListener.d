module antlr.v4.runtime.ConsoleErrorListener;

import antlr.v4.runtime.BaseErrorListener;

// Singleton Template ConsoleErrorListener
/**
 * TODO add class description
 */
class ConsoleErrorListener(U, V) : BaseErrorListener
{

    /**
     * The single instance of ConsoleErrorListener.
     */
    private static __gshared ConsoleErrorListener instance_;

    public void syntaxError(InterfaceRecognizer recognizer, Object offendingSymbol, int line,
        int charPositionInLine, string msg, RecognitionException!(U,V) e)
    {
    }

    /**
     * Creates the single instance of ConsoleErrorListener.
     */
    private shared static this()
    {
        instance_ = new ConsoleErrorListener;
    }

    /**
     * Returns: A single instance of ConsoleErrorListener.
     */
    public static ConsoleErrorListener instance()
    {
        return instance_;
    }

}
