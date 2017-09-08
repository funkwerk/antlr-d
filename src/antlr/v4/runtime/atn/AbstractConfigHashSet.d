module antlr.v4.runtime.atn.AbstractConfigHashSet;

import antlr.v4.runtime.atn.ATNConfig;
import antlr.v4.runtime.misc.Array2DHashSet;
import antlr.v4.runtime.misc.AbstractEqualityComparator;

// Class AbstractConfigHashSet
/**
 * TODO add class description
 */
abstract class AbstractConfigHashSet : Array2DHashSet!ATNConfig
{

    public this(AbstractEqualityComparator!ATNConfig comparator)
    {
        this(comparator, 16, 2);
    }

    public this(AbstractEqualityComparator!ATNConfig comparator, int initialCapacity, int initialBucketCapacity)
    {
        super(comparator, initialCapacity, initialBucketCapacity);
    }

    public ATNConfig[][] createBuckets(int capacity)
    {
        ATNConfig[][] atnConfigs;
        atnConfigs.length = capacity;
        return atnConfigs;
    }

    public ATNConfig[] createBucket(int capacity)
    {
        ATNConfig[] atnConfig;
        atnConfig.length = capacity;
        return atnConfig;
    }

}
