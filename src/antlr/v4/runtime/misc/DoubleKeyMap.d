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

module antlr.v4.runtime.misc.DoubleKeyMap;

import std.typecons;

// Class Template DoubleKeyMap
/**
 * @uml
 * Sometimes we need to map a key to a value but key is two pieces of data.
 * This nested hash table saves creating a single key each time we access
 * map; avoids mem creation.
 * UnitTest:
 * auto t1 = new DoubleKeyMap!(int, int, int);
 * t1.put(7,1,12);
 * t1.put(7,1,13);
 * auto x = t1.get(7,1);
 * assert(x == 13);
 * x = t1.get(7,2);
 * assert(x.isNull);
 *
 * auto y = t1.get(7);
 * int[int] c;
 * c[1] = 13;
 * assert(c == y);
 * y = t1.get(6);
 * assert(y.length == 0);
 * t1.put(7,4,71);
 * c[4] = 71;
 * y = t1.get(7);
 * assert(y == c);
 *
 * auto v1 = t1.values(7);
 * assert(v1 == [71, 13]);
 * v1 = t1.values(0);
 * assert(v1 == []);
 *
 * auto kx = t1.keySet;
 * auto kk = [7];
 * assert(kk == kx);
 *
 * auto tx = t1.keySet(8);
 * assert(tx == []);
 * tx = t1.keySet(7);
 * assert(tx == [4, 1]);
 */
class DoubleKeyMap(K1, K2, V)
{

    public V[K1][K2] data;

    public V put(K1 k1, K2 k2, V v)
    {
        Nullable!V value;
        value = v;
        data[k1][k2] = value;
        return v;
    }

    public Nullable!V get(K1 k1, K2 k2)
    {
        Nullable!V v;
        if (k1 !in data || k2 !in data[k1]) {
            return v; // null
        }
        v = data[k1][k2];
        return v;
    }

    public V[K2] get(K1 k1)
    {
        if (k1 !in data) {
            V[K2] v;
            return v;
        }
        return data[k1];
    }

    /**
     * @uml
     * Get all values associated with a primary key.
     */
    public V[] values(K1 k1)
    {
        V[] va;
        if (k1 !in data) {
                return va; // []
            }
        V[K2] data2 = data[k1];
        if (!data2) {
            return va;
        }
        return data2.values;

    }

    /**
     * @uml
     * get all primary keys
     */
    public K1[] keySet()
    {
        return data.keys;
    }

    /**
     * @uml
     * Get all secondary keys associated with a primary key.
     */
    public K2[] keySet(K1 k1)
    {
        if (k1 !in data) {
            K2[] v;
            return v;
        }
        V[K2] data2 = data[k1];
        return data2.keys;
    }

}

unittest
{
    auto t1 = new DoubleKeyMap!(int, int, int);
    t1.put(7,1,12);
    t1.put(7,1,13);
    auto x = t1.get(7,1);
    assert(x == 13);
    x = t1.get(7,2);
    assert(x.isNull);

    auto y = t1.get(7);
    int[int] c;
    c[1] = 13;
    assert(c == y);
    y = t1.get(6);
    assert(y.length == 0);
    t1.put(7,4,71);
    c[4] = 71;
    y = t1.get(7);
    assert(y == c);

    auto v1 = t1.values(7);
    assert(v1 == [71, 13]);
    v1 = t1.values(0);
    assert(v1 == []);

    auto kx = t1.keySet;
    auto kk = [7];
    assert(kk == kx);

    auto tx = t1.keySet(8);
    assert(tx == []);
    tx = t1.keySet(7);
    assert(tx == [4, 1]);
}
