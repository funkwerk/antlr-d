import std.array;
import dunit.ng;
import std.conv;
import std.stdio;
import std.functional;
import std.algorithm.sorting;
import std.algorithm;
import std.container.rbtree;
import std.container.array;

class Test
{
    mixin UnitTest;

    @Test
    public void assertEqualsFailure()
    {
        string expected = "bar";
        string actual = "baz";

        actual.assertEquals(expected);
    }

}
