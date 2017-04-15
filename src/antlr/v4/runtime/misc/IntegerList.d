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

module antlr.v4.runtime.misc.IntegerList;

import std.algorithm.mutation;
import std.typecons;
import std.range;
import std.conv;
import std.format;
import std.algorithm;
import antlr.v4.runtime.IllegalArgumentException;

// Class IntegerList
/**
 * A buffert list of interger values
 */
class IntegerList
{

    private static int[] EMPTY_DATA;

    private static immutable int INITIAL_SIZE = 4;

    private static immutable int MAX_ARRAY_SIZE  = int.max-8;

    /**
     * @uml
     * @read
     */
    public int[] data_;

    /**
     * @uml
     * @read
     */
    public int size_;

    public this()
    {
        data_ = EMPTY_DATA;
    }

    public this(int capacity)
    {
        if (capacity < 0) {
            throw new IllegalArgumentException("Capacity can't be a negativ value!");
        }
        if (capacity == 0) {
            data_ = EMPTY_DATA;
        } else {
            data_.length = capacity;
        }
    }

    public this(IntegerList list)
    {
        data_ = list.data;
        size_ = list.size;
    }

    public this(int[] list)
    {
        foreach (value; list) {
            add(value);
        }
    }

    /**
     * @uml
     * @final
     */
    public final void add(int value)
    {
        data_ ~= value;
    }

    /**
     * @uml
     * @final
     */
    public final void addAll(int[] array)
    {
        foreach (value; array) {
            add(value);
        }
    }

    public void addAll(IntegerList list)
    {
        foreach (value; list.data) {
            add(value);
        }
    }

    /**
     * @uml
     * @final
     */
    public final int get(int index)
    in
    {
        assert(index >= 0 || index < size_);
    }
    body
    {
        return data_[index];
    }

    /**
     * @uml
     * @final
     */
    public final bool contains(int value)
    {
        for (int i = 0; i < size_; i++) {
            if (data_[i] == value) {
                return true;
            }
        }
        return false;
    }

    /**
     * @uml
     * @final
     */
    public final int set(int index, int value)
    in
    {
        assert(index >= 0 || index < size_);
    }
    body
    {
        int previous = data_[index];
        data_[index] = value;
        return previous;
    }

    /**
     * @uml
     * @final
     */
    public final int removeAt(int index)
    {
        int value = get(index);
        data_ = remove(data_, index);
        size_--;
        return value;
    }

    /**
     * @uml
     * @final
     */
    public final void removeRange(int fromIndex, int toIndex)
    in
    {
        assert(fromIndex >= 0 || toIndex >= 0 || fromIndex <= size_ || toIndex <= size_, "IndexOutOfBoundsException");
        assert(fromIndex <= toIndex, "IllegalArgumentException");
    }
    body
    {
        data_ = remove(data_, tuple(fromIndex, toIndex+1));
        size_ -= (toIndex - fromIndex);
    }

    /**
     * @uml
     * @final
     */
    public final bool isEmpty()
    {
        return size_ == 0;
    }

    /**
     * @uml
     * @final
     */
    public final void trimToSize()
    {
        size_ = to!int(data_.length);
    }

    /**
     * @uml
     * @final
     * @property
     */
    public final @property void clear()
    {
        data_.length = 0;
    }

    /**
     * @uml
     * @final
     * @property
     */
    public final @property int[] toArray()
    {
        return data_;
    }

    public void sort()
    {
        data_.sort();
    }

    /**
     * @uml
     * Compares the specified object with this list for equality.  Returns
     * {@code true} if and only if the specified object is also an {@link IntegerList},
     * both lists have the same size, and all corresponding pairs of elements in
     * the two lists are equal.  In other words, two lists are defined to be
     * equal if they contain the same elements in the same order.
     * <p>
     * This implementation first checks if the specified object is this
     * list. If so, it returns {@code true}; if not, it checks if the
     * specified object is an {@link IntegerList}. If not, it returns {@code false};
     * if so, it checks the size of both lists. If the lists are not the same size,
     * it returns {@code false}; otherwise it iterates over both lists, comparing
     * corresponding pairs of elements.  If any comparison returns {@code false},
     * this method returns {@code false}.
     *
     *  @param o the object to be compared for equality with this list
     *  @return {@code true} if the specified object is equal to this list
     */
    public bool equals(Object o)
    {
	if (o == this) {
            return true;
        }
        if (o.classinfo != IntegerList.classinfo) {
            return false;
        }
        IntegerList other = cast(IntegerList)o;
        if (size_ != other.size) {
            return false;
        }
        auto a = data_.assumeSorted;
        auto b = other.data.assumeSorted;
        return a.equal(b);
    }

    /**
     * @uml
     * Returns the hash code value for this list.
     *
     * <p>This implementation uses exactly the code that is used to define the
     * list hash function in the documentation for the {@link List#hashCode}
     * method.</p>
     *
     *  @return the hash code value for this list
     */
    public int hashCode()
    {
        int hashCode = 1;
        for (int i = 0; i < size_; i++) {
            hashCode = 31*hashCode + data_[i];
        }
        return hashCode;
    }

    /**
     * @uml
     * Returns a string representation of this list.
     * @override
     */
    public override string toString()
    {
        return format("%s", data_);
    }

    /**
     * @uml
     * @final
     */
    public final int binarySearch(int key)
    {
        auto r = data_.assumeSorted;
        auto f = r.find(key);
        if (!f.empty)
            return to!int(data_.length - f.length);
        else
            return to!int(data_.length - 1);
    }

    /**
     * @uml
     * @final
     */
    public final int binarySearch(int fromIndex, int toIndex, int key)
    in
    {
        assert(fromIndex >= 0 && toIndex >= 0 && fromIndex <= size_ && toIndex <= size_, "IndexOutOfBoundsException");
        assert(fromIndex <= toIndex, "IllegalArgumentException");
    }
    body
    {
        auto r = data_.assumeSorted;
        auto f = r[fromIndex..toIndex].find(key);
        if (!f.empty)
            return to!int(toIndex - f.length);
        else
            return to!int(data_.length - 1);
    }

    public final int[] data()
    {
        return this.data_.dup;
    }

    public final int size()
    {
        return this.size_;
    }

}
