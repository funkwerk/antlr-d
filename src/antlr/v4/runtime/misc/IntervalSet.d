module antlr.v4.runtime.misc.IntervalSet;

import std.stdio;
import std.conv;
import std.array;
import std.container.rbtree;
import antlr.v4.runtime.Lexer;
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
        COMPLETE_CHAR_SET = IntervalSet.of(Lexer.MIN_CHAR_VALUE, Lexer.MAX_CHAR_VALUE);
        COMPLETE_CHAR_SET.setReadonly(true);
        EMPTY_SET = new IntervalSet();
        EMPTY_SET.setReadonly(true);
    }

    public this(Interval[] intervals)
    {
        this.intervals = intervals;
    }

    public this(IntervalSet set)
    {
        this();
        addAll(set);
    }

    /**
     * @uml
     * UnitTest:
     * auto ts = new IntervalSet(99, 77, 8, 7, 78);
     * assert("{7..8, 77..78, 99}" == ts.toString);
     */
    public this(int[] els ...)
    {
        if (els)
            {
                foreach (int e; els)
                    add(e);
            }
    }

    unittest
    {
        auto ts = new IntervalSet(99, 77, 8, 7, 78);
        assert("{7..8, 77..78, 99}" == ts.toString);
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
        assert(!readonly, "can't alter readonly IntervalSet");
        intervals.length = 0;
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
        assert(!readonly, "can't alter readonly IntervalSet");
        add(Interval.of(a ,b));
    }

    protected void add(Interval addition)
    {
        assert(!readonly, "can't alter readonly IntervalSet");
        debug (Interval)
            writefln("add %1$s to %2$s", addition, intervals);
        if (addition.b < addition.a ) {            writefln("ccccccc");
            return;
        }
        // find position in list
        // Use iterators as we modify list in place
        foreach (int index, ref el; intervals) {
            Interval r = el;
            if (addition.equals(r)) {
                return;
            }
            if (addition.adjacent(r) || !addition.disjoint(r)) {
                // next to each other, make a single larger interval
                Interval bigger = addition.unionInterval(r);
                el = bigger;
                // make sure we didn't just create an interval that
                // should be merged with next interval in list
                while (index++ < intervals.length) {
                    Interval next = intervals[index];
                    if (!bigger.adjacent(next) && bigger.disjoint(next)) {
                        break;
                    }

                    // if we bump up against or overlap next, merge
                    intervals = intervals[0..index] ~ intervals[index+1..$];   // remove this one
                    index--; // move backwards to what we just set
                    intervals[index] = bigger.unionInterval(next); // set to 3 merged ones
                    index++; // first call to next after previous duplicates the result
                }
                return;
            }
            if (addition.startsBeforeDisjoint(r)) {
                // insert before r
                intervals = intervals[0..index] ~ addition ~
                    intervals[index..$];
                return;
            }
            // if disjoint and after r, a future iteration will handle it
        }
        // ok, must be after last interval (and disjoint from last interval)
        // just add it
        intervals ~= addition;
    }

    /**
     * @uml
     * UnitTest:
     * auto ts = new IntervalSet(99, 77, 8, 7, 78, 9, 11);
     * auto s = new IntervalSet(10, 12);
     * ts.addAll(s);
     * assert("{7..12, 77..78, 99}" == ts.toString);
     */
    public IntervalSet addAll(IntSet set)
    {
        if (set is null) {
            return this;
        }
        if (typeid(typeof(set)) == typeid(IntervalSet*)) {
            IntervalSet other = cast(IntervalSet)set;
            // walk set and add each interval
            auto n = other.intervals.length;
            for (auto i = 0; i < n; i++) {
                Interval I = other.intervals[i];
                this.add(I.a,I.b);
            }
        }
        else {
            foreach (int value; set.toList) {
                add(value);
            }
        }
        return this;
    }

    unittest
    {
        auto ts = new IntervalSet(99, 77, 8, 7, 78, 9, 11);
        auto s = new IntervalSet(10, 12);
        ts.addAll(s);
        assert("{7..12, 77..78, 99}" == ts.toString);
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
        if (!a) {
            return new IntervalSet(this);
        }

        if (typeid(typeof(a)) != typeid(IntervalSet*)) {
            return subtract(this, cast(IntervalSet)a);
        }

        IntervalSet other = new IntervalSet();
        other.addAll(a);
        return subtract(this, other);
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

    public IntervalSet or(IntSet a)
    {
        IntervalSet o = new IntervalSet();
        o.addAll(this);
        o.addAll(a);
        return o;
    }

    public IntervalSet and(IntSet other)
    {
        if (other is null ) { //|| !(other instanceof IntervalSet) ) {
            return null; // nothing in common with null set
        }

        auto myIntervals = this.intervals;
        auto theirIntervals = (cast(IntervalSet)other).intervals;
        IntervalSet intersection;
        auto mySize = myIntervals.length;
        auto theirSize = theirIntervals.length;
        int i = 0;
        int j = 0;
        // iterate down both interval lists looking for nondisjoint intervals
        while (i < mySize && j < theirSize) {
            Interval mine = myIntervals[i];
            Interval theirs = theirIntervals[j];
            //System.out.println("mine="+mine+" and theirs="+theirs);
            if (mine.startsBeforeDisjoint(theirs) ) {
                // move this iterator looking for interval that might overlap
                i++;
            }
            else if ( theirs.startsBeforeDisjoint(mine) ) {
                // move other iterator looking for interval that might overlap
                j++;
            }
            else if ( mine.properlyContains(theirs) ) {
                // overlap, add intersection, get next theirs
                if (intersection is null) {
                    intersection = new IntervalSet();
                }
                intersection.add(mine.intersection(theirs));
                j++;
            }
            else if (theirs.properlyContains(mine)) {
                // overlap, add intersection, get next mine
                if (intersection is null) {
                    intersection = new IntervalSet();
                }
                intersection.add(mine.intersection(theirs));
                i++;
            }
            else if ( !mine.disjoint(theirs) ) {
                // overlap, add intersection
                if (intersection is null) {
                    intersection = new IntervalSet();
                }
                intersection.add(mine.intersection(theirs));
                // Move the iterator of lower range [a..b], but not
                // the upper range as it may contain elements that will collide
                // with the next iterator. So, if mine=[0..115] and
                // theirs=[115..200], then intersection is 115 and move mine
                // but not theirs as theirs may collide with the next range
                // in thisIter.
                // move both iterators to next ranges
                if ( mine.startsAfterNonDisjoint(theirs) ) {
                    j++;
                }
                else if ( theirs.startsAfterNonDisjoint(mine) ) {
                    i++;
                }
            }
        }
        if (intersection is null) {
            return new IntervalSet();
        }
        return intersection;
    }

    public IntervalSet complement(IntSet vocabulary)
    {
        if (vocabulary is null || vocabulary.isNil) {
            return null; // nothing in common with null set
        }
        IntervalSet vocabularyIS;
        if (typeid(typeof(vocabulary)) == typeid(IntervalSet*)) {
            vocabularyIS = cast(IntervalSet)vocabulary;
        }
        else {
            vocabularyIS = new IntervalSet();
            vocabularyIS.addAll(vocabulary);
        }
        return vocabularyIS.subtract(this);
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

}
