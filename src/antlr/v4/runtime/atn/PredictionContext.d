module antlr.v4.runtime.atn.PredictionContext;

import antlr.v4.runtime.atn.EmptyPredictionContext;

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
    public static const EmptyPredictionContext EMPTY = new EmptyPredictionContext();

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
    }

    private this(int cachedHashCode)
    {
    }

}
