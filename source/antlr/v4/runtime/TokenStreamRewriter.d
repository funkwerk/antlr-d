/*
 * Copyright (c) 2012-2019 The ANTLR Project. All rights reserved.
 * Use of this file is governed by the BSD 3-clause license that
 * can be found in the LICENSE.txt file in the project root.
 */

module antlr.v4.runtime.TokenStreamRewriter;

import antlr.v4.runtime.IllegalArgumentException;
import antlr.v4.runtime.InsertAfterOp;
import antlr.v4.runtime.InsertBeforeOp;
import antlr.v4.runtime.RewriteOperation;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenStream;
import std.format;


/**
 * Useful for rewriting out a buffered input token stream after doing some
 * augmentation or other manipulations on it.
 *
 * <p>
 * You can insert stuff, replace, and delete chunks. Note that the operations
 * are done lazily--only if you convert the buffer to a {@link String} with
 * {@link TokenStream#getText()}. This is very efficient because you are not
 * moving data around all the time. As the buffer of tokens is converted to
 * strings, the {@link #getText()} method(s) scan the input token stream and
 * check to see if there is an operation at the current index. If so, the
 * operation is done and then normal {@link String} rendering continues on the
 * buffer. This is like having multiple Turing machine instruction streams
 * (programs) operating on a single input tape. :)</p>
 *
 * <p>
 * This rewriter makes no modifications to the token stream. It does not ask the
 * stream to fill itself up nor does it advance the input cursor. The token
 * stream {@link TokenStream#index()} will return the same value before and
 * after any {@link #getText()} call.</p>
 *
 * <p>
 * The rewriter only works on tokens that you have in the buffer and ignores the
 * current input cursor. If you are buffering tokens on-demand, calling
 * {@link #getText()} halfway through the input will only do rewrites for those
 * tokens in the first half of the file.</p>
 *
 * <p>
 * Since the operations are done lazily at {@link #getText}-time, operations do
 * not screw up the token index values. That is, an insert operation at token
 * index {@code i} does not change the index values for tokens
 * {@code i}+1..n-1.</p>
 *
 * <p>
 * Because operations never actually alter the buffer, you may always get the
 * original token stream back without undoing anything. Since the instructions
 * are queued up, you can easily simulate transactions and roll back any changes
 * if there is an error just by removing instructions. For example,</p>
 *
 * <pre>
 * CharStream input = new ANTLRFileStream("input");
 * TLexer lex = new TLexer(input);
 * CommonTokenStream tokens = new CommonTokenStream(lex);
 * T parser = new T(tokens);
 * TokenStreamRewriter rewriter = new TokenStreamRewriter(tokens);
 * parser.startRule();
 * </pre>
 *
 * <p>
 * Then in the rules, you can execute (assuming rewriter is visible):</p>
 *
 * <pre>
 * Token t,u;
 * ...
 * rewriter.insertAfter(t, "text to put after t");}
 * rewriter.insertAfter(u, "text after u");}
 * System.out.println(rewriter.getText());
 * </pre>
 *
 * <p>
 * You can also have multiple "instruction streams" and get multiple rewrites
 * from a single pass over the input. Just name the instruction streams and use
 * that name again when printing the buffer. This could be useful for generating
 * a C file and also its header file--all from the same buffer:</p>
 *
 * <pre>
 * rewriter.insertAfter("pass1", t, "text to put after t");}
 * rewriter.insertAfter("pass2", u, "text after u");}
 * System.out.println(rewriter.getText("pass1"));
 * System.out.println(rewriter.getText("pass2"));
 * </pre>
 *
 * <p>
 * If you don't use named rewrite streams, a "default" stream is used as the
 * first example shows.</p>
 */
class TokenStreamRewriter
{

    public static immutable string DEFAULT_PROGRAM_NAME = "default";

    public static immutable int PROGRAM_INIT_SIZE = 100;

    public static immutable int MIN_TOKEN_INDEX = 0;

