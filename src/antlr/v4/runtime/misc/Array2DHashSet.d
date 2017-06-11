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

module antlr.v4.runtime.misc.Array2DHashSet;

import std.array;
import std.variant;
import std.conv;
import std.stdio;
import std.typecons;
import std.container.array;
import std.algorithm.mutation : remove;
import std.algorithm.searching : canFind;
import antlr.v4.runtime.misc.MurmurHash;
import antlr.v4.runtime.misc.AbstractEqualityComparator;
import antlr.v4.runtime.misc.ObjectEqualityComparator;

// Class Template Array2DHashSet
/**
 * TODO add class description
 */
class Array2DHashSet(T)
{

    public static immutable int INITAL_CAPACITY = 16;

    public static immutable int INITAL_BUCKET_CAPACITY = 8;

    public static immutable double LOAD_FACTOR = 0.75;

    protected AbstractEqualityComparator!(T) comparator;

    protected Nullable!(Nullable!T[])[] buckets;

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
        this(null, INITAL_CAPACITY, INITAL_BUCKET_CAPACITY);
    }

    public this(AbstractEqualityComparator!(T) comparator)
    {
        this(comparator, INITAL_CAPACITY, INITAL_BUCKET_CAPACITY);
    }

    public this(AbstractEqualityComparator!(T) comparator, int initialCapacity, int initialBucketCapacity)
    {
	if (comparator is null) {
            comparator = cast(AbstractEqualityComparator!T) new ObjectEqualityComparator();
        }

        this.comparator = comparator;
        this.buckets = createBuckets();
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
        if ( n > threshold ) expand();
        return getOrAddImpl(o);
    }

    protected T getOrAddImpl(T o)
    {
        int b = getBucket(o);
        //Nullable!(Nullable!T[]) bucket = buckets[b];

        // // NEW BUCKET
        // if (bucket.isNull) {
        //     bucket = createBucket();
        //     bucket[0] = o;
        //     buckets[b] = bucket;
        //     n++;
        //     return o;
        // }

        // // LOOK FOR IT IN BUCKET
        // for (int i=0; i<bucket.length; i++) {
        //     auto existing = bucket[i];
        //     if (existing.isNull) { // empty slot; not there, add.
        //         bucket[i] = o;
        //         n++;
        //         return o;
        //     }
        //     if ( comparator.equals(existing, o) ) return existing; // found existing, quit
        // }

        // // FULL BUCKET, expand and add to end
        // int oldLength = to!int(bucket.length);
        // bucket.length = bucket.length * 2;
        // buckets[b] = bucket;
        // bucket[oldLength] = o; // add to end
        // n++;
        // return o;
        return 1;
    }

    public Nullable!T get(Nullable!T o)
    {
        Nullable!T nullElement;
	if (o.isNull) return o;
        auto b = getBucket(o);
        Nullable!T[] bucket = buckets[b];
        if (bucket is null) return nullElement; // no bucket
        foreach (e; bucket) {
            if (e.isNull) return nullElement; // empty slot; not there
            if (comparator.equals(e, o)) return e;
        }
        return nullElement;
    }

    /**
     * @uml
     * @final
     */
    protected final int getBucket(T o)
    {
        int hash = comparator.hashCode(o);
        int b = hash & (to!int(buckets.length) - 1); // assumes len is power of 2
        return b;
    }

    public int hashCode()
    {
	int hash = MurmurHash.initialize();
        foreach (bucket; buckets) {
            if (bucket.isNull) continue;
            foreach (o; bucket) {
                if (o.isNull) break;
                hash = MurmurHash.update(hash, comparator.hashCode(o));
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
        auto newTable = createBuckets();
        int[] newBucketLengths = new int[newTable.length];
        buckets = newTable;
        threshold = cast(int)(newCapacity * LOAD_FACTOR);
        //		System.out.println("new size="+newCapacity+", thres="+threshold);
        // rehash all existing entries
        int oldSize = size();
        foreach (bucket; old) {
            if (bucket.isNull) {
                continue;
            }
            foreach (o; bucket) {
                if (o.isNull) {
                    break;
                }
                int b = getBucket(o);
                int bucketLength = newBucketLengths[b];
                Nullable!T[] newBucket;
                if (bucketLength == 0) {
                    // new bucket
                    newBucket = createBucket();
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
        return existing==t;
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
    public final bool contains(Nullable!T o)
    {
        return containsFast(o);
    }

    public bool containsFast(Nullable!T obj)
    {
	if (obj.isNull) {
            return false;
        }
        return !get(obj).isNull;
    }

    public void iterator()
    {
    }

    public T[] toArray()
    {
	auto a = createBucket();
        a.length = size;
        int i = 0;
        foreach (bucket; buckets) {
            if (bucket.isNull) {
                continue;
            }
            foreach (o; bucket) {
                if (o.isNull) {
                    break;
                }
                a[i++] = o;
            }
        }
        return to!(int[])(a.get);
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
    public final bool remove(Nullable!T o)
    {
        return removeFast(o);
    }

    public bool removeFast(Nullable!T obj)
    {
	if (obj.isNull) {
            return false;
        }
        int b = getBucket(obj);
        auto bucket = buckets[b];
        if (bucket.isNull) {
            // no bucket
            return false;
        }
        for (int i=0; i<bucket.length; i++) {
            auto e = bucket[i];
            if (e.isNull) {
                // empty slot; not there
                return false;
            }
            if (comparator.equals(e, obj) ) {          // found it
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
                if (bucket.isNull) continue;
                foreach (o; bucket) {
                    if (o.isNull) break;
                    if (!this.containsFast(o)) return false;
                }
            }
        }
        else {
            // foreach (Object o; collection) {
            //     if ( !this.containsFast(asElementType(o)) ) return false;
            //}
            return false;
        }
        return true;
    }

    public bool addAll(Nullable!T[] c)
    {
	bool changed = false;
        foreach (o; c) {
            T existing = getOrAdd(o);
            if (existing != o) changed=true;
        }
        return changed;
    }

    public bool retainAll(Nullable!T[] c)
    {
	int newsize = 0;
        foreach (bucket; buckets) {
            if (bucket.isNull) {
                continue;
            }
            int i;
            int j;
            for (i = 0, j = 0; i < bucket.length; i++) {
                if (bucket[i].isNull) {
                    break;
                }
                auto bg = bucket[i].get;
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
                bucket[j].nullify;
                j++;
            }
        }
        
        bool changed = newsize != n;
        n = newsize;
        return changed;
        
    }

    public bool removeAll(Nullable!T[] c)
    {
        bool changed = false;
        foreach (o; c) {
            changed |= removeFast(o);
        }
        return changed;
    }

    public void clear()
    {
	buckets = createBuckets();
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
            if (bucket.isNull) continue;
            foreach (o; bucket) {
                if (o.isNull) break;
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
            if (bucket.isNull) {
                buf.put("null\n");
                continue;
            }
            buf.put('[');
            bool first = true;
            foreach (o; bucket) {
                if (first) first=false;
                else buf.put(" ");
                if (o.isNull) buf.put("_");
                else buf.put(to!string(o));
            }
            buf.put("]\n");
        }
        return buf.data;
    }

    // public Nullable!T asElementType(Object o)
    // {
    //     return Nullable!(cast(T)o);
    // }

    public Nullable!(Nullable!T[])[] createBuckets()
    {
        Nullable!(Nullable!T[])[] obj;
        return obj;
    }

    public Nullable!(Nullable!T[]) createBucket()
    {
        Nullable!(Nullable!T[]) obj;
        return obj;
    }

}

unittest
{
    auto x = new Array2DHashSet!int();
    writefln("result = \n%1$s", x.toString);
    x.add(1);
    writefln("result = \n%1$s", x.toTableString);
}
