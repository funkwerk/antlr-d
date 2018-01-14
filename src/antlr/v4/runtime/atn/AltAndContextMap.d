module antlr.v4.runtime.atn.AltAndContextMap;

import antlr.v4.runtime.atn.ATNConfig;
import antlr.v4.runtime.misc.BitSet;

// Struct AltAndContextMap
/**
 * A structure that ATN configurations maps to bit vectors
 */
struct AltAndContextMap
{

    public BitSet[ATNConfig] altAndContextMap;

    public bool hasKey(ATNConfig aTNConfig)
    {
        if (aTNConfig in altAndContextMap)
            return true;
        return false;
    }

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
        return altAndContextMap.values;
    }

}
