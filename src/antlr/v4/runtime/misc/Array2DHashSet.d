/*
 * [The "BSD license"]
 *  Copyright (c) 2012 Terence Parr
 *  Copyright (c) 2012 Sam Harwell
 *  Copyright (c) 2017 Egbert Voigt
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

module antlr.v4.runtime.misc.Array2DHashSet;

import std.array;
import std.variant;
import std.conv;
import std.stdio;
import std.container.array;
import std.algorithm.mutation : remove;
import std.algorithm.searching : canFind;
import antlr.v4.runtime.misc.MurmurHash;
import antlr.v4.runtime.misc.AbstractEqualityComparator;
import antlr.v4.runtime.misc.ObjectEqualityComparator;

// Class Template Array2DHashSet
/**
 * Set implementation with closed hashing (open addressing).
 */
class Array2DHashSet(T)
{

    public static immutable int INITAL_CAPACITY = 16;

    public static immutable int INITAL_BUCKET_CAPACITY = 8;

    public static immutable double LOAD_FACTOR = 0.75;

    protected size_t function(Object o) @trusted nothrow hashOfFp;

    protected bool function(Object a, Object b) opEqualsFp;

    protected T[][] buckets;

    /**
     * @uml
     * How many elements in set
     */
    protected int n = 0;

    /**
     * @uml
     * when to expand
     */
    protected int threshold = cast(int)(INITAL_CAPACITY * LOAD_FACTOR);

    /**
     * @uml
     * jump by 4 primes each expand or whatever
     */
    protected int currentPrime = 1;

    protected int initialBucketCapacity = INITAL_BUCKET_CAPACITY;

    public this()
    {
        this(null, null, INITAL_CAPACITY, INITAL_BUCKET_CAPACITY);
    }

    public this(size_t function(Object o) @trusted nothrow hashOfFp, bool function(Object a, Object b) opEqualsFp)
    {
        this(hashOfFp, opEqualsFp, INITAL_CAPACITY, INITAL_BUCKET_CAPACITY);
    }

    public this(size_t function(Object o) @trusted nothrow hashOfFp, bool function(Object a, Object b) opEqualsFp,
        int initialCapacity, int initialBucketCapacity)
    {
	if (hashOfFp is null || opEqualsFp is null) {
            this.hashOfFp = &ObjectEqualityComparator.hashOf;
            this.opEqualsFp = &ObjectEqualityComparator.opEquals;
        }
        else {
            this.hashOfFp = hashOfFp;
            this.opEqualsFp = opEqualsFp;
        }
        this.buckets = createBuckets(initialCapacity);
        this.initialBucketCapacity = initialBucketCapacity;
    }

    /**
     * @uml
     * Add {@code o} to set if not there; return existing value if already
     * there. This method performs the same operation as {@link #add} aside from
     * the return value.
     * @final
     */
    public final T getOrAdd(T o)
    {
        if (n > threshold)
            expand();
        return getOrAddImpl(o);
    }

    protected T getOrAddImpl(T o)
    {
        auto b = getBucket(o);
        T[] bucket = buckets[b];

        // NEW BUCKET
        if (bucket.length == 0) {
            bucket = createBucket(initialBucketCapacity);
            bucket ~= o;
            buckets[b] = bucket;
            n++;
            return o;
        }

        // LOOK FOR IT IN BUCKET
        for (int i=0; i < bucket.length; i++) {
            auto existing = bucket[i];
            if (existing is null) { // empty slot; not there, add.
                bucket[i] = o;
                n++;
                return o;
            }
            if (opEqualsFp(existing, o))
                return existing; // found existing, quit
        }

        // FULL BUCKET, expand and add to end
        auto oldLength = bucket.length;
        bucket.length = bucket.length * 2;
        buckets[b] = bucket;
        bucket[oldLength] = o; // add to end
        n++;
        return o;
    }

    public T get(T o)
    {
        T nullElement;
	if (o is null)
            return o;
        auto b = getBucket(o);
        T[] bucket = buckets[b];
        if (bucket is null)
            return nullElement; // no bucket
        foreach (e; bucket) {
            if (e is null)
                return nullElement; // empty slot; not there
            if (opEqualsFp(e, o))
                return e;
        }
        return nullElement;
    }

