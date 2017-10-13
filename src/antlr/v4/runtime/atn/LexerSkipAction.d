module antlr.v4.runtime.atn.LexerSkipAction;

import antlr.v4.runtime.InterfaceLexer;
import antlr.v4.runtime.atn.LexerActionType;
import antlr.v4.runtime.misc.MurmurHash;
import antlr.v4.runtime.misc.Utils;

// Singleton LexerSkipAction
/**
 * TODO add class description
 */
class LexerSkipAction
{

    /**
     * The single instance of LexerSkipAction.
     */
    private static __gshared LexerSkipAction instance_;

    /**
     * @uml
     * {@inheritDoc}
     *  @return This method returns {@link LexerActionType#SKIP}.
     * @safe
     * @nothrow
     */
    public LexerActionType getActionType() @safe nothrow
    {
        return LexerActionType.SKIP;
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
     * <p>This action is implemented by calling {@link Lexer#skip}.</p>
     */
    public void execute(InterfaceLexer lexer)
    {
        lexer.skip();
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
        return "skip";
    }

    /**
     * Creates the single instance of LexerSkipAction.
     */
    private shared static this()
    {
        instance_ = new LexerSkipAction;
    }

    /**
     * Returns: A single instance of LexerSkipAction.
     */
    public static LexerSkipAction instance()
    {
        return instance_;
    }

}
