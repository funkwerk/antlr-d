import std.array;
import std.conv;
import std.stdio;
import std.functional;
import std.algorithm.sorting;
import std.algorithm;
import std.container.rbtree;
import std.container.array;
import fluent.asserts;

class Test {

    @("assertEqualsFailure")
    unittest {
        string expected = "bar";
        string actual = "bar";

        actual.should.equal(expected);
    }

}
