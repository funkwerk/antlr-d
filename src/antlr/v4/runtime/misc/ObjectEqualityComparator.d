module antlr.v4.runtime.misc.ObjectEqualityComparator;

import antlr.v4.runtime.misc.AbstractEqualityComparator;

// Class ObjectEqualityComparator
/**
 * TODO add class description
 */
class ObjectEqualityComparator : AbstractEqualityComparator!Object
{

    public static const ObjectEqualityComparator INSTANCE = new ObjectEqualityComparator();

    public T hashCode(T)(T* obj)
    {
        if (obj is null) {
            return 0;
        }

        return obj.toHash();
    }

    public int hashCode(int obj)
    {
        return obj.toHash();
    }

    /**
     * @uml
     * This implementation relies on object equality. If both objects are
     *  {@code null}, this method returns {@code true}. Otherwise if only
     *  {@code a} is {@code null}, this method returns {@code false}. Otherwise,
     *  this method returns the result of
     *  {@code a.}{@link Object#equals equals}{@code (b)}.
     */
    public bool equals(T)(T a, T b)
    {
        if (a is null) {
            return b is null;
        }

        return *a == *b;
    }
    public bool equals(int a, int b)
    {
        if (a is null) {
            return b is null;
        }

        return a.opEquals(b);
    }

}
