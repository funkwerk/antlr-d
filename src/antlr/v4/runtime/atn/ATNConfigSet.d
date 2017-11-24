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

module antlr.v4.runtime.atn.ATNConfigSet;

import std.bitmanip;
import std.array;
import std.conv;
import std.format;
import std.algorithm;
import antlr.v4.runtime.IllegalStateException;
import antlr.v4.runtime.UnsupportedOperationException;
import antlr.v4.runtime.atn.ATNConfig;
import antlr.v4.runtime.atn.ATNState;
import antlr.v4.runtime.atn.AbstractConfigHashSet;
import antlr.v4.runtime.misc.AbstractEqualityComparator;
import antlr.v4.runtime.atn.PredictionContext;
import antlr.v4.runtime.atn.SemanticContext;
import antlr.v4.runtime.atn.InterfaceATNSimulator;
import antlr.v4.runtime.misc.DoubleKeyMap;
import antlr.v4.runtime.misc.BitSet;

// Class ATNConfigSet
/**
 * @uml
 * Specialized {@link Set}{@code <}{@link ATNConfig}{@code >} that can track
 * info about the set, with support for combining similar configurations using a
 * graph-structured stack.
 *
 * The reason that we need this is because we don't want the hash map to use
 * the standard hash code and equals. We need all configurations with the same
 * {@code (s,i,_,semctx)} to be equal. Unfortunately, this key effectively doubles
 * the number of objects associated with ATNConfigs. The other solution is to
 * use a hash table that lets us specify the equals/hashcode operation.
 */
class ATNConfigSet
{

    // Class ConfigHashSet
    /**
     * The reason that we need this is because we don't want the hash map to use
     * the standard hash code and equals. We need all configurations with the same
     * {@code (s,i,_,semctx)} to be equal. Unfortunately, this key effectively doubles
     * the number of objects associated with ATNConfigs. The other solution is to
     * use a hash table that lets us specify the equals/hashcode operation.
     */
    class ConfigHashSet : AbstractConfigHashSet
    {

        public this()
        {
            super(&ConfigEqualityComparator.hashOf, &ConfigEqualityComparator.opEquals);
        }

    }
    // Singleton ConfigEqualityComparator
    /**
     * TODO add class description
     */
    static class ConfigEqualityComparator : AbstractEqualityComparator!ATNConfig
    {

        /**
         * The single instance of ConfigEqualityComparator.
         */
        private static __gshared ATNConfigSet.ConfigEqualityComparator instance_;

        /**
         * @uml
         * @nothrow
         * @safe
         */
        public static size_t hashOf(Object obj) @safe nothrow
        {
            auto o = cast(ATNConfig) obj;
            size_t hashCode = 7;
            hashCode = 31 * hashCode + o.state.stateNumber;
            hashCode = 31 * hashCode + o.alt;
            hashCode = 31 * hashCode + o.semanticContext.toHash;
            return hashCode;
        }

        public static bool opEquals(Object aObj, Object bObj)
        {
            if (aObj is null || bObj is null)
                return false;
            auto a = cast(ATNConfig) aObj;
            auto b = cast(ATNConfig) bObj;
            if (a is b)
                return true;
            return a.state.stateNumber == b.state.stateNumber
                && a.alt == b.alt
                && a.semanticContext.opEquals(b.semanticContext);
        }

        /**
         * Creates the single instance of ConfigEqualityComparator.
         */
        private shared static this()
        {
            instance_ = new ConfigEqualityComparator;
        }

        /**
         * Returns: A single instance of ConfigEqualityComparator.
         */
        public static ConfigEqualityComparator instance()
        {
            return instance_;
        }

    }

    /**
     * @uml
     * Indicates that the set of configurations is read-only. Do not
     * allow any code to manipulate the set; DFA states will point at
     * the sets and they must not change. This does not protect the other
     * fields; in particular, conflictingAlts is set after
     * we've made this readonly.
     * @read
     */
    public bool readonly_ = false;

    public AbstractConfigHashSet configLookup;

    /**
     * @uml
     * Track the elements as they are added to the set; supports get(i)
     */
    public ATNConfig[] configs;

