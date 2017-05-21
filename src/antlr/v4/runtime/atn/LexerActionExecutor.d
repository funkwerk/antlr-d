module antlr.v4.runtime.atn.LexerActionExecutor;

import std.conv;
import antlr.v4.runtime.atn.LexerAction;
import antlr.v4.runtime.misc.MurmurHash;

// Class LexerActionExecutor
/**
 * @uml
 * Represents an executor for a sequence of lexer actions which traversed during
 * the matching operation of a lexer rule (token).
 *
 * <p>The executor tracks position information for position-dependent lexer actions
 * efficiently, ensuring that actions appearing only at the end of the rule do
 * not cause bloating of the {@link DFA} created for the lexer.</p>
 *
 *  @author Sam Harwell
 *  @since 4.2
 */
class LexerActionExecutor
{

    private LexerAction[] lexerActions;

    /**
     * @uml
     * Caches the result of {@link #hashCode} since the hash code is an element
     * of the performance-critical {@link LexerATNConfig#hashCode} operation.
     */
    private int hashCode_;

    /**
     * @uml
     * Constructs an executor for a sequence of {@link LexerAction} actions.
     *  @param lexerActions The lexer actions to execute.
     */
    public this(LexerAction[] lexerActions)
    {
        this.lexerActions = lexerActions;

        int hash = MurmurHash.initialize();
        foreach (LexerAction lexerAction; lexerActions) {
            hash = MurmurHash.update(hash, lexerAction);
        }
        this.hashCode_ = MurmurHash.finish(hash, to!int(lexerActions.length));
    }

    /**
     * @uml
     * @safe
     * @nothrow
     */
    public int hashCode() @safe nothrow
    {
	return this.hashCode_;
    }

}
