module antlr.v4.runtime.atn.LexerATNSimulator;

import antlr.v4.runtime.atn.ATNSimulator;
import antlr.v4.runtime.Lexer;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.atn.PredictionContextCache;
import antlr.v4.runtime.atn.SimState;
import antlr.v4.runtime.CharStream;

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

    /**
     * @uml
     * line number 1..n within the input
     */
    protected int line = 1;

    /**
     * @uml
     * The index of the character relative to the beginning of the line 0..n-1
     */
    protected int charPositionInLine = 0;

    public DFA[] decisionToDFA;

    protected int mode = Lexer.DEFAULT_MODE;

    protected SimState prevAccept;

    public static int match_calls = 0;

    public this(ATN atn, DFA[] decisionToDFA, PredictionContextCache sharedContextCache)
    {
        this(null, atn, decisionToDFA,sharedContextCache);
    }

    public this(Lexer recog, ATN atn, DFA[] decisionToDFA, PredictionContextCache sharedContextCache)
    {
        super(atn, sharedContextCache);
        this.decisionToDFA = decisionToDFA;
        this.recog = recog;
    }

    public void copyState(LexerATNSimulator simulator)
    {
        this.charPositionInLine = simulator.charPositionInLine;
        this.line = simulator.line;
        this.mode = simulator.mode;
        this.startIndex = simulator.startIndex;
    }

    public int match(CharStream input, int mode)
    {
	match_calls++;
        this.mode = mode;
        int mark = input.mark();
        try {
            this.startIndex = input.index();
            this.prevAccept.reset();
            DFA dfa = decisionToDFA[mode];
            if ( dfa.s0 is null ) {
                return matchATN(input);
            }
            else {
                return execATN(input, dfa.s0);
            }
        }
        finally {
            input.release(mark);
        }
    }

    /**
     * @uml
     * @override
     */
    public override void reset()
    {
        prevAccept.reset();
        startIndex = -1;
        line = 1;
        charPositionInLine = 0;
        mode = Lexer.DEFAULT_MODE;
    }

    /**
     * @uml
     * @override
     */
    public override void clearDFA()
    {
	for (int d = 0; d < decisionToDFA.length; d++) {
            decisionToDFA[d] = new DFA(atn.getDecisionState(d), d);
        }
    }

}
