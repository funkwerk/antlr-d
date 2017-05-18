/*
 * [The "BSD license"]
 *  Copyright (c) 2016 Terence Parr
 *  Copyright (c) 2016 Sam Harwell
 *  Copyright (c) 2017 Egbert Voigt
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *  3. The name of the author may not be used to endorse or promote products
 *     derived from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 *  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 *  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

module antlr.v4.runtime.atn.LexerATNSimulator;

import antlr.v4.runtime.atn.ATNSimulator;
import antlr.v4.runtime.IntStream;
import antlr.v4.runtime.Lexer;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.dfa.DFAState;
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.atn.ATNState;
import antlr.v4.runtime.atn.ATNConfigSet;
import antlr.v4.runtime.atn.LexerActionExecutor;
import antlr.v4.runtime.atn.LexerATNConfig;
import antlr.v4.runtime.atn.PredictionContextCache;
import antlr.v4.runtime.atn.SimState;
import antlr.v4.runtime.atn.Transition;
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

    protected int matchATN(CharStream input)
    {
	ATNState startState = atn.modeToStartState[mode];
        debug
            writefln("matchATN mode %1$d start: %2$s\n", mode, startState);
        int old_mode = mode;

        ATNConfigSet s0_closure = computeStartState(input, startState);
        bool suppressEdge = s0_closure.hasSemanticContext;

        s0_closure.hasSemanticContext = false;
        DFAState next = addDFAState(s0_closure);
        if (!suppressEdge) {
            decisionToDFA[mode].s0 = next;
        }

        int predict = execATN(input, next);

        debug
            writefln("DFA after matchATN: %1$s\n", decisionToDFA[old_mode].toLexerString());

        return predict;
    }

    protected int execATN(CharStream input, DFAState ds0)
    {
	//System.out.println("enter exec index "+input.index()+" from "+ds0.configs);
        debug {
            writefln("start state closure=%s\n", ds0.configs);
        }

        if (ds0.isAcceptState) {
            // allow zero-length tokens
            captureSimState(prevAccept, input, ds0);
        }

        int t = input.LA(1);

        DFAState s = ds0; // s is current/from DFA state

        while (true) { // while more work
            debug {
                writefln("execATN loop starting closure: %s\n", s.configs);
            }
            // As we move src->trg, src->trg, we keep track of the previous trg to
            // avoid looking up the DFA state again, which is expensive.
            // If the previous target was already part of the DFA, we might
            // be able to avoid doing a reach operation upon t. If s!=null,
            // it means that semantic predicates didn't prevent us from
            // creating a DFA state. Once we know s!=null, we check to see if
            // the DFA state has an edge already for t. If so, we can just reuse
            // it's configuration set; there's no point in re-computing it.
            // This is kind of like doing DFA simulation within the ATN
            // simulation because DFA simulation is really just a way to avoid
            // computing reach/closure sets. Technically, once we know that
            // we have a previously added DFA state, we could jump over to
            // the DFA simulator. But, that would mean popping back and forth
            // a lot and making things more complicated algorithmically.
            // This optimization makes a lot of sense for loops within DFA.
            // A character will take us back to an existing DFA state
            // that already has lots of edges out of it. e.g., .* in comments.
            DFAState target = getExistingTargetState(s, t);
            if (target is null) {
                target = computeTargetState(input, s, t);
            }

            if (target == ERROR) {
                break;
            }
            // If this is a consumable input element, make sure to consume before
            // capturing the accept state so the input index, line, and char
            // position accurately reflect the state of the interpreter at the
            // end of the token.
            if (t != IntStream.EOF) {
                consume(input);
            }

            if (target.isAcceptState) {
                captureSimState(prevAccept, input, target);
                if (t == IntStream.EOF) {
                    break;
                }
            }

            t = input.LA(1);
            s = target; // flip; current DFA target becomes new src/from state
        }

        return failOrAccept(prevAccept, input, s.configs, t);
    }

    /**
     * @uml
     * Get an existing target state for an edge in the DFA. If the target state
     * for the edge has not yet been computed or is otherwise not available,
     * this method returns {@code null}.
     *
     *  @param s The current DFA state
     *  @param t The next input symbol
     *  @return The existing target DFA state for the given input symbol
     * {@code t}, or {@code null} if the target state for this edge is not
     * already cached
     */
    public DFAState getExistingTargetState(DFAState s, int t)
    {
	if (s.edges is null || t < MIN_DFA_EDGE || t > MAX_DFA_EDGE) {
            return null;
        }

        DFAState target = s.edges[t - MIN_DFA_EDGE];
        if (target !is null)
            debug {
                writefln("reuse state %1$s"~
                         " edge to %2$s", s.stateNumber, target.stateNumber);
            }

        return target;
    }

    /**
     * @uml
     * Compute a target state for an edge in the DFA, and attempt to add the
     * computed state and corresponding edge to the DFA.
     *
     *  @param input The input stream
     *  @param s The current DFA state
     *  @param t The next input symbol
     *
     *  @return The computed target DFA state for the given input symbol
     * {@code t}. If {@code t} does not lead to a valid DFA state, this method
     * returns {@link #ERROR}.
     */
    protected DFAState computeTargetState(CharStream input, DFAState s, int t)
    {
	ATNConfigSet reach = new OrderedATNConfigSet();

        // if we don't find an existing DFA state
        // Fill reach starting from closure, following t transitions
        getReachableConfigSet(input, s.configs, reach, t);

        if (reach.isEmpty()) { // we got nowhere on t from s
            if (!reach.hasSemanticContext) {
                // we got nowhere on t, don't throw out this knowledge; it'd
                // cause a failover from DFA later.
                addDFAEdge(s, t, ERROR);
            }

            // stop when we can't match any more char
            return ERROR;
        }

        // Add an edge from s to target DFA found/created for reach
        return addDFAEdge(s, t, reach);
    }

    protected int failOrAccept(SimState prevAccept, CharStream input, ATNConfigSet reach,
        int t)
    {
	if (prevAccept.dfaState != null) {
            LexerActionExecutor lexerActionExecutor = prevAccept.dfaState.lexerActionExecutor;
            accept(input, lexerActionExecutor, startIndex,
                   prevAccept.index, prevAccept.line, prevAccept.charPos);
            return prevAccept.dfaState.prediction;
        }
        else {
            // if no accept and EOF is first char, return EOF
            if (t==IntStream.EOF && input.index()==startIndex ) {
                return Token.EOF;
            }

            throw new LexerNoViableAltException(recog, input, startIndex, reach);
        }
    }

    /**
     * @uml
     * Given a starting configuration set, figure out all ATN configurations
     * we can reach upon input {@code t}. Parameter {@code reach} is a return
     * parameter.
     */
    protected void getReachableConfigSet(CharStream input, ATNConfigSet closure, ATNConfigSet reach,
        int t)
    {
	// this is used to skip processing for configs which have a lower priority
        // than a config that already reached an accept state for the same rule
        int skipAlt = ATN.INVALID_ALT_NUMBER;
        foreach (ATNConfig c; closure) {
            bool currentAltReachedAcceptState = c.alt == skipAlt;
            if (currentAltReachedAcceptState && (cast(LexerATNConfig)c).hasPassedThroughNonGreedyDecision()) {
                continue;
            }

            debug {
                writefln("testing %s at %s\n", getTokenName(t), c.toString(recog, true));
            }

            int n = c.state.getNumberOfTransitions();
            for (int ti=0; ti<n; ti++) {               // for each transition
                Transition trans = c.state.transition(ti);
                ATNState target = getReachableTarget(trans, t);
                if (target !is null) {
                    LexerActionExecutor lexerActionExecutor = (cast(LexerATNConfig)c).getLexerActionExecutor();
                    if (lexerActionExecutor != null) {
                        lexerActionExecutor = lexerActionExecutor.fixOffsetBeforeMatch(input.index() - startIndex);
                    }

                    bool treatEofAsEpsilon = t == CharStream.EOF;
                    if (closure(input, new LexerATNConfig(cast(LexerATNConfig)c, target, lexerActionExecutor), reach, currentAltReachedAcceptState, true, treatEofAsEpsilon)) {
                        // any remaining configs for this alt have a lower priority than
                        // the one that just reached an accept state.
                        skipAlt = c.alt;
                        break;
                    }
                }
            }
        }

    }

    protected void accept(CharStream input, LexerActionExecutor lexerActionExecutor, int startIndex,
        int index, int line, int charPos)
    {
	debug {
            writefln(Locale.getDefault(), "ACTION %s\n", lexerActionExecutor);
        }

        // seek to after last char in token
        input.seek(index);
        this.line = line;
        this.charPositionInLine = charPos;

        if (lexerActionExecutor !is null && recog !is null) {
            lexerActionExecutor.execute(recog, input, startIndex);
        }
    }

    protected ATNState getReachableTarget(Transition trans, int t)
    {
    }

    protected ATNConfigSet computeStartState(CharStream input, ATNState p)
    {
    }

    /**
     * @uml
     * Since the alternatives within any lexer decision are ordered by
     * preference, this method stops pursuing the closure as soon as an accept
     * state is reached. After the first accept state is reached by depth-first
     * search from {@code config}, all other (potentially reachable) states for
     * this rule would have a lower priority.
     *
     *  @return {@code true} if an accept state is reached, otherwise
     * {@code false}.
     */
    public bool closure(CharStream input, LexerATNConfig config, ATNConfigSet configs, bool currentAltReachedAcceptState,
        bool speculative, bool treatEofAsEpsilon)
    {
    }

    /**
     * @uml
     * side-effect: can alter configs.hasSemanticContext
     */
    protected LexerATNConfig getEpsilonTarget(CharStream input, LexerATNConfig config, Transition t,
        ATNConfigSet configs, bool speculative, bool treatEofAsEpsilon)
    {
    }

}
