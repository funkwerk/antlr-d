module antlr.v4.runtime.atn.ConfigEqualityComparator;

import antlr.v4.runtime.misc.AbstractEqualityComparator;
import antlr.v4.runtime.atn.ATNConfig;

// Singleton ConfigEqualityComparator
/**
 * TODO add class description
 */
class ConfigEqualityComparator : AbstractEqualityComparator!ATNConfig
{

    /**
     * The single instance of ConfigEqualityComparator.
     */
    private static __gshared ConfigEqualityComparator instance_;

    /**
     * @uml
     * @nothrow
     * @safe
     */
    public static size_t hashOf(ATNConfig o) @safe nothrow
    {
	size_t hashCode = 7;
        hashCode = 31 * hashCode + o.state.stateNumber;
        hashCode = 31 * hashCode + o.alt;
        hashCode = 31 * hashCode + o.semanticContext.toHash;
        return hashCode;
    }

    public static bool opEquals(ATNConfig a, ATNConfig b)
    {
	if (a == b)
            return true;
        if (a is null || b is null)
            return false;
        return a.state.stateNumber == b.state.stateNumber
            && a.alt == b.alt
            && a.semanticContext.opEquals(b.semanticContext);
    }

    /**
     * Creates the single instance of ConfigEqualityComparator.
     */
    private shared static this()
    {
        instance_ = new ConfigEqualityComparator;
    }

    /**
     * Returns: A single instance of ConfigEqualityComparator.
     */
    public static ConfigEqualityComparator instance()
    {
        return instance_;
    }

}
