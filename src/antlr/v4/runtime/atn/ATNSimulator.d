/*
 * [The "BSD license"]
 *  Copyright (c) 2012 Terence Parr
 *  Copyright (c) 2012 Sam Harwell
 *  Copyright (c) 2017 Egbert Voigt
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

module antlr.v4.runtime.atn.ATNSimulator;

import std.uuid;
import antlr.v4.runtime.UnsupportedOperationException;
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.atn.ATNDeserializer;
import antlr.v4.runtime.atn.InterfaceATNSimulator;
import antlr.v4.runtime.dfa.DFAState;
import antlr.v4.runtime.atn.PredictionContextCache;
import antlr.v4.runtime.atn.PredictionContext;

// Class ATNSimulator
/**
 * TODO add class description
 */
abstract class ATNSimulator : InterfaceATNSimulator
{

    public static int SERIALIZED_VERSION;

    /**
     * @uml
     * This is the current serialized UUID.
     * deprecated Use {@link ATNDeserializer#checkCondition(boolean)} instead.
     */
    public static UUID SERIALIZED_UUID;

    /**
     * @uml
     * Must distinguish between missing edge and edge we know leads nowhere
     */
    public static DFAState ERROR;

    public ATN atn;

    /**
     * The context cache maps all PredictionContext objects that are equals()
     * to a single cached copy. This cache is shared across all contexts
     * in all ATNConfigs in all DFA states.  We rebuild each ATNConfigSet
     * to use only cached nodes/graphs in addDFAState(). We don't want to
     * fill this during closure() since there are lots of contexts that
     * pop up but are not used ever again. It also greatly slows down closure().
     *
     * <p>This cache makes a huge difference in memory and a little bit in speed.
     * For the Java grammar on java.*, it dropped the memory requirements
     * at the end from 25M to 16M. We don't store any of the full context
     * graphs in the DFA because they are limited to local context only,
     * but apparently there's a lot of repetition there as well. We optimize
     * the config contexts before storing the config set in the DFA states
     * by literally rebuilding them with cached subgraphs only.</p>
     *
     * <p>I tried a cache for use during closure operations, that was
     * whacked after each adaptivePredict(). It cost a little bit
     * more time I think and doesn't save on the overall footprint
     * so it's not worth the complexity.</p>
     */
    public PredictionContextCache sharedContextCache;

    public static this()
    {
        SERIALIZED_VERSION = ATNDeserializer.SERIALIZED_VERSION;
        SERIALIZED_UUID = ATNDeserializer.SERIALIZED_UUID;
    }

    public this(ATN atn, PredictionContextCache sharedContextCache)
    {
        this.atn = atn;
        this.sharedContextCache = sharedContextCache;
    }

    abstract public void reset();

    /**
     * @uml
     * Clear the DFA cache used by the current instance. Since the DFA cache may
     * be shared by multiple ATN simulators, this method may affect the
     * performance (but not accuracy) of other parsers which are being used
     * concurrently.
     *
     *  @throws UnsupportedOperationException if the current instance does not
     * support clearing the DFA.
     */
    public void clearDFA()
    {
        throw new UnsupportedOperationException("This ATN simulator does not support clearing the DFA.");
    }

    public PredictionContextCache getSharedContextCache()
    {
        return sharedContextCache;
    }

    public PredictionContext getCachedContext(PredictionContext context)
    {
        if (sharedContextCache is null)
            return context;
        PredictionContext[PredictionContext] visited;
        return PredictionContext.getCachedContext(context,
                                                  sharedContextCache,
                                                  visited);
    }

    /**
     * @uml
     * deprecated Use {@link ATNDeserializer#deserialize} instead.
     */
    public ATN deserialize(wstring data)
    {
        return new ATNDeserializer().deserialize(data);
    }

}
