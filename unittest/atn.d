import dunit.ng;
import std.conv;
import std.stdio;

import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.atn.ATNDeserializer;
import antlr.v4.runtime.atn.ATNDeserializationOptions;
import antlr.v4.runtime.atn.DecisionState;

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

    @Test
    public void constructATNDeserializer()
    {
        static immutable wstring s =
            "\u0003\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\u0002\u0005\u001b"~
            "\b\u0001\u0004\u0002\t\u0002\u0004\u0003\t\u0003\u0004\u0004\t\u0004\u0003"~
            "\u0002\u0003\u0002\u0003\u0002\u0003\u0002\u0003\u0002\u0003\u0002\u0003"~
            "\u0003\u0006\u0003\u0011\n\u0003\r\u0003\u000e\u0003\u0012\u0003\u0004"~
            "\u0006\u0004\u0016\n\u0004\r\u0004\u000e\u0004\u0017\u0003\u0004\u0003"~
            "\u0004\u0002\u0002\u0005\u0003\u0003\u0005\u0004\u0007\u0005\u0003\u0002"~
            "\u0004\u0003\u0002c|\u0005\u0002\u000b\f\u000f\u000f\"\"\u001c\u0002\u0003"~
            "\u0003\u0002\u0002\u0002\u0002\u0005\u0003\u0002\u0002\u0002\u0002\u0007"~
            "\u0003\u0002\u0002\u0002\u0003\t\u0003\u0002\u0002\u0002\u0005\u0010\u0003"~
            "\u0002\u0002\u0002\u0007\u0015\u0003\u0002\u0002\u0002\t\n\u0007j\u0002"~
            "\u0002\n\u000b\u0007g\u0002\u0002\u000b\f\u0007n\u0002\u0002\f\r\u0007"~
            "n\u0002\u0002\r\u000e\u0007q\u0002\u0002\u000e\u0004\u0003\u0002\u0002"~
            "\u0002\u000f\u0011\t\u0002\u0002\u0002\u0010\u000f\u0003\u0002\u0002\u0002"~
            "\u0011\u0012\u0003\u0002\u0002\u0002\u0012\u0010\u0003\u0002\u0002\u0002"~
            "\u0012\u0013\u0003\u0002\u0002\u0002\u0013\u0006\u0003\u0002\u0002\u0002"~
            "\u0014\u0016\t\u0003\u0002\u0002\u0015\u0014\u0003\u0002\u0002\u0002\u0016"~
            "\u0017\u0003\u0002\u0002\u0002\u0017\u0015\u0003\u0002\u0002\u0002\u0017"~
            "\u0018\u0003\u0002\u0002\u0002\u0018\u0019\u0003\u0002\u0002\u0002\u0019"~
            "\u001a\b\u0004\u0002\u0002\u001a\b\u0003\u0002\u0002\u0002\u0005\u0002"~
            "\u0012\u0017\u0003\b\u0002\u0002";

        auto ser = new ATNDeserializer;
        auto atn = ser.deserialize(s);
        int nd = atn.getNumberOfDecisions;
        nd.assertEquals(3);
        DecisionState ds = atn.getDecisionState(0);
        ds.toString.assertEquals("0");

        ds = atn.getDecisionState(1);
        ds.toString.assertEquals("16");

        ds = atn.getDecisionState(2);
        ds.toString.assertEquals("21");
    }

}
