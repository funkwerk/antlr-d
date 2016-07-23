module antlr.v4.runtime.atn.ATNConfig;

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

}
