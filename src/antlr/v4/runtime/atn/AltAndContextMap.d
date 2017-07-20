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
        return altAndContextMap[c];
    }

    public void put(ATNConfig c, BitSet bitSet)
    {
        altAndContextMap[c] = bitSet;
    }

    public BitSet[] values()
    {
    }

}
