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

module antlr.v4.runtime.misc.MurmurHash;

import std.conv;
import std.stdio;

// Class MurmurHash
/**
 * @author Sam Harwell
 */
class MurmurHash
{

    public static immutable int DEFAULT_SEED = 0;

    /**
     * @uml
     * Initialize the hash using the default seed value.
     *
     *  @return the intermediate hash value
     * @safe
     * @nothrow
     */
    public static int initialize() @safe nothrow
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
    public static int initialize(int seed) @safe nothrow
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
    public static int update(int hash, int value) @safe nothrow
    {
        immutable int c1 = 0xCC9E2D51;
        immutable int c2 = 0x1B873593;
        immutable int r1 = 15;
        immutable int r2 = 13;
        immutable int m = 5;
        immutable int n = 0xE6546B64;

        int k = value;
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
     * @safe
     * @nothrow
     */
    public static int update(U)(int hash, U value) @safe nothrow
    {
        return update(hash, value !is null ? value.hashCode : 0);
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
     */
    // public static int finish(int hash, int numberOfWords) @safe nothrow
    // {
    //     return update(hash, value !is null ? value.hashCode : 0);
    // }

    /**
     * @uml
     * Apply the final computation steps to the intermediate value {@code hash}
     * to form the final result of the MurmurHash 3 hash function.
     *
     *  @param hash the intermediate hash value
     *  @param numberOfWords the number of integer values added to the hash
     *  @return the final hash result
     * @safe
     */
    public static int finish(int hash, int numberOfWords) @safe nothrow

    {
        hash = hash ^ (cast(int)numberOfWords * 4);
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
    public static T hashCode(T)(T[] data, int seed)
    {
        int hash = initialize(seed);
        foreach (T value; data) {
            hash = update(hash, value);
        }

        hash = finish(hash, to!int(data.length));
        return hash;
    }

}