    /**
     * @uml
     * TODO: these fields make me pretty uncomfortable but nice to pack up info together, saves recomputation
     * TODO: can we track conflicts as they are added to save scanning configs later?
     */
    public int uniqueAlt;

    /**
     * @uml
     * Currently this is only used when we detect SLL conflict; this does
     * not necessarily represent the ambiguous alternatives. In fact,
     * I should also point out that this seems to include predicated alternatives
     * that have predicates that evaluate to false. Computed in computeTargetState().
     */
    public BitSet conflictingAlts;

    /**
     * @uml
     * Used in parser and lexer. In lexer, it indicates we hit a pred
     * while computing a closure operation.  Don't make a DFA state from this.
     */
    public bool hasSemanticContext;

    public bool dipsIntoOuterContext;

    /**
     * @uml
     * Indicates that this configuration set is part of a full context
     * LL prediction. It will be used to determine how to merge $. With SLL
     * it's a wildcard whereas it is not for LL context merge.
     * @final
     */
    public bool fullCtx;

    private size_t cachedHashCode = -1;

    public this(bool fullCtx)
    {
        configLookup = new ConfigHashSet();
        this.fullCtx = fullCtx;
    }

    public this()
    {
        this(true);
    }

    public this(ATNConfigSet old)
    {
        this(old.fullCtx);
        addAll(old.configs);
        this.uniqueAlt = old.uniqueAlt;
        this.conflictingAlts = old.conflictingAlts;
        this.hasSemanticContext = old.hasSemanticContext;
        this.dipsIntoOuterContext = old.dipsIntoOuterContext;
    }

    public bool add(ATNConfig config)
    {
        return add(config, null);
    }

    /**
     * @uml
     * Adding a new config means merging contexts with existing configs for
     * {@code (s, i, pi, _)}, where {@code s} is the
     * {@link ATNConfig#state}, {@code i} is the {@link ATNConfig#alt}, and
     * {@code pi} is the {@link ATNConfig#semanticContext}. We use
     * {@code (s,i,pi)} as key.
     *
     * <p>This method updates {@link #dipsIntoOuterContext} and
     * {@link #hasSemanticContext} when necessary.</p>
     */
    public bool add(ATNConfig config, DoubleKeyMap!(PredictionContext, PredictionContext, PredictionContext) mergeCache)
    {
	if (readonly_) throw new IllegalStateException("This set is readonly");
        if (config.semanticContext != SemanticContext.NONE) {
            hasSemanticContext = true;
        }
        if (config.getOuterContextDepth() > 0) {
            dipsIntoOuterContext = true;
        }
        ATNConfig existing = configLookup.getOrAdd(config);
        if (existing == config) { // we added this new one
            cachedHashCode = -1;
            configs ~= config;  // track order here
            return true;
        }
        // a previous (s,i,pi,_), merge with it and save result
        bool rootIsWildcard = !fullCtx;
        PredictionContext merged =
            PredictionContext.merge(existing.context, config.context, rootIsWildcard, mergeCache);
        // no need to check for existing.context, config.context in cache
        // since only way to create new graphs is "call rule" and here. We
        // cache at both places.
        existing.reachesIntoOuterContext =
            max(existing.reachesIntoOuterContext, config.reachesIntoOuterContext);

        // make sure to preserve the precedence filter suppression during the merge
        if (config.isPrecedenceFilterSuppressed()) {
            existing.setPrecedenceFilterSuppressed(true);
        }

        existing.context = merged; // replace context; no need to alt mapping
        return true;
    }

    /**
     * @uml
     * Return a List holding list of configs
     */
    public ATNConfig[] elements()
    {
        return configs;
    }

    public ATNState[] getStates()
    {
        ATNState[] states;
        foreach (ATNConfig c; configs) {
            states ~= c.state;
        }
        return states;
    }

    /**
     * @uml
     * Gets the complete set of represented alternatives for the configuration
     * set.
     *
     *  @return the set of represented alternatives in this configuration set
     */
    public BitSet getAlts()
    {
        BitSet alts;
        foreach (ATNConfig config; configs) {
            alts.set(config.alt, true);
        }
        return alts;
    }

