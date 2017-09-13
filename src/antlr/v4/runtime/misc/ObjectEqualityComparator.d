module antlr.v4.runtime.misc.ObjectEqualityComparator;

import antlr.v4.runtime.misc.AbstractEqualityComparator;

// Singleton ObjectEqualityComparator
/**
 * This default implementation of {@link EqualityComparator} uses object equality
 * for comparisons by calling {@link Object#hashCode} and {@link Object#equals}.
 *
 * @author Sam Harwell
 */
class ObjectEqualityComparator : AbstractEqualityComparator!Object
{

    /**
     * The single instance of ObjectEqualityComparator.
     */
    private static __gshared ObjectEqualityComparator instance_;

    /**
     * <p>This implementation returns
     * {@code obj.}{@link Object#hashCode hashCode()}.</p>
     * @uml
     * @safe
     * @nothrow
     */
    public static size_t hashOf(Object obj) @safe nothrow
    {
        if (obj is null) {
            return 0;
        }
        if (size_t.sizeof == 4)
            return obj.toHash >> 3;
        else
            return obj.toHash >> 5;
    }

    public static bool opEquals(Object a, Object b)
    {
	if (a is null) {
            return b is null;
        }
        return a == b;
    }

    /**
     * Creates the single instance of ObjectEqualityComparator.
     */
    private shared static this()
    {
        instance_ = new ObjectEqualityComparator;
    }

    /**
     * Returns: A single instance of ObjectEqualityComparator.
     */
    public static ObjectEqualityComparator instance()
    {
        return instance_;
    }

}

unittest
{
    class X {static long b;}
    class Y {int a;}
    auto xx = new X;
    auto yy = new Y;
    auto zz = new X;
    auto testObj = new ObjectEqualityComparator;
    auto x = testObj.hashOf(testObj);
    assert(ObjectEqualityComparator.hashOf(yy) != ObjectEqualityComparator.hashOf(xx));
    assert(ObjectEqualityComparator.hashOf(zz) != ObjectEqualityComparator.hashOf(xx));
    assert(ObjectEqualityComparator.hashOf(zz) != ObjectEqualityComparator.hashOf(yy));
    auto testObj2 = ObjectEqualityComparator.instance;
    assert(testObj.hashOf(testObj2) != testObj.toHash);
    auto testObj3 = ObjectEqualityComparator.instance;
    assert(testObj2.hashOf(null) == 0);
    assert(testObj.opEquals(null, testObj2) == false);
    assert(testObj2.opEquals(testObj3, testObj2) == true);
}
