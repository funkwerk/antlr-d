/*
 * [The "BSD license"]
 *  Copyright (c) 2012 Terence Parr
 *  Copyright (c) 2012 Sam Harwell
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *  3. The name of the author may not be used to endorse or promote products
 *     derived from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 *  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 *  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

module antlr.v4.runtime.misc.IntervalSet;

import std.stdio;
import std.conv;
import std.array;
import std.algorithm;
import std.container.rbtree;
import antlr.v4.runtime.Lexer;
import antlr.v4.runtime.Vocabulary;
import antlr.v4.runtime.TokenConstants;
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
     * @read
     */
    private Interval[] intervals_;

    public this()
    {
        COMPLETE_CHAR_SET = IntervalSet.of(Lexer.MIN_CHAR_VALUE, Lexer.MAX_CHAR_VALUE);
        COMPLETE_CHAR_SET.setReadonly(true);
        EMPTY_SET = new IntervalSet(1);
        EMPTY_SET.clear;
        EMPTY_SET.setReadonly(true);
    }

    public this(Interval[] intervals)
    {
        this.intervals_ = intervals;
    }

    public this(IntervalSet set)
    {
        this();
        addAll(set);
    }

    public this(int[] els ...)
    {
        foreach (int e; els)
            add(e);
    }

    unittest
    {
        auto ts = new IntervalSet(99, 77, 8, 7, 78);
        assert("{7..8, 77..78, 99}" == ts.toString);
        ts = new IntervalSet(12);
        assert("12" == ts.toString);
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
        IntervalSet s = new IntervalSet(1);
        s.clear;
        s.add(a, b);
        return s;
    }

    public void clear()
    {
        assert(!readonly, "can't alter readonly IntervalSet");
        intervals_.length = 0;
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
            writefln("add %1$s to %2$s", addition, intervals_);
        if (addition.b < addition.a ) {
            return;
        }
        // find position in list
        // Use iterators as we modify list in place
        foreach (int index, ref el; intervals_) {
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
                while (++index < intervals_.length) {
                    Interval next = intervals_[index];
                    if (!bigger.adjacent(next) && bigger.disjoint(next)) {
                        break;
                    }
                    // if we bump up against or overlap next, merge
                    intervals_ = intervals_.remove(index);
                    // move backwards to what we just set
                    intervals_[index-1] = bigger.unionInterval(next); // set to 3 merged ones
                }
                return;
            }
            if (addition.startsBeforeDisjoint(r)) {
                // insert before r
                intervals_ = intervals_[0..index] ~ addition ~
                    intervals_[index..$];
                return;
            }
            // if disjoint and after r, a future iteration will handle it
        }
        // ok, must be after last interval (and disjoint from last interval)
        // just add it
        intervals_ ~= addition;
    }

    public IntervalSet addAll(IntSet set)
    {
        if (set is null) {
            return this;
        }
        if (typeid(typeof(set)) == typeid(IntervalSet*)) {
            IntervalSet other = cast(IntervalSet)set;
            // walk set and add each interval
            auto n = other.intervals_.length;
            for (auto i = 0; i < n; i++) {
                Interval I = other.intervals_[i];
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

    public IntervalSet complement(int minElement, int maxElement)
    {
        return this.complement(IntervalSet.of(minElement, maxElement));
    }

    unittest
    {
        auto ts = new IntervalSet(11, 10, 8, 7, 78);
        IntervalSet tn = ts.complement(1, 200);
        assert("{1..6, 9, 12..77, 79..200}" == tn.toString);
    }

    /**
     * @uml
     * {@inheritDoc}
     */
    public IntervalSet complement(IntSet vocabulary)
    {
        if (vocabulary is null || vocabulary.isNil) {
            return null; // nothing in common with null set
        }
        IntervalSet vocabularyIS = new IntervalSet();
        vocabularyIS.addAll(vocabulary);
        return vocabularyIS.subtract(this);
    }

    public IntervalSet complement(IntervalSet vocabulary)
    {
        if (vocabulary is null || vocabulary.isNil) {
            return null; // nothing in common with null set
        }
        IntervalSet vocabularyIS = vocabulary;
        return vocabularyIS.subtract(this);
    }

    public IntervalSet subtract(IntSet a)
    {
        if (!a) {
            return new IntervalSet(this);
        }
        if (typeid(typeof(a)) == typeid(IntervalSet*)) {        assert(false);
            return subtract(this, cast(IntervalSet)a);
        }

        IntervalSet other = new IntervalSet();
        other.addAll(a);
        return subtract(this, other);
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

        auto myIntervals = this.intervals_;
        auto theirIntervals = (cast(IntervalSet)other).intervals_;
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

    unittest
    {
        auto ta = new IntervalSet(11, 10, 8, 7, 78);
        auto tb = new IntervalSet(12, 10, 8, 7, 79);
        auto tand = ta.and(tb);
        assert("{7..8, 10}" == tand.toString);
    }

    public bool contains(int el)
    {
        foreach (I; intervals_) {
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
        return intervals_ is null || intervals_.length == 0;
    }

    public int getSingleElement()
    {
        if (intervals_ !is null && intervals_.length == 1 ) {
            Interval I = intervals_[0];
            if (I.a == I.b) {
                return I.a;
            }
        }
        return TokenConstants.INVALID_TYPE;
    }

    /**
     * @uml
     * Returns the maximum value contained in the set.
     *
     *  @return the maximum value contained in the set. If the set is empty, this
     *  method returns {@link Token#INVALID_TYPE}.
     */
    public int getMaxElement()
    {
        if (isNil) {
            return TokenConstants.INVALID_TYPE;
        }
        Interval last = intervals_[$-1];
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
            return TokenConstants.INVALID_TYPE;
        }
        return intervals_[0].a;
    }

    /**
     * @uml
     * combine all sets in the array returned the or'd value
     */
    public static IntervalSet or(IntervalSet[] sets)
    {
        IntervalSet r = new IntervalSet(1);
        r.clear;
        foreach (IntervalSet s; sets) {
            r.addAll(s);
        }
        return r;
    }

    unittest
    {
        IntervalSet ts;
        auto ts1 = new IntervalSet(99, 77, 8, 7, 78);
        auto ts2 = new IntervalSet(99, 76, 8, 7, 78);
        auto ts3 = new IntervalSet(55, 44);
        IntervalSet[] tl;
        tl ~= ts1;
        tl ~= ts2;
        tl ~= ts3;
        auto r = ts.or(tl);
        assert("{7..8, 44, 55, 76..78, 99}" == r.toString);
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
        if (right is null || right.isNil) {
            // right set has no elements; just return the copy of the current set
            return result;
        }

        int resultI = 0;
        int rightI = 0;
        while (resultI < result.intervals_.length && rightI < right.intervals_.length) {
            Interval resultInterval = result.intervals_[resultI];
            Interval rightInterval = right.intervals_[rightI];

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
                    result.intervals_[resultI] = beforeCurrent;
                    result.intervals_ ~= afterCurrent;
                    resultI++;
                    rightI++;
                    continue;
                }
                else {
                    // replace the current interval
                    result.intervals_[resultI] = beforeCurrent;
                    resultI++;
                    continue;
                }
            }
            else {
                if (afterCurrent !is null) {
                    // replace the current interval
                    result.intervals_[resultI] = afterCurrent;
                    rightI++;
                    continue;
                }
                else {
                    // remove the current interval (thus no need to increment resultI)
                    //result.intervals.remove(resultI);
                    result.intervals_ = result.intervals_[0..resultI].dup ~
                        result.intervals_[resultI+1..$].dup;
                    continue;
                }
            }
        }
        // If rightI reached right.intervals.size(), no more intervals to subtract from result.
        // If resultI reached result.intervals.size(), we would be subtracting from an empty set.
        // Either way, we are done.
        return result;
    }

    public string elementName(Vocabulary vocabulary, int a)
    {
        if (a == TokenConstants.EOF) {
            return "<EOF>";
        }
        else if (a == TokenConstants.EPSILON) {
            return "<EPSILON>";
        }
        else {
            return vocabulary.getDisplayName(a);
        }
    }

    public int size()
    {
        int n = 0;
        auto numIntervals = intervals_.length;
        if (numIntervals == 1) {
            Interval firstInterval = intervals_[0];
            return firstInterval.b - firstInterval.a + 1;
        }
        for (auto i = 0; i < numIntervals; i++) {
            Interval I = intervals_[i];
            n += (I.b - I.a + 1);
        }
        return n;
    }

    public IntegerList toIntegerList()
    {
        IntegerList values = new IntegerList();
        auto n = intervals_.length;
        for (auto i = 0; i < n; i++) {
            Interval I = intervals_[i];
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
        auto n = intervals_.length;
        for (auto i = 0; i < n; i++) {
            Interval I = intervals_[i];
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
        foreach (Interval I; intervals_) {
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
     * @safe
     * @pure
     */
    public int get(int i) @safe pure
    {
        auto n = intervals_.length;
        ulong index = 0;
        for (auto j = 0; j < n; j++) {
            Interval I = intervals_[j];
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
        auto n = intervals_.length;
        for (auto i = 0; i < n; i++) {
            Interval I = intervals_[i];
            int a = I.a;
            int b = I.b;
            if (el < a) {
                break; // list is sorted and el is before this interval; not here
            }
            // if whole interval x..x, remove i
            if (el == a && el == b ) {
                intervals_ = intervals_[0..i] ~ intervals_[i+1..$];
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

    /**
     * @uml
     * @safe
     * @pure
     */
    public bool isReadonly() @safe pure
    {
        return readonly;
    }

    /**
     * @uml
     * @safe
     * @pure
     */
    public void setReadonly(bool readonly) @safe pure
    {
        assert(!this.readonly, "can't alter readonly IntervalSet");
        this.readonly = readonly;
    }

    /**
     * @uml
     * @override
     * @pure
     * @safe
     */
    public override bool opEquals(Object obj) @safe pure
    {
        IntervalSet other = cast(IntervalSet)obj;
        return intervals_ == other.intervals_;
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
        if (intervals_ is null || intervals_.length == 0) {
            return "{}";
        }
        if (this.size() > 1) {
            buf.put("{");
        };
        foreach (int index, I; this.intervals_) {
            int a = I.a;
            int b = I.b;
            if (a == b) {
                if (a == TokenConstants.EOF) buf.put("<EOF>");
                else if (elemAreChar) buf.put("'" ~ to!string(a) ~ "'");
                else buf.put(to!string(a));
            }
            else {
                if (elemAreChar) buf.put("'" ~ to!string(a) ~ "'..'" ~ to!string(b) ~ "'");
                else buf.put(to!string(a) ~ ".." ~ to!string(b));
            }
            if (index + 1 < intervals_.length) {
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
        if (intervals_ is null || intervals_.length == 0) {
            return "{}";
        }
        if (size() > 1) {
            buf.put("{");
        }
        foreach (int index, I; this.intervals_) {
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
            if (index + 1 < intervals_.length) {
                buf.put(", ");
            }
        }
        if (size() > 1) {
            buf.put("}");
        }
        return buf.data;

    }

    public final Interval[] intervals()
    {
        return this.intervals_.dup;
    }

}
