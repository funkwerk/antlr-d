/*
 * [The "BSD license"]
 *  Copyright (c) 2012 Terence Parr
 *  Copyright (c) 2012 Sam Harwell
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *  3. The name of the author may not be used to endorse or promote products
 *     derived from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 *  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 *  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

module antlr.v4.runtime.atn.EmptyPredictionContext;

import antlr.v4.runtime.atn.PredictionContext;
import antlr.v4.runtime.atn.SingletonPredictionContext;

// Class EmptyPredictionContext
/**
 * TODO add class description
 */
class EmptyPredictionContext : SingletonPredictionContext
{

    public this()
    {
        super(null, EMPTY_RETURN_STATE);
    }

    /**
     * @uml
     * @override
     */
    public override bool isEmpty()
    {
        return true;
    }

    /**
     * @uml
     * @override
     */
    public override size_t size()
    {
        return 1;
    }

    /**
     * @uml
     * @override
     */
    public override PredictionContext getParent(int index)
    {
        return null;
    }

    /**
     * @uml
     * @override
     */
    public override int getReturnState(int index)
    {
        return returnState;
    }

    /**
     * @uml
     * @override
     */
    public override bool opEquals(Object o)
    {
        return this is o;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        return "$";
    }

}

version(unittest) {
    import fluent.asserts;
    import unit_threaded;
    @Tags("emptyCont")
    @("emptyPredictionContextTest")
    unittest {
        auto spc = new EmptyPredictionContext;
        spc.should.not.beNull;
        spc.isEmpty.should.equal(true);
        auto spc1 = new EmptyPredictionContext;
        spc1.isEmpty.should.equal(true);
        if (spc == spc1)
            assert(true);
        auto spc2 = SingletonPredictionContext.create(null,
                                                      PredictionContext.EMPTY_RETURN_STATE);
        import std.stdio;
        writefln("spc2 = %s", spc2);
        //Assert.equal(spc.opEquals(spc1), true);
    }
}
