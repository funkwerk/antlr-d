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

// Class Template Array2DHashSet
/**
 * @uml
 * {@link Set} implementation with closed hashing (open addressing).
 */
class Array2DHashSet(T)
{

    public static immutable int INITAL_CAPACITY = 16;

    public static immutable undefined INITAL_BUCKET_CAPACITY = 8;

    public static immutable double LOAD_FACTOR = 0.75;

    private AbstractEqualityComparator!(T) comparator;

    private T[][] buckets;

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

    public this(AbstractEqualityComparator!(T) comparator)
    {
        this(comparator, INITAL_CAPACITY, INITAL_BUCKET_CAPACITY);
    }

    public this(AbstractEqualityComparator!(T) comparator, int initialCapacity, int initialBucketCapacity)
    {
        if (comparator is null) {
            comparator = ObjectEqualityComparator.INSTANCE;
        }
        this.comparator = comparator;
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
        T[] bucket = buckets[b];

        // NEW BUCKET
        if (bucket is null ) {
            bucket = createBucket(initialBucketCapacity);
            bucket[0] = o;
            buckets[b] = bucket;
            n++;
            return o;
        }

        // LOOK FOR IT IN BUCKET
        for (int i=0; i<bucket.length; i++) {
            T existing = bucket[i];
            if (existing is null ) { // empty slot; not there, add.
                bucket[i] = o;
                n++;
                return o;
            }
            if ( comparator.equals(existing, o) ) return existing; // found existing, quit
        }

        // FULL BUCKET, expand and add to end
        int oldLength = bucket.length;
        bucket = Arrays.copyOf(bucket, bucket.length * 2);
        buckets[b] = bucket;
        bucket[oldLength] = o; // add to end
        n++;
        return o;
    }

    public T get(T o)
    {
        if ( o is null ) return o;
        int b = getBucket(o);
        T[] bucket = buckets[b];
        if ( bucket is null ) return null; // no bucket
        foreach (T e; bucket) {
            if ( e is null ) return null; // empty slot; not there
            if ( comparator.equals(e, o) ) return e;
        }
        return null;
    }

    public int getBucket(T o)
    {
        int hash = comparator.hashCode(o);
        int b = hash & (buckets.length-1); // assumes len is power of 2
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
                if (typeof(o) !is Array2DHashSet) return false;
                if ( o.sizeof() != sizeof() ) return false;
                boolean same = this.containsAll(other);
                return same;
    }

    /**
     * @uml
     * Return an array of {@code T} with length {@code capacity}.
     *
     *  @param capacity the length of the array to return
     *  @return the newly constructed array
     */
    public T[] createBucket(int capacity)
    {
        return cast(T[][])new Object[capacity][];
    }

    public void expand()
    {
        T[][] old = buckets;
        currentPrime += 4;
        int newCapacity = buckets.length * 2;
        T[][] newTable = createBuckets(newCapacity);
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
                if (o is null ) {
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
                        newBucket = Arrays.copyOf(newBucket, newBucket.length * 2);
                        newTable[b] = newBucket;
                    }
                }

                newBucket[bucketLength] = o;
                newBucketLengths[b]++;
            }
        }

        assert(n == oldSize);

    }

    public void add(T t)
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
        if (obj == null) {
            return false;
        }

        return get(obj) != null;
    }

    public void iterator()
    {
    }

    public T[] toArray()
    {
    }

    public U[] toArray(U)(U[] a)
    {
    }

    public bool remove(Object o)
    {
    }

}
