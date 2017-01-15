module antlr.v4.runtime.atn.PrecedencePredicate;

import antlr.v4.runtime.atn.SemanticContext;
import antlr.v4.runtime.RuleContext;
import antlr.v4.runtime.Recognizer;
import antlr.v4.runtime.atn.ATNSimulator;

// Class PrecedencePredicate
/**
 * TODO add class description
 */
class PrecedencePredicate : SemanticContext
{

    /**
     * @uml
     * @final
     */
    public int precedence;

    protected this()
    {
    }

    public this(int precedence)
    {
    }

    /**
     * @uml
     * @override
     */
    public override bool eval(Recognizer!(int, ATNSimulator) parser, RuleContext parserCallStack)
    {
    }

}
