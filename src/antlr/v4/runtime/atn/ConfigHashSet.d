module antlr.v4.runtime.atn.ConfigHashSet;

import antlr.v4.runtime.atn.AbstractConfigHashSet;
import antlr.v4.runtime.atn.ConfigEqualityComparator;

// Class ConfigHashSet
/**
 * The reason that we need this is because we don't want the hash map to use
 * the standard hash code and equals. We need all configurations with the same
 * {@code (s,i,_,semctx)} to be equal. Unfortunately, this key effectively doubles
 * the number of objects associated with ATNConfigs. The other solution is to
 * use a hash table that lets us specify the equals/hashcode operation.
 */
class ConfigHashSet : AbstractConfigHashSet
{

    public this()
    {
        super(&ConfigEqualityComparator.hashOf, &ConfigEqualityComparator.opEquals);
    }

}
