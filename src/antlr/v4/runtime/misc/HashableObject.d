module antlr.v4.runtime.misc.HashableObject;

// Class HashableObject
/**
 * anly needed to allow the compilation of MurmurHash
 */
abstract class HashableObject
{

    public int hashCode()
    {
         assert(false, "function not implemented!");
         return 1;
    }

}
