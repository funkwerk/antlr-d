module antlr.v4.runtime.atn.RangeTransition;

import std.conv;
import antlr.v4.runtime.atn.Transition;
import antlr.v4.runtime.atn.TransitionStates;

// Class RangeTransition
/**
 * TODO add class description
 */
class RangeTransition : Transition
{

    public int from;

    public int to;

    public this(ATNState target, int from, int to)
    {
    }

    /**
     * @uml
     * @override
     */
    public override int getSerializationType()
    {
        return TransitionStates.RANGE;
    }

    /**
     * @uml
     * @override
     */
    public override IntervalSet label()
    {
        return IntervalSet.of(from, to);
    }

    /**
     * @uml
     * @override
     */
    public override bool matches(int symbol, int minVocabSymbol, int maxVocabSymbol)
    {
        return symbol >= from && symbol <= to;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        return "'" ~ to!string(from) ~ "'..'"~ to!string(to) ~ "'";
    }

}
