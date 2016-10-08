/*
 * [The "BSD license"]
 *  Copyright (c) 2016 Terence Parr
 *  Copyright (c) 2016 Sam Harwell
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

module antlr.v4.runtime.atn.PredictionContext;

import std.array;
import std.conv;
import antlr.v4.runtime.Recognizer;
import antlr.v4.runtime.RuleContext;
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.atn.ATNState;
import antlr.v4.runtime.atn.EmptyPredictionContext;
import antlr.v4.runtime.atn.SingletonPredictionContext;
import antlr.v4.runtime.atn.ArrayPredictionContext;
import antlr.v4.runtime.atn.RuleTransition;
import antlr.v4.runtime.atn.ATNSimulator;
import antlr.v4.runtime.misc.DoubleKeyMap;
import antlr.v4.runtime.misc.MurmurHash;

// Class PredictionContext
/**
 * TODO add class description
 */
abstract class PredictionContext
{

    /**
     * @uml
     * Represents {@code $} in local context prediction, which means wildcard.
     * {@code *+x = *}.
     */
    public static EmptyPredictionContext EMPTY;

    /**
     * @uml
     * Represents {@code $} in an array in full context mode, when {@code $}
     * doesn't mean wildcard: {@code $ + x = [$,x]}. Here,
     * {@code $} = {@link #EMPTY_RETURN_STATE}.
     */
    public static const int EMPTY_RETURN_STATE = int.max;

    private static immutable int INITIAL_HASH = 1;

    public int id;

    /**
     * @uml
     * Stores the computed hash code of this {@link PredictionContext}. The hash
     * code is computed in parts to match the following reference algorithm.
     *
     * <pre>
     * private int referenceHashCode() {
     *    int hash = {@link MurmurHash#initialize MurmurHash.initialize}({@link #INITIAL_HASH});
     *
     *    for (int i = 0; i &lt; {@link #size()}; i++) {
     *       hash = {@link MurmurHash#update MurmurHash.update}(hash, {@link #getParent getParent}(i));
     *     }
     *
     *    for (int i = 0; i &lt; {@link #size()}; i++) {
     *        hash = {@link MurmurHash#update MurmurHash.update}(hash, {@link #getReturnState getReturnState}(i));
     *     }
     *
     *    hash = {@link MurmurHash#finish MurmurHash.finish}(hash, 2 * {@link #size()});
     *    return hash;
     *   }
     * </pre>
     */
    public int cachedHashCode;

    public this()
    {
        EMPTY = new EmptyPredictionContext();
    }

    public this(int cachedHashCode)
    {
        this.cachedHashCode = cachedHashCode;
    }

    public PredictionContext[] fromRuleContext(ATN atn, RuleContext outerContext)
    {
        if (outerContext is null)
            outerContext = new RuleContext().EMPTY;

        // if we are in RuleContext of start rule, s, then PredictionContext
        // is EMPTY. Nobody called us. (if we are empty, return empty)
        if ( outerContext.parent is null ||
             outerContext == new RuleContext().EMPTY ) {
            return PredictionContext().EMPTY;
        }

        // If we have a parent, convert it to a PredictionContext graph
        PredictionContext parent = EMPTY;
        parent = PredictionContext.fromRuleContext(atn, outerContext.parent);

        ATNState state = atn.states.get(outerContext.invokingState);
        RuleTransition transition = cast(RuleTransition)state.transition(0);
        return SingletonPredictionContext.create(parent, transition.followState.stateNumber);
    }

    abstract public size_t size();

    abstract public PredictionContext getParent(int index);

    abstract public int getReturnState(int index);

    /**
     * @uml
     * This means only the {@link #EMPTY} context is in set.
     */
    public bool isEmpty()
    {
        return this == EMPTY;
    }

    public bool hasEmptyPath()
    {
        return getReturnState(to!int(size() - 1)) == EMPTY_RETURN_STATE;
    }

    public int hashCode()
    {
        return cachedHashCode;
    }

    /**
     * @uml
     * @override
     */
    abstract public override bool opEquals(Object obj);

    public static int calculateEmptyHashCode()
    {
        int hash = MurmurHash.initialize(INITIAL_HASH);
        hash = MurmurHash.finish(hash, 0);
        return hash;
    }

