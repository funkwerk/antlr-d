module antlr.v4.runtime.atn.AltAndContextMap;

import antlr.v4.runtime.atn.ATNConfig;
import antlr.v4.runtime.misc.BitSet;

// Struct AltAndContextMap
/**
 * TODO add class description
 */
struct AltAndContextMap
{

    public BitSet[ATNConfig] altAndContextMap;

    public BitSet get(ATNConfig c)
    {
        // if (altAndContextMap.length == 0)
        //     return null;
        return altAndContextMap[c];
    }

    public void put(ATNConfig c, BitSet bitSet)
    {
        altAndContextMap[c] = bitSet;
    }

    public BitSet[] values()
    {
        return altAndContextMap.values;
    }

}

version(unittest) {
    import fluent.asserts;
    import unit_threaded;
    import antlr.v4.runtime.atn.PredictionContext;
    import antlr.v4.runtime.atn.EmptyPredictionContext;
    import antlr.v4.runtime.atn.ATNState;
    import antlr.v4.runtime.atn.BasicState;

    class Test {

        @Tags("altCM")
        @("initAltAndContextMap")
        unittest {
            AltAndContextMap acm;
            acm.values.length.should.equal(0);
            ATNState atns = new BasicState;
            PredictionContext pc = new EmptyPredictionContext;
            ATNConfig atnc = new ATNConfig(atns, 1, pc);
            atnc.should.not.beNull;
            BitSet bs;
            bs.set(5, true);
            acm.put(atnc, bs);
            import std.stdio;
            writefln("v = %s", acm);
            auto res = acm.get(atnc);
            bool x;
            if (atnc in acm.altAndContextMap) x = true;
            Assert.equal(x, true);
        }
    }
}