    /**
     * @uml
     * @final
     */
    protected final size_t getBucket(T o)
    {
        auto hash = hashOfFp(o);
        auto b = hash & (buckets.length - 1); // assumes len is power of 2
        return b;
    }

    /**
     * @uml
     * @override
     * @safe
     * @nothrow
     */
    public override size_t toHash() @safe nothrow
    {
	size_t hash = MurmurHash.initialize();
        foreach (bucket; buckets) {
            if (bucket is null) continue;
            foreach (o; bucket) {
                if (o is null) break;
                hash = MurmurHash.update(hash, hashOfFp(o));
            }
        }
        hash = MurmurHash.finish(hash, size());
        return hash;
    }

    /**
     * @uml
     * @override
     */
    public override bool opEquals(Object o)
    {
	if (o is this) return true;
        if (o.classinfo != Array2DHashSet.classinfo) return false;
        Array2DHashSet!T other = cast(Array2DHashSet!T)o;
        if (other.size() != size()) return false;
        bool same = this.containsAll(Variant(other));
        return same;
    }

    protected void expand()
    {
	auto old = buckets;
        currentPrime += 4;
        int newCapacity = to!int(buckets.length) * 2;
        auto newTable = createBuckets(newCapacity);
        int[] newBucketLengths = new int[newTable.length];
        buckets = newTable;
        threshold = cast(int)(newCapacity * LOAD_FACTOR);
        //		System.out.println("new size="+newCapacity+", thres="+threshold);
        // rehash all existing entries
        int oldSize = size();
        foreach (bucket; old) {
            if (bucket is null) {
                continue;
            }
            foreach (o; bucket) {
                if (o is null) {
                    break;
                }
                auto b = getBucket(o);
                int bucketLength = newBucketLengths[b];
                T[] newBucket;
                if (bucketLength == 0) {
                    // new bucket
                    newBucket = createBucket(initialBucketCapacity);
                    newTable[b] = newBucket;
                }
                else {
                    newBucket = newTable[b];
                    if (bucketLength == newBucket.length) {
                        // expand
                        newBucket.length = newBucket.length * 2;
                        newTable[b] = newBucket;
                    }
                }

                newBucket[bucketLength] = o;
                newBucketLengths[b]++;
            }
        }
        assert(n == oldSize);	
    }

    /**
     * @uml
     * @final
     */
    public final bool add(T t)
    {
	T existing = getOrAdd(t);
        return existing == t;
    }

    /**
     * @uml
     * @final
     */
    public final int size()
    {
	return n;
    }

    /**
     * @uml
     * @final
     */
    public final bool isEmpty()
    {
        return n==0;
    }

    /**
     * @uml
     * @final
     */
    public final bool contains(T o)
    {
        return containsFast(o);
    }

    public bool containsFast(T obj)
    {
	if (obj is null) {
            return false;
        }
        return get(obj) !is null;
    }

    public void iterator()
    {
    }

    public T[] toArray()
    {
	T[] a;
        foreach (bucket; buckets) {
            if (bucket is null) {
                continue;
            }
            foreach (o; bucket) {
                if (o is null) {
                    break;
                }
                a ~= o;
            }
        }
        return a;
    }

    public U[] toArray(U)(U[] a)
    {
	if (a.length < size()) {
            a = Arrays.copyOf(a, size());
        }
        int i = 0;
        foreach (T[] bucket; buckets) {
            if ( bucket==null ) {
                continue;
            }
            foreach (T o; bucket) {
                if (o is null) {
                    break;
                }
                //@SuppressWarnings("unchecked") // array store will check this
                U targetElement = cast(U)o;
                a[i++] = targetElement;
            }
        }
        return a;
    }

    /**
     * @uml
     * @final
     */
    public final bool remove(T o)
    {
        return removeFast(o);
    }

