/*
 * [The "BSD license"]
 *  Copyright (c) 2012 Terence Parr
 *  Copyright (c) 2012 Sam Harwell
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

module antlr.v4.runtime.dfa.DFASerializer;

import std.array;
import std.conv;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.dfa.DFAState;
import antlr.v4.runtime.Vocabulary;
import antlr.v4.runtime.VocabularyImpl;

// Class DFASerializer
/**
 * @uml
 * A DFA walker that knows how to dump them to serialized strings.
 */
class DFASerializer
{

    public DFA dfa;

    public Vocabulary vocabulary;

    public this(DFA dfa, string[] tokenNames)
    {
        this(dfa, VocabularyImpl.fromTokenNames(tokenNames));
    }

    public this(DFA dfa, Vocabulary vocabulary)
    {
        this.dfa = dfa;
        this.vocabulary = vocabulary;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
	if (dfa.s0 is null) return null;
        auto buf = appender!string;
        DFAState[] states = dfa.getStates;
        foreach (DFAState s; states) {
            size_t n = 0;
            if (s.edges !is null) n = s.edges.length;
            for (int i=0; i<n; i++) {
                DFAState t = s.edges[i];
                if (t !is null && t.stateNumber != int.max) {
                    buf.put(getStateString(s));
                    string label = getEdgeLabel(i);
                    buf.put("-");
                    buf.put(label);
                    buf.put("->");
                    buf.put(getStateString(t));
                    buf.put('\n');
                }
            }
        }

        string output = buf.data;
        if (output.length == 0) return null;
        //return Utils.sortLinesInString(output);
        return output;
    }

    public string getEdgeLabel(int i)
    {
	return vocabulary.getDisplayName(i - 1);
    }

    public string getStateString(DFAState s)
    {
	int n = s.stateNumber;
        string baseStateStr = (s.isAcceptState ? ":" : "") ~ "s" ~ to!string(n) ~
            (s.requiresFullContext ? "^" : "");
        if (s.isAcceptState) {
            if (s.predicates !is null) {
                return baseStateStr ~ "=>" ~ to!string(s.predicates);
            }
            else {
                return baseStateStr ~ "=>" ~ to!string(s.prediction);
            }
        }
        else {
            return baseStateStr;
        }

    }

}