    public int calculateHashCode(PredictionContext parent, int returnState)
    {
        int hash = MurmurHash.initialize(INITIAL_HASH);
        hash = MurmurHash.update!PredictionContext(hash, parent);
        hash = MurmurHash.update(hash, returnState);
        hash = MurmurHash.finish(hash, 2);
        return hash;
    }

    public static int calculateHashCode(PredictionContext[] parents, int[] returnStates)
    {
        int hash = MurmurHash.initialize(INITIAL_HASH);

        foreach (parent; parents) {
            hash = MurmurHash.update!PredictionContext(hash, parent);
        }

        foreach (returnState; returnStates) {
            hash = MurmurHash.update(hash, returnState);
        }

        hash = MurmurHash.finish(hash, 2 * parents.length);
        return hash;
    }

    public static PredictionContext merge(PredictionContext a, PredictionContext b, bool rootIsWildcard,
                                          DoubleKeyMap!(PredictionContext, PredictionContext, PredictionContext,) mergeCache)
    {
        assert(a !is null && b !is null); // must be empty context, never null

        // share same graph if both same
        if (a == b || a.opEquals(b) ) return a;

        if (typeid(typeof(a)) == typeid(SingletonPredictionContext*) &&
            typeid(typeof(b)) == typeid(SingletonPredictionContext*)) {
            return mergeSingletons(cast(SingletonPredictionContext)a,
                                   cast(SingletonPredictionContext)b,
                                   rootIsWildcard, mergeCache);
        }

        // At least one of a or b is array
        // If one is $ and rootIsWildcard, return $ as * wildcard
        if ( rootIsWildcard ) {
            if (typeid(typeof(a)) == typeid(EmptyPredictionContext*)) return a;
            if (typeid(typeof(b)) == typeid(EmptyPredictionContext*)) return b;
        }

        // convert singleton so both are arrays to normalize
        if (typeid(typeof(a)) == typeid(SingletonPredictionContext*)) {
            a = new ArrayPredictionContext(cast(SingletonPredictionContext)a);
        }
        if (typeid(typeof(b)) == typeid(SingletonPredictionContext*)) {
            b = new ArrayPredictionContext(cast(SingletonPredictionContext)b);
        }
        return mergeArrays(cast(ArrayPredictionContext) a, cast(ArrayPredictionContext) b,
                           rootIsWildcard, mergeCache);
    }

