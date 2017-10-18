/*
 * [The "BSD license"]
 *  Copyright (c) 2013 Terence Parr
 *  Copyright (c) 2013 Sam Harwell
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

module antlr.v4.runtime.atn.LexerCustomAction;

import std.traits;
import std.conv;
import antlr.v4.runtime.atn.LexerAction;
import antlr.v4.runtime.atn.LexerActionType;
import antlr.v4.runtime.InterfaceLexer;
import antlr.v4.runtime.misc.MurmurHash;
import antlr.v4.runtime.misc.Utils;

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
     * @safe
     * @nothrow
     */
    public LexerActionType getActionType() @safe nothrow
    {
        return LexerActionType.CUSTOM;
    }

    /**
     * @uml
     * @override
     * Gets whether the lexer action is position-dependent. Position-dependent
     * actions may have different semantics depending on the {@link CharStream}
     * index at the time the action is executed
     * <p>Custom actions are position-dependent since they may represent a
     * user-defined embedded action which makes calls to methods like
     * {@link Lexer#getText}.</p>
     *
     *  @return This method returns {@code true}.
     */
    public override bool isPositionDependent()
    {
        return true;
    }

    /**
     * @uml
     * @override
     * <p>Custom actions are implemented by calling {@link Lexer#action} with the
     * appropriate rule and action indexes.</p>
     */
    public override void execute(InterfaceLexer lexer)
    {
        lexer.action(null, ruleIndex, actionIndex);
    }

    /**
     * @uml
     * @safe
     * @nothrow
     * @override
     */
    public override size_t toHash() @safe nothrow
    {
        size_t hash = MurmurHash.initialize();
        hash = MurmurHash.update(hash, Utils.rank(getActionType));
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
