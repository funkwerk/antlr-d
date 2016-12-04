module antlr.v4.runtime.Lexer;

import antlr.v4.runtime.Recognizer;
import antlr.v4.runtime.atn.LexerATNSimulator;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.CharStream;

// Class Lexer
/**
 * TODO add class description
 */
abstract class Lexer : Recognizer!(int, LexerATNSimulator)
{

    public static immutable int MIN_CHAR_VALUE = char.min;

    public static immutable int MAX_CHAR_VALUE = char.max;

    public static immutable int DEFAULT_MODE = 0;

    public static immutable int MORE = -2;

    public static immutable int SKIP = -3;

    public static immutable int DEFAULT_TOKEN_CHANNEL = Token.DEFAULT_CHANNEL;

    public static immutable int HIDDEN = Token.HIDDEN_CHANNEL;

    public CharStream _input;

}
