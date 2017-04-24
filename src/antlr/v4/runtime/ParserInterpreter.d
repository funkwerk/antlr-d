/*
 * [The "BSD license"]
 * Copyright (c) 2013 Terence Parr
 * Copyright (c) 2013 Sam Harwell
 *  Copyright (c) 2017 Egbert Voigt
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

module antlr.v4.runtime.ParserInterpreter;

import std.typecons;
import std.container : DList;
import antlr.v4.runtime.Parser;
import antlr.v4.runtime.InterpreterRuleContext;
import antlr.v4.runtime.ParserRuleContext;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.Vocabulary;
import antlr.v4.runtime.VocabularyImpl;
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.atn.DecisionState;
import antlr.v4.runtime.atn.PredictionContextCache;

alias ParentContextPair = Tuple!(ParserRuleContext, "a", int, "b");

// Class ParserInterpreter
/**
 * @uml
 * A parser simulator that mimics what ANTLR's generated
 * parser code does. A ParserATNSimulator is used to make
 * predictions via adaptivePredict but this class moves a pointer through the
 * ATN to simulate parsing. ParserATNSimulator just
 * makes us efficient rather than having to backtrack, for example.
 *
 * This properly creates parse trees even for left recursive rules.
 *
 * We rely on the left recursive rule invocation and special predicate
 * transitions to make left recursive rules work.
 *
 * See TestParserInterpreter for examples.
 */
class ParserInterpreter : Parser
{

    protected string grammarFileName;

    protected ATN atn;

    /**
     * @uml
     * not shared like it is for generated parsers
     */
    protected DFA[] decisionToDFA;

    protected PredictionContextCache sharedContextCache ;

    protected string[] tokenNames;

    protected string[] ruleNames;

    private Vocabulary vocabulary;

    /**
     * @uml
     * This stack corresponds to the _parentctx, _parentState pair of locals
     * that would exist on call stack frames with a recursive descent parser;
     * in the generated function for a left-recursive rule you'd see:
     *
     *  private EContext e(int _p) throws RecognitionException {
     *      ParserRuleContext _parentctx = _ctx;    // Pair.a
     *      int _parentState = getState();          // Pair.b
     *      ...
     *   }
     *
     * Those values are used to create new recursive rule invocation contexts
     * associated with left operand of an alt like "expr '*' expr".
     */
    protected DList!ParentContextPair _parentContextStack;

    /**
     * @uml
     * We need a map from (decision,inputIndex)->forced alt for computing ambiguous
     * parse trees. For now, we allow exactly one override.
     */
    protected int overrideDecision = -1;

    protected int overrideDecisionInputIndex = -1;

    protected int overrideDecisionAlt = -1;

    /**
     * @uml
     * latch and only override once; error might trigger infinite loop
     */
    protected bool overrideDecisionReached = false;;

    /**
     * @uml
     * What is the current context when we override a decisions?
     * This tellsus what the root of the parse tree is when using override
     * for an ambiguity/lookahead check.
     */
    protected InterpreterRuleContext overrideDecisionRoot = null;

    protected InterpreterRuleContext rootContext;

    /**
     * @uml
     * deprecated Use {@link #ParserInterpreter(String, Vocabulary, Collection, ATN, TokenStream)} instead.
     */
    public this(string grammarFileName, string[] tokenNames, string[] ruleNames, ATN atn,
        TokenStream input)
    {
        this(grammarFileName,
             VocabularyImpl.fromTokenNames(tokenNames.toArray(new String[tokenNames.size()])),
             ruleNames, atn, input);
    }

    public this(string grammarFileName, Vocabulary vocabulary, string[] ruleNames, ATN atn,
        TokenStream input)
    {
	super(input);
        this.grammarFileName = grammarFileName;
        this.atn = atn;
        for (int i = 0; i < tokenNames.length; i++) {
            tokenNames ~= vocabulary.getDisplayName(i);
        }

        this.ruleNames = ruleNames;
        this.vocabulary = vocabulary;

        // init decision DFA
        int numberOfDecisions = atn.getNumberOfDecisions();
        for (int i = 0; i < numberOfDecisions; i++) {
            DecisionState decisionState = atn.getDecisionState(i);
            decisionToDFA ~= new DFA(decisionState, i);
        }

        // get atn simulator that knows how to do predictions
        setInterpreter(new ParserATNSimulator(this, atn,
                                              decisionToDFA,
                                              sharedContextCache));
    }

    /**
     * @uml
     * @override
     */
    public override void reset()
    {
        super.reset();
        overrideDecisionReached = false;
        overrideDecisionRoot = null;
    }

    /**
     * @uml
     * @override
     */
    public override ATN getATN()
    {
        return atn;
    }

    /**
     * @uml
     * @override
     */
    public override string[] getTokenNames()
    {
    }

}
