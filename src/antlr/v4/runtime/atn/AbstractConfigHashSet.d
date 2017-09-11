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

    public this(size_t function(Object o) @trusted nothrow hashOfFp, bool function(Object a, Object b) opEqualsFp)
    {
        this(hashOfFp, opEqualsFp, 16, 2);
    }

    public this(size_t function(Object o) @trusted nothrow hashOfFp, bool function(Object a, Object b) opEqualsFp,
        int initialCapacity, int initialBucketCapacity)
    {
        super(hashOfFp, opEqualsFp, initialCapacity, initialBucketCapacity);
    }

    /**
     * @uml
     * @override
     */
    public override ATNConfig[][] createBuckets(int capacity)
    {
        ATNConfig[][] atnConfigs;
        atnConfigs.length = capacity;
        return atnConfigs;
    }

    /**
     * @uml
     * @override
     */
    public override ATNConfig[] createBucket(int capacity)
    {
        ATNConfig[] atnConfig;
        atnConfig.length = capacity;
        return atnConfig;
    }

}
