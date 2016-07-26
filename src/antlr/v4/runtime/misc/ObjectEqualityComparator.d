module antlr.v4.runtime.misc.ObjectEqualityComparator;

import antlr.v4.runtime.misc.AbstractEqualityComparator;

// Class ObjectEqualityComparator
/**
 * TODO add class description
 */
class ObjectEqualityComparator : AbstractEqualityComparator!Object
{

    public static const ObjectEqualityComparator INSTANCE = new ObjectEqualityComparator();

    public int hashCode(Object obj)
    {
    }

    /**
     * @uml
     * This implementation relies on object equality. If both objects are
     *  {@code null}, this method returns {@code true}. Otherwise if only
     *  {@code a} is {@code null}, this method returns {@code false}. Otherwise,
     *  this method returns the result of
     *  {@code a.}{@link Object#equals equals}{@code (b)}.
     */
    public bool equals(Object a, Object b)
    {
    }

}
