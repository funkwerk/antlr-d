module antlr.v4.runtime.atn.ATNConfigSet;

import std.bitmanip;
import std.conv;
import std.algorithm;
import antlr.v4.runtime.IllegalStateException;
import antlr.v4.runtime.atn.ATNConfig;
import antlr.v4.runtime.atn.ATNState;
import antlr.v4.runtime.atn.AbstractConfigHashSet;
import antlr.v4.runtime.atn.PredictionContext;
import antlr.v4.runtime.atn.SemanticContext;
import antlr.v4.runtime.atn.ATNSimulator;
import antlr.v4.runtime.misc.DoubleKeyMap;

// Class ATNConfigSet
/**
 * TODO add class description
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

    /**
     * @uml
     * Indicates that the set of configurations is read-only. Do not
     * allow any code to manipulate the set; DFA states will point at
     * the sets and they must not change. This does not protect the other
     * fields; in particular, conflictingAlts is set after
     * we've made this readonly.
     */
    protected bool readonly = false;

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
    protected BitArray conflictingAlts;

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

    private int cachedHashCode = -1;

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
        addAll(old);
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
	if ( readonly ) throw new IllegalStateException("This set is readonly");
        if ( config.semanticContext!=SemanticContext.NONE ) {
            hasSemanticContext = true;
        }
        if (config.getOuterContextDepth() > 0) {
            dipsIntoOuterContext = true;
        }
        ATNConfig existing = configLookup.getOrAdd(config);
        if ( existing==config ) { // we added this new one
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
    public BitArray getAlts()
    {
        BitArray alts;
        foreach (ATNConfig config; configs) {
            if (alts.length <= config.alt)
                alts.length = config.alt + 20;
            alts.opIndexAssign(true, config.alt);
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

    public void optimizeConfigs(ATNSimulator interpreter)
    {
	if (readonly) throw new IllegalStateException("This set is readonly");
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
            configs.opEquals(other.configs) &&  // includes stack context
            this.fullCtx == other.fullCtx &&
            this.uniqueAlt == other.uniqueAlt &&
            this.conflictingAlts == other.conflictingAlts &&
            this.hasSemanticContext == other.hasSemanticContext &&
            this.dipsIntoOuterContext == other.dipsIntoOuterContext;

        //		System.out.println(same);
        return same;
    }

    public int hashCode()
    {
        if (readonly) {
            if (cachedHashCode == -1) {
                cachedHashCode = configs.hashCode();
            }
            return cachedHashCode;
        }

        return configs.hashCode();
    }

    public int size()
    {
        return to!int(configs.length);
    }

    public bool isEmpty()
    {
	return !configs.length;
    }

    public bool contains(Object o)
    {
    }

    public bool containsFast(ATNConfig obj)
    {
    }

}
