import unit_threaded;
import fluent.asserts : should, Assert;

class Test {
    @Tags("simpleTree")
    @("assertEqualsFailure")
    unittest {
        string expected = "bar";
        string actual = "bar";
        actual.should.equal(expected);
    }

}