    /**
     * @uml
     * Merge two {@link SingletonPredictionContext} instances.
     *
     * <p>Stack tops equal, parents merge is same; return left graph.<br>
     * <embed src="images/SingletonMerge_SameRootSamePar.svg" type="image/svg+xml"/></p>
     *
     * <p>Same stack top, parents differ; merge parents giving array node, then
     * remainders of those graphs. A new root node is created to point to the
     * merged parents.<br>
     * <embed src="images/SingletonMerge_SameRootDiffPar.svg" type="image/svg+xml"/></p>
     *
     * <p>Different stack tops pointing to same parent. Make array node for the
     * root where both element in the root point to the same (original)
     * parent.<br>
     * <embed src="images/SingletonMerge_DiffRootSamePar.svg" type="image/svg+xml"/></p>
     *
     * <p>Different stack tops pointing to different parents. Make array node for
     * the root where each element points to the corresponding original
     * parent.<br>
     * <embed src="images/SingletonMerge_DiffRootDiffPar.svg" type="image/svg+xml"/></p>
     *
     *  @param a the first {@link SingletonPredictionContext}
     *  @param b the second {@link SingletonPredictionContext}
     *  @param rootIsWildcard {@code true} if this is a local-context merge,
     *  otherwise false to indicate a full-context merge
     *  @param mergeCache
     */
    public static PredictionContext mergeSingletons(SingletonPredictionContext a, SingletonPredictionContext b,
                                                    bool rootIsWildcard, DoubleKeyMap!(PredictionContext, PredictionContext, PredictionContext,) mergeCache)
    {
        if (mergeCache !is null ) {
            PredictionContext previous = mergeCache.get(a, b);
            if (previous) return previous;
            previous = mergeCache.get(b, a);
            if (previous) return previous;
        }

        PredictionContext rootMerge = mergeRoot(a, b, rootIsWildcard);
        if ( rootMerge !is null ) {
            if (mergeCache !is null ) mergeCache.put(a, b, rootMerge);
            return rootMerge;
        }

        if (a.returnState == b.returnState) { // a == b
            PredictionContext parent = merge(a.parent, b.parent, rootIsWildcard, mergeCache);
            // if parent is same as existing a or b parent or reduced to a parent, return it
            if ( parent == a.parent ) return a; // ax + bx = ax, if a=b
            if ( parent == b.parent ) return b; // ax + bx = bx, if a=b
            // else: ax + ay = a'[x,y]
            // merge parents x and y, giving array node with x,y then remainders
            // of those graphs.  dup a, a' points at merged array
            // new joined parent so create new singleton pointing to it, a'
            PredictionContext a_ = SingletonPredictionContext.create(parent, a.returnState);
            if (mergeCache !is null) mergeCache.put(a, b, a_);
            return a_;
        }
        else { // a != b payloads differ
            // see if we can collapse parents due to $+x parents if local ctx
            PredictionContext singleParent = null;
            if (a == b || (a.parent !is null && a.parent.opEquals(b.parent))) { // ax + bx = [a,b]x
                singleParent = a.parent;
            }
            if (singleParent !is null) {     // parents are same
                // sort payloads and use same parent
                int[] payloads = {a.returnState, b.returnState};
                if ( a.returnState > b.returnState ) {
                    payloads[0] = b.returnState;
                    payloads[1] = a.returnState;
                }
                PredictionContext[] parents = {singleParent, singleParent};
                PredictionContext a_ = new ArrayPredictionContext(parents, payloads);
                if (mergeCache !is null) mergeCache.put(a, b, a_);
                return a_;
            }
            // parents differ and can't merge them. Just pack together
            // into array; can't merge.
            // ax + by = [ax,by]
            int[] payloads = {a.returnState, b.returnState};
            PredictionContext[] parents = {a.parent, b.parent};
            if ( a.returnState > b.returnState ) { // sort by payload
                payloads[0] = b.returnState;
                payloads[1] = a.returnState;
                parents.length = 0;
                parents ~= b.parent;
                parents ~= a.parent;
            }
            PredictionContext a_ = new ArrayPredictionContext(parents, payloads);
            if (mergeCache !is null ) mergeCache.put(a, b, a_);
            return a_;
        }
    }

    public string[] toStrings(Recognizer!(int, ATNSimulator) recognizer, PredictionContext stop,
                              int currentState)
    {
        string[] result;
    outer:
        for (int perm = 0; ; perm++) {
            int offset = 0;
            bool last = true;
            PredictionContext p = this;
            int stateNumber = currentState;
            auto localBuffer = appender!string;
            localBuffer.put("[");
            while (!p.isEmpty() && p != stop) {
                int index = 0;
                if (p.size > 0) {
                    int bits = 1;
                    while ((1 << bits) < p.size) {
                        bits++;
                    }
                    int mask = (1 << bits) - 1;
                    index = (perm >> offset) & mask;
                    last &= index >= p.size - 1;
                    if (index >= p.size) {
                        continue outer;
                    }
                    offset += bits;
                }
                if (recognizer !is null) {
                    if (localBuffer.data.length > 1) {
                        // first char is '[', if more than that this isn't the first rule
                        localBuffer.put(' ');
                    }
                    ATN atn = recognizer.getATN();
                    ATNState s = atn.states.get(stateNumber);
                    string ruleName = recognizer.getRuleNames()[s.ruleIndex];
                    localBuffer.put(ruleName);
                }
                else if ( p.getReturnState(index)!= EMPTY_RETURN_STATE) {
                    if ( !p.isEmpty ) {
                        if (localBuffer.data.length > 1) {
                            // first char is '[', if more than that this isn't the first rule
                            localBuffer.put(' ');
                        }

                        localBuffer.put(to!string(p.getReturnState(index)));
                    }
                }
                stateNumber = p.getReturnState(index);
                p = p.getParent(index);
            }
            localBuffer.put("]");
            result ~= localBuffer.data;

            if (last) {
                break;
            }
        }
        return result;
    }

}