    /**
     * Our source stream
     * @uml
     * @read
     */
    protected TokenStream tokens_;

    protected RewriteOperation[][string] programs;

    /**
     * Map String (program name) &rarr; Integer index
     */
    protected int[string] lastRewriteTokenIndexes;

    private RewriteOperation[] rewriteOps;

    public this(TokenStream tokens)
    {
        tokens_ = tokens;
        programs[DEFAULT_PROGRAM_NAME] = rewriteOps;
    }

    public void rollback(int instructionIndex)
    {
	rollback(DEFAULT_PROGRAM_NAME, instructionIndex);
    }

    /**
     * Rollback the instruction stream for a program so that
     *  the indicated instruction (via instructionIndex) is no
     *  longer in the stream. UNTESTED!
     */
    public void rollback(string programName, int instructionIndex)
    {
        RewriteOperation[] ist = programs[programName];
        if (programName in programs) {
            programs[programName] = programs[programName][MIN_TOKEN_INDEX .. instructionIndex];
        }
    }

    public void deleteProgram()
    {
        deleteProgram(DEFAULT_PROGRAM_NAME);
    }

    /**
     * Reset the program so that no instructions exist
     */
    public void deleteProgram(string programName)
    {
        rollback(programName, MIN_TOKEN_INDEX);
    }

    public void insertAfter(Token t, Object text)
    {
        insertAfter(DEFAULT_PROGRAM_NAME, t, text);
    }

    public void insertAfter(int index, Object text)
    {
        insertAfter(DEFAULT_PROGRAM_NAME, index, text);
    }

    public void insertAfter(string programName, Token t, Object text)
    {
        insertAfter(programName, t.getTokenIndex, text);
    }

    public void insertAfter(string programName, int index, Object text)
    {
        // to insert after, just insert before next index (even if past end)
        RewriteOperation op = new InsertAfterOp(index, text);
        RewriteOperation[] rewrites = getProgram(programName);
        op.instructionIndex = rewrites.length;
        rewrites ~= op;
    }

    public void insertBefore(Token t, Object text)
    {
        insertBefore(DEFAULT_PROGRAM_NAME, t, text);
    }

    public void insertBefore(size_t index, Object text)
    {
	insertBefore(DEFAULT_PROGRAM_NAME, index, text);
    }

    public void insertBefore(string programName, Token t, Object text)
    {
	insertBefore(programName, t.getTokenIndex(), text);
    }

    public void insertBefore(string programName, size_t index, Object text)
    {
        RewriteOperation op = new InsertBeforeOp(index, text);
        RewriteOperation[] rewrites = getProgram(programName);
        op.instructionIndex = rewrites.length;
        rewrites ~= op;
    }

    public void replace(size_t index, Object text)
    {
	replace(DEFAULT_PROGRAM_NAME, index, index, text);
    }

    public void replace(size_t from, size_t to, Object text)
    {
	replace(DEFAULT_PROGRAM_NAME, from, to, text);
    }

    public void replace(Token indexT, Object text)
    {
	replace(DEFAULT_PROGRAM_NAME, indexT, indexT, text);
    }

    public void replace(size_t from, size_t to, Object text)
    {
	replace(DEFAULT_PROGRAM_NAME, from, to, text);
    }

    public void replace(string programName, size_t from, size_t to, Object text)
    {
	if ( from > to || from<0 || to<0 || to >= tokens_.size ) {
            throw
                new
                IllegalArgumentException(
                                         format("replace: range invalid: %s..%s(size=%s)",
                                                from, to, tokens_.size));
        }
        RewriteOperation op = new ReplaceOp(from, to, text);
        RewriteOperation[] rewrites = getProgram(programName);
        op.instructionIndex = rewrites.length;
        rewrites ~= op;
    }

    public void replace(string programName, Token from, Token to, Object text)
    {
	replace(programName,
                from.getTokenIndex,
                to.getTokenIndex,
                text);
    }

    public final TokenStream tokens()
    {
        return this.tokens_;
    }

}
