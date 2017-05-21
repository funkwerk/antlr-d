module antlr.v4.runtime.atn.LexerPushModeAction;

import std.format;
import antlr.v4.runtime.Lexer;
import antlr.v4.runtime.atn.LexerAction;
import antlr.v4.runtime.atn.LexerActionType;
import antlr.v4.runtime.misc.MurmurHash;
import antlr.v4.runtime.misc.Utils;

// Class LexerPushModeAction
/**
 * @uml
 * Implements the {@code pushMode} lexer action by calling
 * {@link Lexer#pushMode} with the assigned mode.
 */
class LexerPushModeAction : LexerAction
{

    public int mode;

    /**
     * @uml
     * Constructs a new {@code pushMode} action with the specified mode value.
     *  @param mode The mode value to pass to {@link Lexer#pushMode}.
     */
    public this(int mode)
    {
        this.mode = mode;
    }

    /**
     * @uml
     * Get the lexer mode this action should transition the lexer to.
     *
     *  @return The lexer mode for this {@code pushMode} command.
     */
    public int getMode()
    {
        return mode;
    }

    /**
     * @uml
     * @safe
     * @nothrow
     */
    public LexerActionType getActionType() @safe nothrow
    {
        return LexerActionType.PUSH_MODE;
    }

    /**
     * @uml
     * {@inheritDoc}
     *  @return This method returns {@code false}.
     */
    public bool isPositionDependent()
    {
        return false;
    }

    /**
     * @uml
     * {@inheritDoc}
     *
     * <p>This action is implemented by calling {@link Lexer#pushMode} with the
     * value provided by {@link #getMode}.</p>
     */
    public void execute(Lexer lexer)
    {
        lexer.pushMode(mode);
    }

    public int hashCode()
    {
        int hash = MurmurHash.initialize();
        hash = MurmurHash.update(hash, Utils.rank(getActionType));
        return MurmurHash.finish(hash, 1);
    }

    public bool equals(Object obj)
    {
        if (obj == this) {
            return true;
        }
        else if (obj.classinfo != LexerPushModeAction.classinfo) {
            return false;
        }
        return mode == (cast(LexerPushModeAction)obj).mode;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        return format("pushMode(%d)", mode);
    }

}
