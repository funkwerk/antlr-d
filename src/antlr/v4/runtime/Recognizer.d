/*
 * [The "BSD license"]
 *  Copyright (c) 2012 Terence Parr
 *  Copyright (c) 2012 Sam Harwell
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

module antlr.v4.runtime.Recognizer;

import antlr.v4.runtime.ANTLRErrorListener;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.Vocabulary;
import antlr.v4.runtime.VocabularyImpl;
import antlr.v4.runtime.atn.ATN;

// Class Template Recognizer
/**
 * TODO add class description
 */
class Recognizer(U, V)
{

    public static immutable int EOF = -1;

    public int[string][Vocabulary] tokenTypeMapCache;

    public int[string][string[]] ruleIndexMapCache;

    public ANTLRErrorListener[] _listeners;

    protected V _interp;

    private int _stateNumber = -1;

    abstract public ATN getATN();

    /**
     * @uml
     * Used to print out token names like ID during debugging and
     * error reporting.  The generated parsers implement a method
     * that overrides this to point to their String[] tokenNames.
     *
     *  @deprecated Use {@link #getVocabulary()} instead.
     */
    abstract public string[] getTokenNames();

    abstract public string[] getRuleNames();

    /**
     * @uml
     * et the vocabulary used by the recognizer.
     *
     *  @return A {@link Vocabulary} instance providing information about the
     *  vocabulary used by the grammar.
     */
    public Vocabulary getVocabulary()
    {
        return VocabularyImpl.fromTokenNames(getTokenNames());
    }

    /**
     * @uml
     * Get a map from token names to token types.
     * <p>Used for XPath and tree pattern compilation.</p>
     */
    public int[string] getTokenTypeMap()
    {
        Vocabulary vocabulary = getVocabulary();
        int[string] result = tokenTypeMapCache[vocabulary];
        if (result is null) {
            int[string] result1;
            result = result1;
            for (int i = 0; i < getATN.maxTokenType; i++) {
                string literalName = vocabulary.getLiteralName(i);
                if (literalName !is null) {
                    result[literalName] = i;
                }

                string symbolicName = vocabulary.getSymbolicName(i);
                if (symbolicName != null) {
                    result[symbolicName] = i;
                }
            }

            result["EOF"] = Token.EOF;
            result.rehash; // for faster lookups
            tokenTypeMapCache[vocabulary] = result;
        }
        return result;
    }

}
