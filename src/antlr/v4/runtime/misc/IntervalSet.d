module antlr.v4.runtime.misc.IntervalSet;

import std.container.rbtree;
import antlr.v4.runtime.Vocabulary;
import antlr.v4.runtime.misc.IntegerList;
import antlr.v4.runtime.misc.IntSet;
import antlr.v4.runtime.misc.Interval;

// Class IntervalSet
/**
 * @uml
 * This class implements the {@link IntSet} backed by a sorted array of
 * non-overlapping intervals. It is particularly efficient for representing
 * large collections of numbers, where the majority of elements appear as part
 * of a sequential range of numbers that are all part of the set. For example,
 * the set { 1, 2, 3, 4, 7, 8 } may be represented as { [1, 4], [7, 8] }.
 *
 * <p>
 * This class is able to represent sets containing any combination of values in
 * the range {@link Integer#MIN_VALUE} to {@link Integer#MAX_VALUE}
 * (inclusive).</p>
 */
class IntervalSet : IntSet
{

    private bool readonly;

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
    }

    public string toString(bool elemAreChar)
    {
    }

    public string toString(Vocabulary vocabulary)
    {
    }

    public string elementName(Vocabulary vocabulary, int a)
    {
    }

    public int size()
    {
        int n = 0;
        int numIntervals = intervals.size();
        if (numIntervals == 1) {
            Interval firstInterval = this.intervals.get(0);
            return firstInterval.b - firstInterval.a + 1;
        }
        for (int i = 0; i < numIntervals; i++) {
            Interval I = intervals.get(i);
            n += (I.b - I.a + 1);
        }
        return n;
    }

    public IntegerList toIntegerList()
    {
    }

    public int[] toList()
    {
    }

    public RedBlackTree!int toSet()
    {
    }

    /**
     * @uml
     * Get the ith element of ordered set.  Used only by RandomPhrase so
     * don't bother to implement if you're not doing that for a new
     * ANTLR code gen target.
     */
    public int get(int i)
    {
    }

    public int[] toArray()
    {
    }

    public void remove(int el)
    {
    }

    public bool isReadonly()
    {
        return readonly;
    }

    public void setReadonly(bool readonly)
    {
        // if (this.readonly && !readonly ) throw new IllegalStateException("can't alter readonly IntervalSet");
        this.readonly = readonly;
    }

}
