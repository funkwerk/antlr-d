module antlr.v4.runtime.atn.OR;

import antlr.v4.runtime.atn.Operator;
import antlr.v4.runtime.atn.SemanticContext;

// Class OR
/**
 * TODO add class description
 */
class OR : Operator
{

    public SemanticContext[] opnds;

    public this(SemanticContext a, SemanticContext b)
    {
    }

    /**
     * @uml
     * @override
     */
    public override SemanticContext[] getOperands()
    {
        return opnds;
    }

    /**
     * @uml
     * @override
     */
    public override bool opEquals(Object obj)
    {
    }

    /**
     * @uml
     * @override
     */
    public override size_t toHash()
    {
    }

}
