import dunit.ng;
import std.conv;
import std.stdio;

import antlr.v4.runtime.atn.SemanticContext;

class Test
{
    mixin UnitTest;

    @Test
    public void constructPrecedencePredicate()
    {
        auto sc = new SemanticContext;
        auto pp = sc.new PrecedencePredicate(1);
        pp.assertEquals(null);
    }

}
