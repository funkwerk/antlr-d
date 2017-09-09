/*
 * [The "BSD license"]
 *  Copyright (c) 2016 Terence Parr
 *  Copyright (c) 2016 Sam Harwell
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

module antlr.v4.runtime.misc.MurmurHash;

import std.conv;
import std.stdio;

// Class MurmurHash
/**
 * @author Sam Harwell
 * @author Egbert Voigt (D)
 */
class MurmurHash
{

    public static immutable size_t DEFAULT_SEED = 0;

    /**
     * @uml
     * Initialize the hash using the default seed value.
     *
     *  @return the intermediate hash value
     * @safe
     * @nothrow
     */
    public static size_t initialize() @safe nothrow
    {
        auto mh = new MurmurHash;
        return initialize(DEFAULT_SEED);
    }

    /**
     * @uml
     * Initialize the hash using the specified {@code seed}.
     *
     *  @param seed the seed
     *  @return the intermediate hash value
     * @safe
     * @nothrow
     */
    public static size_t initialize(size_t seed) @safe nothrow
    {
        return seed;
    }

    /**
     * @uml
     * Update the intermediate hash value for the next input {@code value}.
     *
     *  @param hash the intermediate hash value
     *  @param value the value to add to the current hash
     *  @return the updated intermediate hash value
     * @safe
     * @nothrow
     */
    public static size_t update(size_t hash, size_t value) @safe nothrow
    {
        immutable size_t c1 = 0xCC9E2D51;
        immutable size_t c2 = 0x1B873593;
        immutable size_t r1 = 15;
        immutable size_t r2 = 13;
        immutable size_t m = 5;
        immutable size_t n = 0xE6546B64;

        size_t k = value;
        k = k * c1;
        k = (k << r1) | (k >>> (32 - r1));
        k = k * c2;

        hash = hash ^ k;
        hash = (hash << r2) | (hash >>> (32 - r2));
        hash = hash * m + n;

        return hash;

    }

    /**
     * @uml
     * Update the intermediate hash value for the next input {@code value}.
     *
     *  @param hash the intermediate hash value
     *  @param value the value to add to the current hash
     *  @return the updated intermediate hash value
     * @nothrow
     */
    public static size_t update(U)(size_t hash, U value) nothrow
    {
        return value.hashOf(hash);
    }

    /**
     * @uml
     * Apply the final computation steps to the intermediate value {@code hash}
     * to form the final result of the MurmurHash 3 hash function.
     *
     *  @param hash the intermediate hash value
     *  @param numberOfWords the number of integer values added to the hash
     *  @return the final hash result
     * @safe
     * @nothrow
     */
    public static size_t finish(size_t hash, size_t numberOfWords) @safe nothrow
    {
        hash = hash ^ (cast(size_t)numberOfWords * 4);
        hash = hash ^ (hash >>> 16);
        hash = hash * 0x85EBCA6B;
        hash = hash ^ (hash >>> 13);
        hash = hash * 0xC2B2AE35;
        hash = hash ^ (hash >>> 16);
        return hash;
    }

    /**
     * @uml
     * Utility function to compute the hash code of an array using the
     * MurmurHash algorithm.
     *
     *  @param <T> the array element type
     *  @param data the array data
     *  @param seed the seed for the MurmurHash algorithm
     *  @return the hash code of the data
     */
    public static size_t hashCode(T)(T[] data, size_t seed)
    {
        size_t hash = initialize(seed);
        foreach (T value; data) {
            hash = update(hash, value);
        }
        hash = finish(hash, data.length);
        return hash;
    }

}

unittest
{
    auto testMurmurHash = new MurmurHash;
    if (size_t.sizeof == 4)
        assert(testMurmurHash.hashCode!int([12], 3) == 3080993568U);
    else
        assert(testMurmurHash.hashCode!int([12], 3) == 8015155421799095863LU);
    auto res = testMurmurHash.initialize;
    res = testMurmurHash.update!int(res, 33);
    res = testMurmurHash.update!int(res, 2);
    if (size_t.sizeof == 4)
        assert(testMurmurHash.finish(res, 2) == 857341099U);
    else
        assert(testMurmurHash.finish(res, 2) == 9650988314287891571LU);
}
