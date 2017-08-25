module antlr.v4.runtime.atn.AND;

import std.algorithm.comparison;
import antlr.v4.runtime.Parser;
import antlr.v4.runtime.atn.Operator;
import antlr.v4.runtime.RuleContext;
import antlr.v4.runtime.atn.SemanticContext;
import antlr.v4.runtime.misc.MurmurHash;

// Class AND
/**
 * TODO add class description
 */
class AND : Operator
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
	if (this == obj) return true;
        if (obj.classinfo != AND.classinfo) return false;
        AND other = cast(AND)obj;
        return equal(this.opnds, other.opnds);
    }

    /**
     * @uml
     * @override
     */
    public override size_t toHash()
    {
        auto and = new AND;
        return MurmurHash.hashCode(opnds, and.toHash);
    }

    public bool eval(Parser parser, RuleContext parserCallStack)
    {
	foreach (SemanticContext opnd; opnds) {
            if (!opnd.eval(parser, parserCallStack)) return false;
        }
        return true;
    }

    public SemanticContext evalPrecedence(Parser parser, RuleContext parserCallStack)
    {
	bool differs = false;
        SemanticContext[] operands;
        foreach (SemanticContext context; opnds) {
            SemanticContext evaluated = context.evalPrecedence(parser, parserCallStack);
            differs |= (evaluated != context);
            if (evaluated is null) {
                // The AND context is false if any element is false
                return null;
            }
            else if (evaluated != NONE) {
                // Reduce the result by skipping true elements
                operands ~= evaluated;
            }
        }

        if (!differs) {
            return this;
        }

        if (operands.length == 0) {
            // all elements were true, so the AND context is true
            return NONE;
        }

        SemanticContext result = operands[0];
        for (int i = 1; i < operands.length; i++) {
            result = SemanticContext.and(result, operands[i]);
        }

        return result;
	
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
    }

}
