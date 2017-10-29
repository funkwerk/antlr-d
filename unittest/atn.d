import dunit.ng;
import std.conv;
import std.stdio;

import antlr.v4.runtime.atn.ATNDeserializationOptions;

class Test
{
    mixin UnitTest;

    @Test
    public void constructATNDeserializationOptions()
    {
        auto so = new ATNDeserializationOptions();
        so.assertOp!"!is"(null);
        so.verifyATN.assertOp!"=="(true);
        so.readOnly.assertOp!"=="(false);
        so.generateRuleBypassTransitions.assertOp!"=="(false);
        so.optimize.assertOp!"=="(true);
    }

    @Test
    public void constructATNDeserializationDefaultOptions()
    {
        auto so = ATNDeserializationOptions.defaultOptions;
        so.assertOp!"!is"(null);
        so.verifyATN.assertOp!"=="(true);
        so.readOnly.assertOp!"=="(true);
        so.generateRuleBypassTransitions.assertOp!"=="(false);
        so.optimize.assertOp!"=="(true);
    }

}
