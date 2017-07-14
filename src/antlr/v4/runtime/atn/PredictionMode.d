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

module antlr.v4.runtime.atn.PredictionMode;

import std.typecons;
import antlr.v4.runtime.atn.PredictionModeConst;
import antlr.v4.runtime.atn.ATNConfigSet;
import antlr.v4.runtime.misc.BitSet;

alias ATNConfigSetBitSetPair = Tuple!(ATNConfigSet, "a", BitSet, "b");

// Class PredictionMode
/**
 * Utility methods for analyzing configuration sets for conflicts and/or
 * ambiguities.
 */
class PredictionMode
{

    /**
     * Computes the SLL prediction termination condition.
     *
     * <p>
     * This method computes the SLL prediction termination condition for both of
     * the following cases.</p>
     *
     * <ul>
     * <li>The usual SLL+LL fallback upon SLL conflict</li>
     * <li>Pure SLL without LL fallback</li>
     * </ul>
     *
     * <p><strong>COMBINED SLL+LL PARSING</strong></p>
     *
     * <p>When LL-fallback is enabled upon SLL conflict, correct predictions are
     * ensured regardless of how the termination condition is computed by this
     * method. Due to the substantially higher cost of LL prediction, the
     * prediction should only fall back to LL when the additional lookahead
     * cannot lead to a unique SLL prediction.</p>
     *
     * <p>Assuming combined SLL+LL parsing, an SLL configuration set with only
     * conflicting subsets should fall back to full LL, even if the
     * configuration sets don't resolve to the same alternative (e.g.
     * {@code {1,2}} and {@code {3,4}}. If there is at least one non-conflicting
     * configuration, SLL could continue with the hopes that more lookahead will
     * resolve via one of those non-conflicting configurations.</p>
     *
     * <p>Here's the prediction termination rule them: SLL (for SLL+LL parsing)
     * stops when it sees only conflicting configuration subsets. In contrast,
     * full LL keeps going when there is uncertainty.</p>
     *
     * <p><strong>HEURISTIC</strong></p>
     *
     * <p>As a heuristic, we stop prediction when we see any conflicting subset
     * unless we see a state that only has one alternative associated with it.
     * The single-alt-state thing lets prediction continue upon rules like
     * (otherwise, it would admit defeat too soon):</p>
     *
     * <p>{@code [12|1|[], 6|2|[], 12|2|[]]. s : (ID | ID ID?) ';' ;}</p>
     *
     * <p>When the ATN simulation reaches the state before {@code ';'}, it has a
     * DFA state that looks like: {@code [12|1|[], 6|2|[], 12|2|[]]}. Naturally
     * {@code 12|1|[]} and {@code 12|2|[]} conflict, but we cannot stop
     * processing this node because alternative to has another way to continue,
     * via {@code [6|2|[]]}.</p>
     *
     * <p>It also let's us continue for this rule:</p>
     *
     * <p>{@code [1|1|[], 1|2|[], 8|3|[]] a : A | A | A B ;}</p>
     *
     * <p>After matching input A, we reach the stop state for rule A, state 1.
     * State 8 is the state right before B. Clearly alternatives 1 and 2
     * conflict and no amount of further lookahead will separate the two.
     * However, alternative 3 will be able to continue and so we do not stop
     * working on this state. In the previous example, we're concerned with
     * states associated with the conflicting alternatives. Here alt 3 is not
     * associated with the conflicting configs, but since we can continue
     * looking for input reasonably, don't declare the state done.</p>
     *
     * <p><strong>PURE SLL PARSING</strong></p>
     *
     * <p>To handle pure SLL parsing, all we have to do is make sure that we
     * combine stack contexts for configurations that differ only by semantic
     * predicate. From there, we can do the usual SLL termination heuristic.</p>
     *
     * <p><strong>PREDICATES IN SLL+LL PARSING</strong></p>
     *
     * <p>SLL decisions don't evaluate predicates until after they reach DFA stop
     * states because they need to create the DFA cache that works in all
     * semantic situations. In contrast, full LL evaluates predicates collected
     * during start state computation so it can ignore predicates thereafter.
     * This means that SLL termination detection can totally ignore semantic
     * predicates.</p>
     *
     * <p>Implementation-wise, {@link ATNConfigSet} combines stack contexts but not
     * semantic predicate contexts so we might see two configurations like the
     * following.</p>
     *
     * <p>{@code (s, 1, x, {}), (s, 1, x', {p})}</p>
     *
     * <p>Before testing these configurations against others, we have to merge
     * {@code x} and {@code x'} (without modifying the existing configurations).
     * For example, we test {@code (x+x')==x''} when looking for conflicts in
     * the following configurations.</p>
     *
     * <p>{@code (s, 1, x, {}), (s, 1, x', {p}), (s, 2, x'', {})}</p>
     *
     * <p>If the configuration set has predicates (as indicated by
     * {@link ATNConfigSet#hasSemanticContext}), this algorithm makes a copy of
     * the configurations to strip out all of the predicates so that a standard
     * {@link ATNConfigSet} will merge everything ignoring predicates.</p>
     */
    public static bool hasSLLConflictTerminatingPrediction(PredictionModeConst mode, ATNConfigSet configs)
    {
	/* Configs in rule stop states indicate reaching the end of the decision
         * rule (local context) or end of start rule (full context). If all
         * configs meet this condition, then none of the configurations is able
         * to match additional input so we terminate prediction.
         */
        if (allConfigsInRuleStopStates(configs)) {
            return true;
        }

        // pure SLL mode parsing
        if (mode == PredictionModeConst.SLL) {
            // Don't bother with combining configs from different semantic
            // contexts if we can fail over to full LL; costs more time
            // since we'll often fail over anyway.
            if (configs.hasSemanticContext) {
                // dup configs, tossing out semantic predicates
                ATNConfigSet dupli = new ATNConfigSet();
                foreach (ATNConfig c; configs.configs) {
                    c = new ATNConfig(c,SemanticContext.NONE);
                    dupli.add(c);
                }
                configs = dupli;
            }
            // now we have combined contexts for configs with dissimilar preds
        }

        // pure SLL or combined SLL+LL mode parsing

        BitSet[] altsets = getConflictingAltSubsets(configs);
        bool heuristic =
            hasConflictingAltSet(altsets) && !hasStateAssociatedWithOneAlt(configs);
        return heuristic;

    }

