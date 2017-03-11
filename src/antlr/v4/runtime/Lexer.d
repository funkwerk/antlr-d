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

module antlr.v4.runtime.Lexer;

import antlr.v4.runtime.Recognizer;
import antlr.v4.runtime.atn.LexerATNSimulator;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenSource;
import antlr.v4.runtime.CharStream;

// Class Lexer
/**
 * TODO add class description
 */
abstract class Lexer : Recognizer!(int, LexerATNSimulator)
{

    public static immutable int DEFAULT_MODE = 0;

    public static immutable int MORE = -2;

    public static immutable int SKIP = -3;

    public static immutable int DEFAULT_TOKEN_CHANNEL = Token.DEFAULT_CHANNEL;

    public static immutable int HIDDEN = Token.HIDDEN_CHANNEL;

    public static immutable int MIN_CHAR_VALUE = char.min;

    public static immutable int MAX_CHAR_VALUE = char.max;

    public CharStream _input;

    protected CharStream[TokenSource] _tokenFactorySourcePair;

    /**
     * @uml
     * The channel number for the current token
     */
    public int _channel;

    public int _mode;

    /**
     * @uml
     * You can set the text for the current token to override what is in
     * the input char buffer.  Use setText() or can set this instance var.
     */
    public string _text;

    /**
     * @uml
     * The token type for the current token
     */
    public int _type;

    public void setChannel(int channel)
    {
	_channel = channel;
    }

    public int getChannel()
    {
        return _channel;
    }

    /**
     * @uml
     * Instruct the lexer to skip creating a token for current lexer rule
     * and look for another token.  nextToken() knows to keep looking when
     * a lexer rule finishes with token set to SKIP_TOKEN.  Recall that
     * if token==null at end of any token rule, it creates one for you
     * and emits it.
     */
    public void skip()
    {
        _type = SKIP;
    }

    public void more()
    {
        _type = MORE;
    }

    public void mode(int m)
    {
        _mode = m;
    }

}
