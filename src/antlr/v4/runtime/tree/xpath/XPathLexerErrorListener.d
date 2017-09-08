module antlr.v4.runtime.tree.xpath.XPathLexerErrorListener;

import antlr.v4.runtime.BaseErrorListener;
import antlr.v4.runtime.Recognizer;
import antlr.v4.runtime.RecognitionException;
import antlr.v4.runtime.atn.LexerATNSimulator;

// Class XPathLexerErrorListener
/**
 * TODO add class description
 */
class XPathLexerErrorListener : BaseErrorListener!(int, LexerATNSimulator)
{

    /**
     * @uml
     * @override
     */
    public override void syntaxError(Recognizer!(int, LexerATNSimulator) recognizer, Object offendingSymbol,
        int line, int charPositionInLine, string msg, RecognitionException!(int, LexerATNSimulator) e)
    {
    }

}
