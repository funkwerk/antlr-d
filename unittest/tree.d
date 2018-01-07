import unit_threaded;
import fluent.asserts;

class Test {
    @Tags("simpleTree")
    @("assertEqualsFailure")
    unittest {
        string expected = "bar";
        string actual = "bar";
        actual.should.equal(expected);
    }

}
