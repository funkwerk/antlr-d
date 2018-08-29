/*
 * [The "BSD license"]
 *  Copyright (c) 2013 Terence Parr
 *  Copyright (c) 2013 Sam Harwell
 *  Copyright (c) 2017 Egbert Voigt
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *  3. The name of the author may not be used to endorse or promote products
 *     derived from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 *  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 *  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

module antlr.v4.runtime.atn.LexerIndexedCustomAction;

import antlr.v4.runtime.atn.LexerAction;
import antlr.v4.runtime.atn.LexerActionType;
import antlr.v4.runtime.InterfaceLexer;
import antlr.v4.runtime.misc.MurmurHash;


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
    public void execute(InterfaceLexer lexer)
    {
        // assume the input stream position was properly set by the calling code
        action.execute(lexer);
    }

    /**
     * @uml
     * @nothrow
     * @trusted
     * @override
     */
    public override size_t toHash() @trusted nothrow
    {
        size_t hash = MurmurHash.initialize();
        hash = MurmurHash.update(hash, offset);
        hash = MurmurHash.update!LexerAction(hash, action);
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
