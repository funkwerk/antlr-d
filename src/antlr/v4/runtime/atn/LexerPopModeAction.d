module antlr.v4.runtime.atn.LexerPopModeAction;

import antlr.v4.runtime.Lexer;
import antlr.v4.runtime.atn.LexerAction;
import antlr.v4.runtime.atn.LexerActionType;
import antlr.v4.runtime.misc.MurmurHash;
import antlr.v4.runtime.misc.Utils;

// Singleton LexerPopModeAction
/**
 * @uml
 * Implements the {@code popMode} lexer action by calling {@link Lexer#popMode}.
 *
 * <p>The {@code popMode} command does not have any parameters, so this action is
 * implemented as a singleton instance exposed by {@link #INSTANCE}.</p>
 * @safe
 * @nothrow
 */
class LexerPopModeAction : LexerAction
{

    /**
     * The single instance of LexerPopModeAction.
     */
    private static __gshared LexerPopModeAction instance_;

    /**
     * @uml
     * {@inheritDoc}
     *  @return This method returns {@link LexerActionType#POP_MODE}.
     * @safe
     * @nothrow
     */
    public LexerActionType getActionType() @safe nothrow
    {
        return LexerActionType.POP_MODE;
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
     * <p>This action is implemented by calling {@link Lexer#popMode}.</p>
     */
    public void execute(Lexer lexer)
    {
        lexer.popMode();
    }

    /**
     * @uml
     * @override
     */
    public override size_t toHash()
    {
        size_t hash = MurmurHash.initialize();
        hash = MurmurHash.update(hash, Utils.rank(getActionType));
        return MurmurHash.finish(hash, 1);
    }

    /**
     * @uml
     * - @SuppressWarnings("EqualsWhichDoesntCheckParameterClass")
     */
    public bool equals(Object obj)
    {
        return obj == this;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        return "popMode";
    }

    /**
     * Creates the single instance of LexerPopModeAction.
     */
    private shared static this()
    {
        instance_ = new LexerPopModeAction;
    }

    /**
     * Returns: A single instance of LexerPopModeAction.
     */
    public static LexerPopModeAction instance()
    {
        return instance_;
    }

}
