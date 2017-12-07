module antlr.v4.runtime.atn.LexerConfigHashSet;

import antlr.v4.runtime.atn.AbstractConfigHashSet;
import antlr.v4.runtime.misc.ObjectEqualityComparator;

// Class LexerConfigHashSet
/**
 * TODO add class description
 */
class LexerConfigHashSet : AbstractConfigHashSet
{

    public this()
    {
        super(&ObjectEqualityComparator.hashOf, &ObjectEqualityComparator.opEquals);
    }

}

version(unittest) {
    import fluent.asserts;
    import unit_threaded;
    import std.stdio;
    import antlr.v4.runtime.atn.ATNConfig;
    import antlr.v4.runtime.atn.BasicState;
    import antlr.v4.runtime.atn.PredictionContext;
    import antlr.v4.runtime.atn.EmptyPredictionContext;
    @Tags("lexer")
        @("lexerConfigHashSetTest")
        unittest {
            LexerConfigHashSet lexerHS = new LexerConfigHashSet;
            lexerHS.should.not.beNull;
            lexerHS.toString.should.equal("{}");
            LexerConfigHashSet lexerHS1 = new LexerConfigHashSet;
            lexerHS1.should.not.beNull;
            lexerHS1.toString.should.equal("{}");
            lexerHS1.toHash.should.equal(0);

            PredictionContext predCo = new EmptyPredictionContext;
            BasicState basicS = new BasicState;
            basicS.should.not.beNull;
            ATNConfig atnC = new ATNConfig(basicS, 1, predCo);
            atnC.should.not.beNull;
            atnC.toString.should.equal("(-1,1,[$])");
            auto resConfig = lexerHS.add(atnC);
            lexerHS.toString.should.equal("{(-1,1,[$])}");
            resConfig.should.equal(true);
            resConfig = lexerHS.add(atnC);
            lexerHS.toString.should.equal("{(-1,1,[$])}");
            resConfig.should.equal(true);

            ATNConfig atnC1 = new ATNConfig(basicS, 2, predCo);
            resConfig = lexerHS.add(atnC1);
            lexerHS.toString.should.equal("{(-1,1,[$]), (-1,2,[$])}");
            ATNConfig atnC2 = new ATNConfig(basicS, 3, predCo);
            resConfig = lexerHS.add(atnC2);
            Assert.equal(lexerHS.contains(atnC), true);
            Assert.equal(lexerHS.contains(atnC1), true);
            Assert.equal(lexerHS.contains(atnC2), true);
        }
}