    public static bool hasConfigInRuleStopState(ATNConfigSet configs)
    {
	foreach (ATNConfig c; configs.donfigs) {
            if (c.state.classinstance == RuleStopState.classinstance) {
                return true;
            }
        }
        return false;
    }

    /**
     * Checks if all configurations in {@code configs} are in a
     * {@link RuleStopState}. Configurations meeting this condition have reached
     * the end of the decision rule (local context) or end of start rule (full
     * context).
     *
     * @param configs the configuration set to test
     * @return {@code true} if all configurations in {@code configs} are in a
     * {@link RuleStopState}, otherwise {@code false}
     */
    public static bool allConfigsInRuleStopStates(ATNConfigSet configs)
    {
	foreach (ATNConfig config; configs.configs) {
            if (config.state.classinstance !=RuleStopState.classinstance) {
                return false;
            }
        }
        return true;
    }

    public static int resolvesToJustOneViableAlt(BitSet[] altsets)
    {
    }

    public static bool allSubsetsConflict(BitSet[] altsets)
    {
    }

    public static bool hasNonConflictingAltSet(BitSet[] altsets)
    {
    }

    public static bool hasConflictingAltSet(BitSet[] altsets)
    {
	foreach (BitSet alts; altsets) {
            if (alts.cardinality >1) {
                return true;
            }
        }
        return false;
    }

    public static bool allSubsetsEqual(BitSet[] altsets)
    {
    }

    public static int getUniqueAlt(BitSet[] altsets)
    {
    }

    private static BitSet getAlts(BitSet[] altsets)
    {
    }

    public static BitSet getAlts(ATNConfigSet configs)
    {
    }

    public static BitSet[] getConflictingAltSubsets(ATNConfigSet configs)
    {
    }

    public static ATNConfigSetBitSetPair[] getStateToAltMap(ATNConfigSet configs)
    {
    }

    public static bool hasStateAssociatedWithOneAlt(ATNConfigSet configs)
    {
    }

    public static int getSingleViableAlt(BitSet[] altsets)
    {
    }

}
