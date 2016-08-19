module antlr.v4.runtime.atn.PredictionContext;

import antlr.v4.runtime.Recognizer;
import antlr.v4.runtime.atn.EmptyPredictionContext;
import antlr.v4.runtime.atn.SingletonPredictionContext;
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
    public static const EmptyPredictionContext EMPTY;

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

    private this(int cachedHashCode)
    {
        this.cachedHashCode = cachedHashCode;
    }

    abstract public int size();

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
        return getReturnState(size() - 1) == EMPTY_RETURN_STATE;
    }

    public int hashCode()
    {
        return cachedHashCode;
    }

    abstract public bool opEquals();

    private static int calculateEmptyHashCode()
    {
        int hash = MurmurHash.initialize(INITIAL_HASH);
        hash = MurmurHash.finish(hash, 0);
        return hash;
    }

    public static int calculateHashCode(PredictionContext[] parents, int[] returnStates)
    {
        int hash = MurmurHash.initialize(INITIAL_HASH);

        foreach (PredictionContext parent; parents) {
            hash = MurmurHash.update(hash, parent);
        }

        foreach (int returnState; returnStates) {
            hash = MurmurHash.update(hash, returnState);
        }

        hash = MurmurHash.finish(hash, 2 * parents.length);
        return hash;
    }

    public static PredictionContext merge(PredictionContext a, PredictionContext b, bool rootIsWildcard,
                                          DoubleKeyMap!(PredictionContext, PredictionContext, PredictionContext,) mergeCache)
    {
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
        if ( rootMerge!=null ) {
            if ( mergeCache!=null ) mergeCache.put(a, b, rootMerge);
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
            if ( mergeCache!=null ) mergeCache.put(a, b, a_);
            return a_;
        }
        else { // a != b payloads differ
            // see if we can collapse parents due to $+x parents if local ctx
            PredictionContext singleParent = null;
            if ( a==b || (a.parent!=null && a.parent.equals(b.parent)) ) { // ax + bx = [a,b]x
                singleParent = a.parent;
            }
            if ( singleParent!=null ) {     // parents are same
                // sort payloads and use same parent
                int[] payloads = {a.returnState, b.returnState};
                if ( a.returnState > b.returnState ) {
                    payloads[0] = b.returnState;
                    payloads[1] = a.returnState;
                }
                PredictionContext[] parents = {singleParent, singleParent};
                PredictionContext a_ = new ArrayPredictionContext(parents, payloads);
                if ( mergeCache!=null ) mergeCache.put(a, b, a_);
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
                parents = b.parent ~ a.parent;
            }
            PredictionContext a_ = new ArrayPredictionContext(parents, payloads);
            if ( mergeCache!=null ) mergeCache.put(a, b, a_);
            return a_;
        }
    }

    public string[] oStrings(Recognizer!(void, void) recognizer, PredictionContext stop,
                             int currentState)
    {

    outer:
        for (int perm = 0; ; perm++) {
            int offset = 0;
            boolean last = true;
            PredictionContext p = this;
            int stateNumber = currentState;
            StringBuilder localBuffer = new StringBuilder();
            localBuffer.append("[");
            while ( !p.isEmpty() && p != stop ) {
                int index = 0;
                if (p.size() > 0) {
                    int bits = 1;
                    while ((1 << bits) < p.size()) {
                        bits++;
                    }

                    int mask = (1 << bits) - 1;
                    index = (perm >> offset) & mask;
                    last &= index >= p.size() - 1;
                    if (index >= p.size()) {
                        continue outer;
                    }
                    offset += bits;
                }

                if ( recognizer!=null ) {
                    if (localBuffer.length() > 1) {
                        // first char is '[', if more than that this isn't the first rule
                        localBuffer.append(' ');
                    }

                    ATN atn = recognizer.getATN();
                    ATNState s = atn.states.get(stateNumber);
                    String ruleName = recognizer.getRuleNames()[s.ruleIndex];
                    localBuffer.append(ruleName);
                }
                else if ( p.getReturnState(index)!= EMPTY_RETURN_STATE) {
                    if ( !p.isEmpty() ) {
                        if (localBuffer.length() > 1) {
                            // first char is '[', if more than that this isn't the first rule
                            localBuffer.append(' ');
                        }

                        localBuffer.append(p.getReturnState(index));
                    }
                }
                stateNumber = p.getReturnState(index);
                p = p.getParent(index);
            }
            localBuffer.append("]");
            result.add(localBuffer.toString());

            if (last) {
                break;
            }
        }

        return result.toArray(new String[result.size()]);

    }

}
