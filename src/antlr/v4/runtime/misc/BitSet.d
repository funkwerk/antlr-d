module antlr.v4.runtime.misc.BitSet;

import std.bitmanip;
import std.conv;
import std.algorithm;

// Struct BitSet
/**
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

version(unittest) {
    import fluent.asserts;
    import unit_threaded;

    class Test {

        @Tags("bitSet")
        @("bitSetFunction")
        unittest {
            BitSet bs;
            bs.isEmpty.should.equal(true);
            bs.toHash.should.equal(0);
            bs.length.should.equal(0);
            bs.set(5, true);
            bs.length.should.equal(8);
            bs.toString.should.equal("00000100");
            auto bs1 = bs;
            bs.clear;
            bs1.toString.should.equal("00000100");
            bs.length.should.equal(0);
            bs.set(2, true);
            bs.toString.should.equal("00100");
            auto bs2 = bs1.or(bs);
            bs2.toString.should.equal("00100100");
            bs2.get(1).should.equal(false);
            bs2.length.should.equal(8);
            bs2.opEquals(bs1).should.equal(false);
        }
    }
}
