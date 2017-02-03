import dunit.ng;
import std.conv;
import std.stdio;

import antlr.v4.runtime.atn.PrecedencePredicate;

class Test
{
    mixin UnitTest;

    @Test
    public void constructPrecedencePredicate()
    {
        auto pp = new PrecedencePredicate(1);
        pp.assertEquals(null);
    }

}
