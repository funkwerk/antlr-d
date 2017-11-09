module misc;

import unit_threaded.should : shouldBeIn, shouldEqual, shouldNotEqual;
import antlr.v4.runtime.misc.DoubleKeyMap;

class Test
{
    
    @("initAndOperationsDoubleKeyMap")
    unittest {
        auto t1 = new DoubleKeyMap!(int, int, int);
        t1.put(7,1,12);
        t1.put(7,1,13);
        auto x = t1.get(7,1);
        x.shouldEqual(13);
        x = t1.get(7,2);
        assert(x.isNull);

        auto y = t1.get(7);
        int[int] c;
        c[1] = 13;
        c.shouldEqual(y);
        y = t1.get(6);
        assert(y.length == 0);
        t1.put(7,4,71);
        c[4] = 71;
        y = t1.get(7);
        assert(y == c);

        auto v1 = t1.values(7);
        assert(v1 == [71, 13]);
        v1 = t1.values(0);
        assert(v1 == []);

        auto kx = t1.keySet;
        auto kk = [7];
        assert(kk == kx);

        auto tx = t1.keySet(8);
        assert(tx == []);
        tx = t1.keySet(7);
        assert(tx == [4, 1]);
    }

}
