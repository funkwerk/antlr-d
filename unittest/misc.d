import std.array;
import dunit.ng;
import std.conv;
import std.stdio;

import antlr.v4.runtime.misc.DoubleKeyMap;


class Test
{
    mixin UnitTest;

    DoubleKeyMap!(int, int, int) t1;

    @BeforeEach
    public void setUpDoubleKeyMap()
    {
        t1 = new DoubleKeyMap!(int, int, int);
        t1.put(7,1,12);
    }

    @Test
    public void getAssociatedValues()
    {
        t1.put(7,4,71);
        auto v1 = t1.values(7);
        v1.assertEquals([71, 12]);
        v1 = t1.values(0);
        v1.assertEquals([]);
    }
    
    @Test
    public void getValues()
    {
        t1.put(7,1,13);
        auto x = t1.get(7,1);
        x.assertEquals(13);
        x = t1.get(7,2);
        assert(x.isNull);

        auto y = t1.get(7);
        int[int] c;
        c[1] = 13;
        c.assertEquals(y);
        y = t1.get(6);
        assert(y.length == 0);
        t1.put(7,4,71);
        c[4] = 71;
        y = t1.get(7);
        assert(y == c);

        auto kx = t1.keySet;
        auto kk = [7];
        assert(kk == kx);

        auto tx = t1.keySet(8);
        assert(tx == []);
        tx = t1.keySet(7);
        assert(tx == [4, 1]);
    }

}
