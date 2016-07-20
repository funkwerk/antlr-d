/*
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

module antlr.v4.runtime.misc.Array2DHashSet;

import std.conv;
import std.stdio;
import std.algorithm;
import std.array;
import antlr.v4.runtime.misc.AbstractEqualityComparator;
import antlr.v4.runtime.misc.ObjectEqualityComparator;
import antlr.v4.runtime.misc.MurmurHash;

// Class Template Array2DHashSet
/**
 * @uml
 * {@link Set} implementation with closed hashing (open addressing).
 * UnitTest:
 * auto ar = new Array2DHashSet!int;
 * assert(ar.toString);
 */
class Array2DHashSet(T)
{

    public static immutable int INITAL_CAPACITY = 16;

    public static immutable int INITAL_BUCKET_CAPACITY = 8;

    public static immutable double LOAD_FACTOR = 0.75;

    private ObjectEqualityComparator comparator;

    private T*[][] buckets;

    private int n = 0;

    private int threshold = to!int(INITAL_CAPACITY * LOAD_FACTOR);

    private int currentPrime = 1;

    private int initialBucketCapacity = INITAL_BUCKET_CAPACITY;

    /**
     * @uml
     * UnitTest:
     * auto ar = new Array2DHashSet;
     * assert(ar !is null);
     */
    public this()
    {
        this(null, INITAL_CAPACITY, INITAL_BUCKET_CAPACITY);
    }

    unittest
    {
        auto ar = new Array2DHashSet;
        assert(ar !is null);
    }

    public this(ObjectEqualityComparator comparator)
    {
        this(comparator, INITAL_CAPACITY, INITAL_BUCKET_CAPACITY);
    }

    public this(ObjectEqualityComparator comparator, int initialCapacity, int initialBucketCapacity)
    {
        if (comparator is null) {
            this.comparator = new ObjectEqualityComparator;
        }
        else {
            this.comparator = comparator;
        }
        this.buckets = createBuckets(initialCapacity);
        this.initialBucketCapacity = initialBucketCapacity;
    }

    /**
     * @uml
     * Add {@code o} to set if not there; return existing value if already
     * there. This method performs the same operation as {@link #add} aside from
     * the return value.
     */
    public T getOrAdd(T o)
    {
        if ( n > threshold ) expand();
        return getOrAddImpl(o);
    }

    public T getOrAddImpl(T o)
    {
        int b = getBucket(o);
        T*[] bucket = buckets[b];

        // NEW BUCKET
        if (bucket is null ) {
            bucket = createBucket(initialBucketCapacity);
            *bucket[0] = o;
            buckets[b] = bucket;
            n++;
            return o;
        }

        // LOOK FOR IT IN BUCKET
        for (int i=0; i<bucket.length; i++) {
            T* existing = bucket[i];
            if (existing is null) { // empty slot; not there, add.
                *bucket[i] = o;
                n++;
                return o;
            }
            if (comparator.equals(*existing, o))
                return *existing; // found existing, quit
        }

        // FULL BUCKET, expand and add to end
        auto oldLength = bucket.length;
        bucket.length = bucket.length * 2;
        buckets[b] = bucket;
        *bucket[oldLength] = o; // add to end
        n++;
        return o;
    }

    public T* get(T o)
    { 
        int b = getBucket(o);
        T*[] bucket = buckets[b];
        if (bucket == null)
            return null; // no bucket
        foreach (e; bucket) {
            if (e is null) return null; // empty slot; not there
            if ( comparator.equals(*e, o) ) return e;
        }
        return null;
    }

    public int getBucket(T o)
    {
        int hash = comparator.hashCode(o);
        int b = hash & to!int((buckets.length-1)); // assumes len is power of 2
        return b;
    }

    public int hashCode()
    {
        int hash = MurmurHash.initialize();
        foreach (bucket; buckets) {
            if (bucket is null ) continue;
            foreach (o; bucket) {
                if (o is null ) break;
                hash = MurmurHash.update(hash, comparator.hashCode(o));
            }
        }

        hash = MurmurHash.finish(hash, size());
        return hash;
    }

    public bool equals(T o)
    {
        if (o == this) return true;
        if (typeof(o) !is typeof(Array2DHashSet)) return false;
        if ( o.sizeof() != sizeof() ) return false;
        bool same = this.containsAll(o);
        return same;
    }