    public SemanticContext[] getPredicates()
    {
	SemanticContext[] preds;
        foreach (ATNConfig c; configs) {
            if (c.semanticContext != SemanticContext.NONE) {
                preds ~= c.semanticContext;
            }
        }
        return preds;
    }

    public ATNConfig get(int i)
    {
        return configs[i];
    }

    public void optimizeConfigs(InterfaceATNSimulator interpreter)
    {
	if (readonly_) throw new IllegalStateException("This set is readonly");
        if ( configLookup.isEmpty() ) return;
        foreach (ATNConfig config; configs) {
            //			int before = PredictionContext.getAllContextNodes(config.context).size();
            config.context = interpreter.getCachedContext(config.context);
            //			int after = PredictionContext.getAllContextNodes(config.context).size();
            //			System.out.println("configs "+before+"->"+after);
        }
    }

    public bool addAll(ATNConfig[] coll)
    {
	foreach (ATNConfig c; coll) add(c);
        return false;
    }

    /**
     * @uml
     * @override
     */
    public override bool opEquals(Object o)
    {
	if (o is this) {
            return true;
        }
        else if (o.classinfo != ATNConfigSet.classinfo) {
            return false;
        }

        // System.out.print("equals " + this + ", " + o+" = ");
        ATNConfigSet other = cast(ATNConfigSet)o;
        bool same = configs !is null &&
            this.opEquals(other) &&  // includes stack context
            this.fullCtx == other.fullCtx &&
            this.uniqueAlt == other.uniqueAlt &&
            this.conflictingAlts == other.conflictingAlts &&
            this.hasSemanticContext == other.hasSemanticContext &&
            this.dipsIntoOuterContext == other.dipsIntoOuterContext;

        //		System.out.println(same);
        return same;
    }

    /**
     * @uml
     * @override
     * @safe
     * @nothrow
     */
    public override size_t toHash() @safe nothrow
    {
        if (readonly_) {
            if (cachedHashCode == -1) {
                cachedHashCode = configs.map!(n => n.toHash).sum;
            }
            return cachedHashCode;
        }
        return configs.map!(n => n.toHash).sum;
    }

    public int size()
    {
        return to!int(configs.length);
    }

    public bool isEmpty()
    {
	return !configs.length;
    }

    public bool contains(ATNConfig o)
    {
        if (configLookup is null) {
            throw new UnsupportedOperationException("This method is not implemented for readonly sets.");
        }

        return configLookup.contains(o);
    }

    public bool containsFast(ATNConfig obj)
    {
        if (configLookup is null) {
            throw new UnsupportedOperationException("This method is not implemented for readonly sets.");
        }

        return configLookup.containsFast(obj);
    }

    public void clear()
    {
        if (readonly_) throw new IllegalStateException("This set is readonly");
        configs.length = 0;
        cachedHashCode = -1;
        configLookup.clear();
    }

    public void readonly(bool readonly)
    {
        readonly_ = readonly;
        configLookup = null; // can't mod, no need for lookup cache
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
	auto buf = appender!string;
        buf.put(to!string(elements));
        if (hasSemanticContext) buf.put(format(",hasSemanticContext=%s", hasSemanticContext));
        if (uniqueAlt != 0) // ATN.INVALID_ALT_NUMBER
            buf.put(format(",uniqueAlt=%s", uniqueAlt));
        if (!conflictingAlts.isEmpty)
            buf.put(format(",conflictingAlts=%s", conflictingAlts));
        if (dipsIntoOuterContext) buf.put(",dipsIntoOuterContext");
        return buf.data;
    }

    public final bool readonly()
    {
        return this.readonly_;
    }

}

version(unittest) {
    import fluent.asserts;
    import unit_threaded;
    import std.stdio;  
    @Tags("atnConfigSet")
	@("atnConfigSetTest")
	unittest {
            ATNConfigSet atnConfigSet = new ATNConfigSet;
            atnConfigSet.should.not.beNull;
            atnConfigSet.readonly.should.equal(false);
            atnConfigSet.toString.should.equal("[]");
            atnConfigSet.isEmpty.should.equal(true);
            atnConfigSet.toHash.should.equal(0);
        }
}
