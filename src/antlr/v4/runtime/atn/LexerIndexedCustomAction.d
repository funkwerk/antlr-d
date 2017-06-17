module antlr.v4.runtime.atn.LexerIndexedCustomAction;

import antlr.v4.runtime.atn.LexerAction;
import antlr.v4.runtime.atn.LexerActionType;
import antlr.v4.runtime.Lexer;
import antlr.v4.runtime.misc.MurmurHash;

// Class LexerIndexedCustomAction
/**
 * TODO add class description
 */
class LexerIndexedCustomAction : LexerAction
{

    private int offset;

    private LexerAction action;

    /**
     * @uml
     * Constructs a new indexed custom action by associating a character offset
     * with a {@link LexerAction}.
     *
     * <p>Note: This class is only required for lexer actions for which
     * {@link LexerAction#isPositionDependent} returns {@code true}.</p>
     *
     *  @param offset The offset into the input {@link CharStream}, relative to
     * the token start index, at which the specified lexer action should be
     * executed.
     *  @param action The lexer action to execute at a particular offset in the
     * input {@link CharStream}.
     */
    public this(int offset, LexerAction action)
    {
	this.offset = offset;
        this.action = action;
    }

    /**
     * @uml
     * Gets the location in the input {@link CharStream} at which the lexer
     * action should be executed. The value is interpreted as an offset relative
     * to the token start index.
     *
     *  @return The location in the input {@link CharStream} at which the lexer
     * action should be executed.
     */
    public int getOffset()
    {
        return offset;
    }

    /**
     * @uml
     * Gets the lexer action to execute.
     *
     *  @return A {@link LexerAction} object which executes the lexer action.
     */
    public LexerAction getAction()
    {
        return action;
    }

    /**
     * @uml
     * {@inheritDoc}
     *
     *  @return This method returns the result of calling {@link #getActionType}
     * on the {@link LexerAction} returned by {@link #getAction}.
     */
    public LexerActionType getActionType()
    {
        return action.getActionType();
    }

    /**
     * @uml
     * {@inheritDoc}
     *  @return This method returns {@code true}.
     */
    public bool isPositionDependent()
    {
	return true;
    }

    /**
     * @uml
     * {@inheritDoc}
     *
     * <p>This method calls {@link #execute} on the result of {@link #getAction}
     * using the provided {@code lexer}.</p>
     */
    public void execute(Lexer lexer)
    {
        // assume the input stream position was properly set by the calling code
        action.execute(lexer);
    }

    /**
     * @uml
     * @nothrow
     */
    public size_t hashCode() nothrow
    {
        size_t hash = MurmurHash.initialize();
        hash = MurmurHash.update(hash, offset);
        hash = MurmurHash.update(hash, action);
        return MurmurHash.finish(hash, 2);
    }

    public bool equals(Object obj)
    {
        if (obj is this) {
            return true;
        }
        else if (obj.classinfo != LexerIndexedCustomAction.classinfo) {
            return false;
        }
        LexerIndexedCustomAction other = cast(LexerIndexedCustomAction)obj;
        return offset == other.getOffset
            && action == other.getAction;
    }

}
