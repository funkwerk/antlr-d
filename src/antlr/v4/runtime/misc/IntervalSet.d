module antlr.v4.runtime.misc.IntervalSet;

import std.conv;
import std.array;
import std.container.rbtree;
import antlr.v4.runtime.Vocabulary;
import antlr.v4.runtime.Token;
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

    public static IntervalSet COMPLETE_CHAR_SET;

    public static IntervalSet EMPTY_SET;

    private bool readonly;

    /**
     * @uml
     * The list of sorted, disjoint intervals.
     */
    private Interval[] intervals;

    public this()
    {
    }

    public this(Interval[] intervals)
    {
    }

    public this(IntervalSet set)
    {
    }

    public this(int[] els ...)
    {
    }

    /**
     * @uml
     * Create a set with a single element, el.
     */
    public static IntervalSet of(int a)
    {
        IntervalSet s = new IntervalSet();
        s.add(a);
        return s;
    }

    /**
     * @uml
     * Create a set with all ints within range [a..b] (inclusive)
     */
    public static IntervalSet of(int a, int b)
    {
        IntervalSet s = new IntervalSet();
        s.add(a,b);
        return s;
    }

    public void clear()
    {
    }

    /**
     * @uml
     * Add a single element to the set.  An isolated element is stored
     * as a range el..el.
     * @override
     */
    public override void add(int el)
    {
        assert(!readonly, "can't alter readonly IntervalSet");
        add(el, el);
    }

    /**
     * @uml
     * Add interval; i.e., add all integers from a to b to set.
     * If b&lt;a, do nothing.
     * Keep list in sorted order (by left range value).
     * If overlap, combine ranges.  For example,
     * If this is {1..5, 10..20}, adding 6..7 yields
     * {1..5, 6..7, 10..20}.  Adding 4..8 yields {1..8, 10..20}.
     */
    public void add(int a, int b)
    {
    }

    public void add(Interval addition)
    {
    }

    public string elementName(Vocabulary vocabulary, int a)
    {
        if (a == Token.EOF) {
            return "<EOF>";
        }
        else if (a == Token.EPSILON) {
            return "<EPSILON>";
        }
        else {
            return vocabulary.getDisplayName(a);
        }
    }

    public int size()
    {
        int n = 0;
        auto numIntervals = intervals.length;
        if (numIntervals == 1) {
            Interval firstInterval = intervals[0];
            return firstInterval.b - firstInterval.a + 1;
        }
        for (auto i = 0; i < numIntervals; i++) {
            Interval I = intervals[i];
            n += (I.b - I.a + 1);
        }
        return n;
    }

    public IntegerList toIntegerList()
    {
        IntegerList values = new IntegerList();
        auto n = intervals.length;
        for (auto i = 0; i < n; i++) {
            Interval I = intervals[i];
            int a = I.a;
            int b = I.b;
            for (int v = a; v <= b; v++) {
                values.add(v);
            }
        }
        return values;
    }

    public int[] toList()
    {
        int[] values;
        auto n = intervals.length;
        for (auto i = 0; i < n; i++) {
            Interval I = intervals[i];
            int a = I.a;
            int b = I.b;
            for (int v = a ; v <= b; v++) {
                values ~= v;
            }
        }
        return values;
    }

    public RedBlackTree!int toSet()
    {
        auto s = new RedBlackTree!int();
        foreach (Interval I; intervals) {
            int a = I.a;
            int b = I.b;
            for (int v=a; v<=b; v++) {
                s.insert(v);
            }
        }
        return s;
    }

    /**
     * @uml
     * Get the ith element of ordered set.  Used only by RandomPhrase so
     * don't bother to implement if you're not doing that for a new
     * ANTLR code gen target.
     */
    public int get(int i)
    {
        auto n = intervals.length;
        ulong index = 0;
        for (auto j = 0; j < n; j++) {
            Interval I = intervals[j];
            int a = I.a;
            int b = I.b;
            for (int v = a; v <= b; v++) {
                if (to!int(index) == i ) {
                    return v;
                }
                index++;
            }
        }
        return -1;
    }

    public int[] toArray()
    {
        return toIntegerList().toArray;
    }

    public void remove(int el)
    {
        assert(!readonly, "can't alter readonly IntervalSet");
        auto n = intervals.length;
        for (auto i = 0; i < n; i++) {
            Interval I = intervals[i];
            int a = I.a;
            int b = I.b;
            if (el < a) {
                break; // list is sorted and el is before this interval; not here
            }
            // if whole interval x..x, remove i
            if (el == a && el == b ) {
                intervals = intervals[0..i] ~ intervals[i+1..$];
                break;
            }
            // if on left edge x..b, adjust left
            if ( el==a ) {
                I.a++;
                break;
            }
            // if on right edge a..x, adjust right
            if ( el==b ) {
                I.b--;
                break;
            }
            // if in middle a..x..b, split interval
            if (el >a && el < b) { // found in this interval
                int oldb = I.b;
                I.b = el-1;      // [a..x-1]
                add(el+1, oldb); // add [x+1..b]
            }
        }
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

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        return toString(false);
    }

    public string toString(bool elemAreChar)
    {
        auto buf = appender!string;
        if (intervals is null || intervals.length == 0) {
            return "{}";
        }
        if (this.size() > 1) {
            buf.put("{");
        };
        foreach (int index, I; this.intervals) {
            int a = I.a;
            int b = I.b;
            if (a == b) {
                if (a == Token.EOF) buf.put("<EOF>");
                else if (elemAreChar) buf.put("'" ~ to!string(a) ~ "'");
                else buf.put(to!string(a));
            }
            else {
                if (elemAreChar) buf.put("'" ~ to!string(a) ~ "'..'" ~ to!string(b) ~ "'");
                else buf.put(to!string(a) ~ ".." ~ to!string(b));
            }
            if (index + 1 < intervals.length) {
                buf.put(", "); //  not last element
            }
        }
        if (this.size() > 1) {
            buf.put("}");
        }
        return buf.data;

    }

    public string toString(Vocabulary vocabulary)
    {
        auto buf = appender!string;
        if (intervals is null || intervals.length == 0) {
            return "{}";
        }
        if (size() > 1) {
            buf.put("{");
        }
        foreach (int index, I; this.intervals) {
            int a = I.a;
            int b = I.b;
            if ( a==b ) {
                buf.put(elementName(vocabulary, a));
            }
            else {
                for (int i=a; i<=b; i++) {
                    if ( i>a ) buf.put(", ");
                    buf.put(elementName(vocabulary, i));
                }
            }
            if (index + 1 < intervals.length) {
                buf.put(", ");
            }
        }
        if (size() > 1) {
            buf.put("}");
        }
        return buf.data;

    }

    public bool contains(int el)
    {
        auto n = intervals.length;
        for (auto i = 0; i < n; i++) {
            Interval I = intervals[i];
            int a = I.a;
            int b = I.b;
            if (el < a) {
                break; // list is sorted and el is before this interval; not here
            }
            if (el >= a && el <= b) {
                return true; // found in this interval
            }
        }
        return false;
    }

    public bool isNil()
    {
        return intervals is null || intervals.length == 0;
    }

    public int getSingleElement()
    {
        if (intervals !is null && intervals.length == 1 ) {
            Interval I = intervals[0];
            if (I.a == I.b) {
                return I.a;
            }
        }
        return Token.INVALID_TYPE;
    }

    public int getMaxElement()
    {
        if (isNil) {
            return Token.INVALID_TYPE;
        }
        Interval last = intervals[$-1];
        return last.b;
    }

    /**
     * @uml
     * Returns the minimum value contained in the set.
     *
     *  @return the minimum value contained in the set. If the set is empty, this
     *  method returns {@link Token#INVALID_TYPE}.
     */
    public int getMinElement()
    {
        if (isNil) {
            return Token.INVALID_TYPE;
        }
        return intervals[0].a;
    }

    /**
     * @uml
     * @override
     */
    public override bool opEquals(Object obj)
    {
        if (obj is null || (typeid(typeof(obj)) != typeid(IntervalSet*))) {
            return false;
        }
        IntervalSet other = cast(IntervalSet)obj;
        return intervals == other.intervals;

    }

    public IntervalSet subtract(IntSet a)
    {
    }

    /**
     * @uml
     * Compute the set difference between two interval sets. The specific
     * operation is {@code left - right}. If either of the input sets is
     * {@code null}, it is treated as though it was an empty set.
     */
    public IntervalSet subtract(IntervalSet left, IntervalSet right)
    {
        if (left is null || left.size == 0) {
            return new IntervalSet();
        }

        IntervalSet result = new IntervalSet(left);
        if (right is null || right.size == 0) {
            // right set has no elements; just return the copy of the current set
            return result;
        }

        int resultI = 0;
        int rightI = 0;
        while (resultI < result.intervals.length && rightI < right.intervals.length) {
            Interval resultInterval = result.intervals[resultI];
            Interval rightInterval = right.intervals[rightI];

            // operation: (resultInterval - rightInterval) and update indexes

            if (rightInterval.b < resultInterval.a) {
                rightI++;
                continue;
            }

            if (rightInterval.a > resultInterval.b) {
                resultI++;
                continue;
            }

            Interval beforeCurrent = null;
            Interval afterCurrent = null;
            if (rightInterval.a > resultInterval.a) {
                beforeCurrent = new Interval(resultInterval.a, rightInterval.a - 1);
            }

            if (rightInterval.b < resultInterval.b) {
                afterCurrent = new Interval(rightInterval.b + 1, resultInterval.b);
            }

            if (beforeCurrent !is null) {
                if (afterCurrent !is null) {
                    // split the current interval into two
                    result.intervals[resultI] = beforeCurrent;
                    result.intervals ~= afterCurrent;
                    resultI++;
                    rightI++;
                    continue;
                }
                else {
                    // replace the current interval
                    result.intervals[resultI] = beforeCurrent;
                    resultI++;
                    continue;
                }
            }
            else {
                if (afterCurrent !is null) {
                    // replace the current interval
                    result.intervals[resultI] = afterCurrent;
                    rightI++;
                    continue;
                }
                else {
                    // remove the current interval (thus no need to increment resultI)
                    //result.intervals.remove(resultI);
                    result.intervals = result.intervals[0..resultI].dup ~
                        result.intervals[resultI+1..$].dup;
                    continue;
                }
            }
        }
        // If rightI reached right.intervals.size(), no more intervals to subtract from result.
        // If resultI reached result.intervals.size(), we would be subtracting from an empty set.
        // Either way, we are done.
        return result;
    }

}