    public void expand()
    {
        T[][] old = buckets;
        currentPrime += 4;
        auto newCapacity = buckets.length * 2;
        T[][] newTable = createBuckets(to!int(newCapacity));
        int[] newBucketLengths = new int[newTable.length];
        buckets = newTable;
        threshold = to!int(newCapacity * LOAD_FACTOR);
//              System.out.println("new size="+newCapacity+", thres="+threshold);
        // rehash all existing entries
        int oldSize = size();
        foreach (T[] bucket; old) {
            if ( bucket==null ) {
                continue;
            }

            foreach (T o; bucket) {
                if (!o) {
                    break;
                }

                int b = getBucket(o);
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

    public bool add(T t)
    {
        T existing = getOrAdd(t);
        return existing==t;
    }

    public int size()
    {
        return n;
    }

    /**
     * @uml
     * @property
     * UnitTest:
     * auto ar = new Array2DHashSet;
     * assert(ar.isEmpty);
     */
    public @property bool isEmpty()
    {
        return n == 0;
    }

    unittest
    {
        auto ar = new Array2DHashSet;
        assert(ar.isEmpty);
    }

    public bool contains(Object o)
    {
        return containsFast(asElementType(o));
    }

    public bool containsFast(T obj)
    {
        if (!obj) {
            return false;
        }
        if (!get(obj)) return false;
        return true;
    }

    public T[] iterator()
    {
        return toArray().dup;
    }

    public T[] toArray()
    {
        T[] a = createBucket(size());
        int i = 0;
        foreach (T[] bucket; buckets) {
            if (bucket is null) {
                continue;
            }

            foreach (T o; bucket) {
                if (o is null) {
                    break;
                }

                a[i++] = o;
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
            if (bucket is null) {
                continue;
            }

            foreach (T o; bucket) {
                if (o is null) {
                    break;
                }

                // array store will check this
                U targetElement = cast(U)o;
                a[i++] = targetElement;
            }
        }
        return a;
    }

    public bool remove(Object o)
    {
        return removeFast(asElementType(o));
    }

    public bool removeFast(T obj)
    {
	if (obj is null) {
            return false;
        }

        int b = getBucket(obj);
        T*[] bucket = buckets[b];
        if (bucket is null) {
            // no bucket
            return false;
        }

        for (int i=0; i<bucket.length; i++) {
            T* e = bucket[i];
            if (e is null) {
                // empty slot; not there
                return false;
            }

            if ( comparator.equals(*e, obj) ) {          // found it
                // shift all elements to the right down one
                // System.arraycopy(bucket, i+1, bucket, i, bucket.length-i-1);
                // bucket[bucket.length - 1] = null;
                bucket = bucket[1..$];
                n--;
                return true;
            }
        }

        return false;
    }

    public bool containsAll(C)(C[] collection)
    {
	if (typeof(collection) == Array2DHashSet) {
            auto s = collection;
            foreach (Object[] bucket; s.buckets) {
                if (bucket is null) continue;
                foreach (Object o; bucket) {
                    if (o is null) break;
                    if (!this.containsFast(asElementType(o))) return false;
                }
            }
        }
        else {
            foreach (Object o; collection) {
                if (!this.containsFast(asElementType(o))) return false;
            }
        }
        return true;
    }

    public bool addAll(T[] c)
    {
        bool changed = false;
        foreach (T o; c) {
            T existing = getOrAdd(o);
            if (existing != o)
                {
                    changed=true;
                }
        }
        return changed;
    }

    public bool retainAll(T[] c)
    {
        int newsize = 0;
        foreach (T*[] bucket; buckets) {
            if (bucket is null) {
                continue;
            }

            int i;
            int j;
            for (i = 0, j = 0; i < bucket.length; i++) {
                if (bucket[i] is null) {
                    break;
                }

                if (!c.find(*bucket[i])) {
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
            changed |= removeFast(asElementType(o));
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
     * UnitTest:
     * auto ar = new Array2DHashSet;
     * assert(ar.toString != "jj");
     */
    public override string toString()
    {
        if ( size()==0 ) return "{}";

        auto buf = appender!string;
        buf.put('{');
        bool first = true;
        foreach (T*[] bucket; buckets) {
            if (bucket is null) continue;
            foreach (T* o; bucket) {
                if (o is null) break;
                if ( first ) first=false;
                else buf.put(", ");
                buf.put(to!string(o));
            }
        }
        buf.put('}');
        return buf.data;
    }

    unittest
    {
        auto ar = new Array2DHashSet;
        assert(ar.toString != "jj");
    }

    public string toTableString()
    {
        auto buf = appender!string;
        foreach (T*[] bucket; buckets) {
            if (bucket is null) {
                buf.put("null\n");
                continue;
            }
            buf.put('[');
            bool first = true;
            foreach (T* o; bucket) {
                if (first) first = false;
                else buf.put(" ");
                if (o is null) buf.put("_");
                else buf.put(to!string(o));
            }
            buf.put("]\n");
        }
        return buf.data;

    }

    /**
     * @uml
     * Return {@code o} as an instance of the element type {@code T}. If
     *  {@code o} is non-null but known to not be an instance of {@code T}, this
     *  method returns {@code null}. The base implementation does not perform any
     *  type checks; override this method to provide strong type checks for the
     *  {@link #contains} and {@link #remove} methods to ensure the arguments to
     *  the {@link EqualityComparator} for the set always have the expected
     *  types.
     *
     *  @param o the object to try and cast to the element type of the set
     *  @return {@code o} if it could be an instance of {@code T}, otherwise
     *  {@code null}.
     */
    public T asElementType(T o)
    {
        return cast(T)o;
    }

    public T*[][] createBuckets(int capacity)
    {
        return cast(T*[][])new Object*[capacity][];
    }

    /**
     * @uml
     * Return an array of {@code T} with length {@code capacity}.
     *
     *  @param capacity the length of the array to return
     *  @return the newly constructed array
     */
    public T*[] createBucket(int capacity)
    {
        return cast(T*[])new Object[capacity];
    }

}

unittest
{
    auto ar = new Array2DHashSet!int;
    assert(ar.toString);
}
