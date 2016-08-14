module antlr.v4.runtime.atn.PredictionContext;

import antlr.v4.runtime.atn.EmptyPredictionContext;
import antlr.v4.runtime.misc.DoubleKeyMap;

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
                                          PredictionContext mergeCache)
    {
        assert(a !is null && b !is null); // must be empty context, never null

        // share same graph if both same
        if (a is b || a.equals(b))
            return a;

        if (typeid(typeof(a)) == typeid(SingletonPredictionContext*) &&
            typeid(typeof(b)) == typeid(SingletonPredictionContext*))
            {
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
        if (typeid(typeof(a)) == typeid(SingletonPredictionContext*)) {
            b = new ArrayPredictionContext(cast(SingletonPredictionContext)b);
        }
        return mergeArrays(cast(ArrayPredictionContext) a, cast(ArrayPredictionContext) b,
                           rootIsWildcard, mergeCache);

    }

}
