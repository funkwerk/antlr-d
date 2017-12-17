module antlr.v4.runtime.misc.BitSet;

import std.bitmanip;
import std.conv;
import std.algorithm;
import std.stdio;

// Struct BitSet
/**
 * @uml
 * This struct implements a vector of bits that grows as needed. Each component
 * of the bit set has a bool value. The bits of a BitSet are indexed by nonnegative integers.
 * Individual indexed bits can be examined, set, or cleared. One BitSet may be used to modify
 * the contents of another BitSet through logical AND, logical inclusive OR,
 * and logical exclusive OR operations.
 *
 * By default, all bits in the set initially have the value false.
 */
struct BitSet
{

    private BitArray bitSet;

    public this(BitArray bitArray)
    {
        this.bitSet = bitArray;
    }

    public this(size_t initialSize)
    {
        this.bitSet.length = initialSize;
    }

    public size_t length()
    {
        return bitSet.length;
    }

    public auto cardinality()
    {
        int res;
        bitSet.each!(v => res += to!int(v));
        return res;
    }

    public int nextSetBit(int fromIndex)
    {
        foreach (i, el; bitSet) {
            if (i >= fromIndex && el == true)
                return to!int(i);
        }
        return -1;
    }

    public void set(int bitIndex, bool value)
    {
        if (bitSet.length <= bitIndex)
            bitSet.length = bitIndex + 3; // dynamic array need more space
        bitSet[bitIndex] = value;
    }

    /**
     * @uml
     * @nothrow
     */
    public bool get(int bitIndex) nothrow
    in
    {
        assert(bitSet.length > bitIndex);
    }
    body
    {
        return bitSet[bitIndex];
    }

    public bool isEmpty()
    {
        return cardinality == 0;
    }

    public string toString()
    {
        import std.format : format;
        return format("%b", bitSet);
    }

    /**
     * @uml
     * @const
     */
    public size_t toHash() const
    {
        size_t hash;
        foreach (el; bitSet)
            hash = (hash * 9) + el;
        return hash;
    }

    /**
     * @uml
     * @const
     * @pure
     * @nothrow
     */
    public bool opEquals(ref const BitSet bitSet) const pure nothrow
    {
        return this.bitSet == bitSet.bitSet;
    }

    public void clear()
    {
        bitSet.length(0);
    }

    public BitSet or(BitSet bitSet)
    {
        BitSet result;
        auto maxLenght = max(this.bitSet.length, bitSet.bitSet.length);
        this.bitSet.length = maxLenght;
        bitSet.bitSet.length = maxLenght;
        result.bitSet = this.bitSet | bitSet.bitSet;
        return result;
    }

}

unittest
{
    auto bs = BitSet(12);
    assert(bs.length == 12);
    assert(bs.bitSet.dim == 1);
    assert(bs.cardinality == 0);
    assert(bs.isEmpty == true);
    bs.set(2, true);
    bs.set(7, true);
    assert(bs.cardinality == 2);
    assert(bs.isEmpty == false);
    assert(bs.nextSetBit(1) == 2);
    assert(bs.nextSetBit(7) == 7);
    assert(bs.nextSetBit(9) == -1);
    auto cs = BitSet(BitArray([0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0]));
    assert(cs.cardinality == 5);
    assert(cs.nextSetBit(1) == 1);
    assert(cs.nextSetBit(7) == 10);
    assert(cs.nextSetBit(88) == -1);
    assert(cs.toString == "0101_10100010");
    auto ds = BitSet(BitArray([0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0]));
    assert(cs == ds);
    assert(cs != bs);
    assert(bs.toHash == 387427050);
    assert(cs.toHash == 3534673149);
    assert(ds.toHash == 3534673149);
    assert(bs.get(2) == true);
    assert(bs.get(3) == false);
    bs.set(19, true);
    assert(bs.toString == "001000_01000000_00000100");
    ds.set(8, true);
    ds.set(1, false);
    auto x = cs.or(ds);
    assert(x.toString == "0101_10101010");
    cs.clear;
    cs.set(5, true);
    ds.set(0, true);
    x = cs.or(ds);
    assert(x.toString == "1001_11101010");
}
