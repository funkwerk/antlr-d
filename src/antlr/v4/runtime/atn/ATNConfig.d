/*
 * [The "BSD license"]
 *  Copyright (c) 2016 Terence Parr
 *  Copyright (c) 2016 Sam Harwell
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

module antlr.v4.runtime.atn.ATNConfig;

import std.array;
import std.conv;
import std.stdio;
import antlr.v4.runtime.atn.ATNState;
import antlr.v4.runtime.atn.PredictionContext;
import antlr.v4.runtime.atn.SemanticContext;
import antlr.v4.runtime.atn.Predicate;
import antlr.v4.runtime.misc.MurmurHash;

// Class ATNConfig
/**
 * @uml
 * A tuple: (ATN state, predicted alt, syntactic, semantic context).
 * The syntactic context is a graph-structured stack node whose
 * path(s) to the root is the rule invocation(s)
 * chain used to arrive at the state.  The semantic context is
 * the tree of semantic predicates encountered before reaching
 * an ATN state.
 */
class ATNConfig
{

    /**
     * @uml
     * This field stores the bit mask for implementing the
     * {@link #isPrecedenceFilterSuppressed} property as a bit within the
     * existing {@link #reachesIntoOuterContext} field.
     */
    public static immutable int SUPPRESS_PRECEDENCE_FILTER = 0x40000000;

    /**
     * @uml
     * The ATN state associated with this configuration.
     */
    public ATNState state;

    /**
     * @uml
     * What alt (or lexer rule) is predicted by this configuration?
     */
    public int alt;

    /**
     * @uml
     * The stack of invoking states leading to the rule/states associated
     * with this config.  We track only those contexts pushed during
     * execution of the ATN simulator.
     */
    public PredictionContext context;

    /**
     * @uml
     * We cannot execute predicates dependent upon local context unless
     * we know for sure we are in the correct context. Because there is
     * no way to do this efficiently, we simply cannot evaluate
     * dependent predicates unless we are in the rule that initially
     * invokes the ATN simulator.
     *
     * <p>
     * closure() tracks the depth of how far we dip into the outer context:
     * depth &gt; 0.  Note that it may not be totally accurate depth since I
     * don't ever decrement. TODO: make it a boolean then</p>
     *
     * <p>
     * For memory efficiency, the {@link #isPrecedenceFilterSuppressed} method
     * is also backed by this field. Since the field is publicly accessible, the
     * highest bit which would not cause the value to become negative is used to
     * store this field. This choice minimizes the risk that code which only
     * compares this value to 0 would be affected by the new purpose of the
     * flag. It also ensures the performance of the existing {@link ATNConfig}
     * constructors as well as certain operations like
     * {@link ATNConfigSet#add(ATNConfig, DoubleKeyMap)} method are
     * <em>completely</em> unaffected by the change.</p>
     */
    public int reachesIntoOuterContext;

    public SemanticContext semanticContext;

    /**
     * @uml
     * Duplication
     */
    public this(ATNConfig old)
    {
        this.state = old.state;
        this.alt = old.alt;
        this.context = old.context;
        this.semanticContext = old.semanticContext;
        this.reachesIntoOuterContext = old.reachesIntoOuterContext;
    }

    public this(ATNState state, int alt, PredictionContext context)
    {
        this(state, alt, context, new Predicate());
    }

    public this(ATNState state, int alt, PredictionContext context, const SemanticContext semanticContext)
    {
        this.state = state;
        this.alt = alt;
        this.context = context;
        this.semanticContext = cast(SemanticContext) semanticContext;
    }

    public this(ATNConfig c, ATNState state)
    {
        //this.semanticContext = c.semanticContext;
        this(c, state, c.context, c.semanticContext);
    }

    public this(ATNConfig c, ATNState state, PredictionContext context)
    {
        this(c, state, context, c.semanticContext);
    }

    public this(ATNConfig c, ATNState state, PredictionContext context, const SemanticContext semanticContext)
    {
        this.state = state;
        this.alt = c.alt;
        this.context = context;
        this.semanticContext = cast(SemanticContext) semanticContext;
        this.reachesIntoOuterContext = c.reachesIntoOuterContext;
    }

    /**
     * @uml
     * This method gets the value of the {@link #reachesIntoOuterContext} field
     * as it existed prior to the introduction of the
     * {@link #isPrecedenceFilterSuppressed} method.
     */
    public int getOuterContextDepth()
    {
        return reachesIntoOuterContext & ~SUPPRESS_PRECEDENCE_FILTER;
    }

    public bool isPrecedenceFilterSuppressed()
    {
        return (reachesIntoOuterContext & SUPPRESS_PRECEDENCE_FILTER) != 0;
    }

    public void setPrecedenceFilterSuppressed(bool value)
    {
        if (value) {
            this.reachesIntoOuterContext |= 0x40000000;
        }
        else {
            this.reachesIntoOuterContext &= ~SUPPRESS_PRECEDENCE_FILTER;
        }
    }

    /**
     * @uml
     * @override
     * An ATN configuration is equal to another if both have
     * the same state, they predict the same alternative, and
     * syntactic/semantic contexts are the same.
     */
    public override bool opEquals(Object o)
    {
        if (typeid(typeof(o)) != typeid(ATNConfig*)) {
            return false;
        }

        return this.opEquals(cast(ATNConfig)o);
    }

    public bool opEquals(ATNConfig other)
    {
        if (this is other) {
            return true;
        } else if (other is null) {
            return false;
        }

        return this.state.stateNumber == other.state.stateNumber
            && this.alt == other.alt
            && (this.context is other.context ||
                (this.context !is null && this.context.opEquals(other.context)))
            //&& this.semanticContext.opEquals(other.semanticContext)
            && this.isPrecedenceFilterSuppressed() == other.isPrecedenceFilterSuppressed();

    }

    /**
     * @uml
     * @safe
     * @nothrow
     * @override
     */
    public override size_t toHash() @safe nothrow
    {
        size_t hashCode = MurmurHash.initialize(7);
        hashCode = MurmurHash.update(hashCode, state.stateNumber);
        hashCode = MurmurHash.update(hashCode, alt);
        hashCode = MurmurHash.update(hashCode, context);
        hashCode = MurmurHash.update(hashCode, semanticContext);
        hashCode = MurmurHash.finish(hashCode, 4);
        return hashCode;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        return toString(true);
    }

    public string toString(bool showAlt)
    {
        auto buf = appender!string;
        buf.put('(');
        buf.put(state.toString);
        if ( showAlt ) {
            buf.put(",");
            buf.put(to!string(alt));
        }
        if (context !is null) {
            buf.put(",[");
            buf.put(context.toString());
            buf.put("]");
        }
        if (semanticContext !is null && semanticContext != SemanticContext.NONE ) {
            buf.put(",");
            //            buf.put(semanticContext);
        }
        if ( getOuterContextDepth()>0 ) {
            //            buf.put(",up=").put(getOuterContextDepth());
        }
        buf.put(')');
        return buf.data;
    }

}
