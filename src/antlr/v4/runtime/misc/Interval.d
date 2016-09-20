/**
 * [The "BSD license"]
 *  Copyright (c) 2016 Terence Parr
 *  Copyright (c) 2016 Sam Harwell
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

module antlr.v4.runtime.misc.Interval;

import std.algorithm;
import std.conv;

// Class Interval
/**
 * @uml
 * An immutable inclusive interval a..b
 */
class Interval
{

    public static immutable int INTERVAL_POOL_MAX_VALUE = 1000;

    public static const Interval INVALID = new Interval(-1, -2);

    private static Interval[] cache = new Interval[INTERVAL_POOL_MAX_VALUE+1];

    public int a;

    public int b;

    public static int creates = 0;

    public static int misses = 0;

    public static int hits = 0;

    public static int outOfRange = 0;

    public this(int a, int b)
    {
        this.a=a;
        this.b=b;
    }

    /**
     * @uml
     * Interval objects are used readonly so share all with the
     * same single value a==b up to some max size.  Use an array as a perfect hash.
     * Return shared object for 0..INTERVAL_POOL_MAX_VALUE or a new
     * Interval object with a..a in it.  On Java.g4, 218623 IntervalSets
     * have a..a (set with 1 element).
     */
    public static Interval of(int a, int b)
    {
        // cache just a..a
        if ( a!=b || a<0 || a>INTERVAL_POOL_MAX_VALUE ) {
            return new Interval(a, b);
        }
        if (cache[a] is null) {
            cache[a] = new Interval(a, a);
        }
        return cache[a];
    }

    /**
     * @uml
     * return number of elements between a and b inclusively. x..x is length 1.
     * if b &lt; a, then length is 0.  9..10 has length 2.
     */
    public int length()
    {
        if ( b<a ) return 0;
        return b-a+1;
    }

    /**
     * @uml
     * UnitTest:
     * auto a = new Interval(1, 2);
     * auto b = new Interval(1, 2);
     * assert(a.equals(b), a.toString);
     */
    public bool equals(Object o)
    {
        Interval other = cast(Interval)o;
        return this.a == other.a && this.b == other.b;
    }

    unittest
    {
        auto a = new Interval(1, 2);
        auto b = new Interval(1, 2);
        assert(a.equals(b), a.toString);
    }

    public int hashCode()
    {
        int hash = 23;
        hash = hash * 31 + a;
        hash = hash * 31 + b;
        return hash;
    }

    /**
     * @uml
     * Does this start completely before other? Disjoint
     */
    public bool startsBeforeDisjoint(Interval other)
    {
        return this.a<other.a && this.b<other.a;
    }

    /**
     * @uml
     * Does this start at or before other? Nondisjoint
     */
    public bool startsBeforeNonDisjoint(Interval other)
    {
        return this.a<=other.a && this.b>=other.a;
    }

    /**
     * @uml
     * Does this.a start after other.b? May or may not be disjoint
     */
    public bool startsAfter(Interval other)
    {
        return this.a > other.a;
    }

    /**
     * @uml
     * Does this start completely after other? Disjoint
     */
    public bool startsAfterDisjoint(Interval other)
    {
        return this.a>other.b;
    }

    /**
     * @uml
     * Does this start after other? NonDisjoint
     */
    public bool startsAfterNonDisjoint(Interval other)
    {
        return this.a>other.a && this.a<=other.b; // this.b>=other.b implied
    }

    /**
     * @uml
     * Are both ranges disjoint? I.e., no overlap?
     */
    public bool disjoint(Interval other)
    {
        return startsBeforeDisjoint(other) || startsAfterDisjoint(other);
    }

    /**
     * @uml
     * Are two intervals adjacent such as 0..41 and 42..42?
     * UnitTest:
     * auto a = new Interval(1 , 2);
     * auto b = new Interval(3 , 10);
     * assert(b.adjacent(a));
     * assert(!b.adjacent(new Interval(1, 6)));
     * assert(!b.adjacent(new Interval(10, 16)));
     */
    public bool adjacent(Interval other)
    {
        return this.a == other.b+1 || this.b == other.a-1;
    }

    unittest
    {
        auto a = new Interval(1 , 2);
        auto b = new Interval(3 , 10);
        assert(b.adjacent(a));
        assert(!b.adjacent(new Interval(1, 6)));
        assert(!b.adjacent(new Interval(10, 16)));
    }

    public bool properlyContains(Interval other)
    {
         return other.a >= this.a && other.b <= this.b;
    }

    /**
     * @uml
     * Return the interval computed from combining this and other
     * UnitTest:
     * auto a = new Interval(1, 2);
     * auto b = new Interval(3, 10);
     * auto c = new Interval(1, 10);
     * auto d = new Interval(7, 10);
     * assert(b.unionInterval(a).equals(c));
     * assert(c.unionInterval(a).equals(c));
     * assert(a.unionInterval(c).equals(c));
     * assert(c.unionInterval(d).equals(c));
     * assert(d.unionInterval(c).equals(c));
     * assert(!d.unionInterval(c).equals(d));
     */
    public Interval unionInterval(Interval other)
    {
        return Interval.of(min(a, other.a), max(b, other.b));
    }

    unittest
    {
        auto a = new Interval(1, 2);
        auto b = new Interval(3, 10);
        auto c = new Interval(1, 10);
        auto d = new Interval(7, 10);
        assert(b.unionInterval(a).equals(c));
        assert(c.unionInterval(a).equals(c));
        assert(a.unionInterval(c).equals(c));
        assert(c.unionInterval(d).equals(c));
        assert(d.unionInterval(c).equals(c));
        assert(!d.unionInterval(c).equals(d));
    }

    /**
     * @uml
     * Return the interval in common between this and o
     */
    public Interval intersection(Interval other)
    {
        return Interval.of(max(a, other.a), min(b, other.b));
    }

    /**
     * @uml
     * Return the interval with elements from this not in other;
     * other must not be totally enclosed (properly contained)
     * within this, which would result in two disjoint intervals
     * instead of the single one returned by this method.
     */
    public Interval differenceNotProperlyContained(Interval other)
    {
        Interval diff = null;
        // other.a to left of this.a (or same)
        if ( other.startsBeforeNonDisjoint(this) ) {
                diff = Interval.of(max(this.a, other.b + 1),
                                                   this.b);
        }

        // other.a to right of this.a
        else if ( other.startsAfterNonDisjoint(this) ) {
                diff = Interval.of(this.a, other.a - 1);
        }
        return diff;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        return to!string(a) ~ ".." ~ to!string(b);
    }

}
