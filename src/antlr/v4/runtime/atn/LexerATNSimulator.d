module antlr.v4.runtime.atn.LexerATNSimulator;

import antlr.v4.runtime.atn.ATNSimulator;
import antlr.v4.runtime.Lexer;

// Class LexerATNSimulator
/**
 * "dup" of ParserInterpreter
 */
class LexerATNSimulator : ATNSimulator
{

    public static bool debug_flag = false;

    /**
     * @uml
     * false
     */
    public static bool dfa_debug;

    public static immutable int MIN_DFA_EDGE = 0;

    public static immutable int MAX_DFA_EDGE = 127;

    protected Lexer recog;

    /**
     * @uml
     * The current token's starting index into the character stream.
     * Shared across DFA to ATN simulation in case the ATN fails and the
     * DFA did not have a previous accept state. In this case, we use the
     * ATN-generated exception object.
     */
    protected int startIndex = -1;

}