    public bool removeFast(T obj)
    {
	if (obj is null) {
            return false;
        }
        size_t b = getBucket(obj);
        auto bucket = buckets[b];
        if (bucket is null) {
            // no bucket
            return false;
        }
        for (int i=0; i<bucket.length; i++) {
            auto e = bucket[i];
            if (e is null) {
                // empty slot; not there
                return false;
            }
            if (opEqualsFp(e, obj) ) {          // found it
                // shift all elements to the right down one
                bucket = bucket[0..i-1] ~ bucket[i+1..$];
                n--;
                return true;
            }
        }
        return false;
    }

    public bool containsAll(Variant collection)
    {
	if (collection.type == typeid(Array2DHashSet!T)) {
            auto s = collection.get!(Array2DHashSet!T);
            foreach (bucket; s.buckets) {
                if (bucket is null) continue;
                foreach (o; bucket) {
                    if (o is null) break;
                    if (!this.containsFast(o)) return false;
                }
            }
        }
        else {
            foreach (T o; collection) {
                if (!this.containsFast(o))
                    return false;
            }
            return false;
        }
        return true;
    }

    public bool addAll(T[] c)
    {
	bool changed = false;
        foreach (o; c) {
            T existing = getOrAdd(o);
            if (existing != o)
                changed = true;
        }
        return changed;
    }

    public bool retainAll(T[] c)
    {
	int newsize = 0;
        foreach (bucket; buckets) {
            if (bucket is null) {
                continue;
            }
            int i;
            int j;
            for (i = 0, j = 0; i < bucket.length; i++) {
                if (bucket[i] is null) {
                    break;
                }
                auto bg = bucket[i];
                if (!c.canFind(bg)) {
                    // removed
                    continue;
                }
                // keep
                if (i != j) {
                    bucket[j] = bucket[i];
                }
                j++;
                newsize++;
            }
            newsize += j;
            while (j < i) {
                bucket[j] = null;
                j++;
            }
        }

        bool changed = newsize != n;
        n = newsize;
        return changed;

    }

    public bool removeAll(T[] c)
    {
        bool changed = false;
        foreach (o; c) {
            changed |= removeFast(o);
        }
        return changed;
    }

    public void clear()
    {
	buckets = createBuckets(INITAL_CAPACITY);
        n = 0;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
	if (size == 0) return "{}";
        auto buf = appender!string;
        buf.put('{');
        bool first = true;
        foreach (bucket; buckets) {
            if (bucket is null) continue;
            foreach (o; bucket) {
                if (o is null) break;
                if ( first ) first=false;
                else buf.put(", ");
                buf.put(to!string(o));
            }
        }
        buf.put('}');
        return buf.data;
    }

    public string toTableString()
    {
	auto buf = appender!string;
        foreach (bucket; buckets) {
            if (bucket is null) {
                buf.put("null\n");
                continue;
            }
            buf.put('[');
            bool first = true;
            foreach (o; bucket) {
                if (first) first=false;
                else buf.put(" ");
                if (o is null) buf.put("_");
                else buf.put(to!string(o));
            }
            buf.put("]\n");
        }
        return buf.data;
    }

    public T[][] createBuckets(int capacity)
    {
        T[][] obj;
        obj.length = capacity;
        debug {
            writefln("T[][] obj -> %1$s, length -> %2$s", obj, obj.length);
        }
        return obj;
    }

    public T[] createBucket(int capacity)
    {
        T[] obj;
        return obj;
    }

}

unittest
{
    class Y {};
    Y y = new Y;
    auto x = new Array2DHashSet!Y(&ObjectEqualityComparator.hashOf, &ObjectEqualityComparator.opEquals);
    x.add(y);
    auto sr = x.toString;
    assert(sr[0..48] == "{antlr.v4.runtime.misc.Array2DHashSet.__unittest");
    assert(x.toTableString.length == 133);
    x.clear;
    assert(x.toTableString.length == 80);
    x.add(y);
    Y y1 = new Y;
    x.add(y1);
    Y y2 = new Y;
    assert(x.toTableString.length == 189);
    assert(x.contains(y) == true);
    assert(x.contains(y1) == true);
    assert(x.contains(y2) == false);
}
