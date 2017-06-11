module antlr.v4.runtime.misc.ToHash;

import std.conv;

// Class ToHash
/**
 * TODO add class description
 */
class ToHash
{

    /**
     * @uml
     * @safe
     * @pure
     * @nothrow
     */
    public static size_t opCall(int i) @safe pure nothrow
    {
        return i;
    }

    /**
     * @uml
     * @safe
     * @pure
     * @nothrow
     */
    public static size_t opCall(string s) @safe pure nothrow
    {
        return to!int(s[0]);
    }

}
