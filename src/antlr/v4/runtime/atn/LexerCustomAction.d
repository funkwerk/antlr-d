module antlr.v4.runtime.atn.LexerCustomAction;

import antlr.v4.runtime.atn.LexerAction;
import antlr.v4.runtime.atn.LexerActionType;
import antlr.v4.runtime.Lexer;
import antlr.v4.runtime.misc.MurmurHash;

// Class LexerCustomAction
/**
 * @uml
 * Executes a custom lexer action by calling {@link Recognizer#action} with the
 * rule and action indexes assigned to the custom action. The implementation of
 * a custom action is added to the generated code for the lexer in an override
 * of {@link Recognizer#action} when the grammar is compiled.
 *
 * <p>This class may represent embedded actions created with the <code>{...}</code>
 * syntax in ANTLR 4, as well as actions created for lexer commands where the
 * command argument could not be evaluated when the grammar was compiled.</p>
 */
class LexerCustomAction : LexerAction
{

    public int ruleIndex;

    public int actionIndex;

    /**
     * @uml
     * Constructs a custom lexer action with the specified rule and action
     * indexes.
     *
     *  @param ruleIndex The rule index to use for calls to
     *  {@link Recognizer#action}.
     *  @param actionIndex The action index to use for calls to
     *  {@link Recognizer#action}.
     */
    public this(int ruleIndex, int actionIndex)
    {
        this.ruleIndex = ruleIndex;
        this.actionIndex = actionIndex;
    }

    public int getRuleIndex()
    {
        return ruleIndex;
    }

    public int getActionIndex()
    {
        return actionIndex;
    }

    /**
     * @uml
     * This method returns {@link LexerActionType#CUSTOM}.
     */
    public LexerActionType getActionType()
    {
        return LexerActionType.CUSTOM;
    }

    /**
     * @uml
     * @override
     */
    public override bool isPositionDependent()
    {
        return true;
    }

    /**
     * @uml
     * @override
     */
    public override void execute(Lexer lexer)
    {
        lexer.action(null, ruleIndex, actionIndex);
    }

    public int hashCode()
    {
        int hash = MurmurHash.initialize();
        hash = MurmurHash.update(hash, getActionType().ordinal());
        hash = MurmurHash.update(hash, ruleIndex);
        hash = MurmurHash.update(hash, actionIndex);
        return MurmurHash.finish(hash, 3);
    }

    public bool equals(Object obj)
    {
	if (obj is this) {
            return true;
        }
        else if (obj.classinfo != LexerCustomAction.classinfo) {
            return false;
        }
        LexerCustomAction other = cast(LexerCustomAction)obj;
        return ruleIndex == other.ruleIndex
            && actionIndex == other.actionIndex;
    }

}
