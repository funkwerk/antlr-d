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

module antlr.v4.runtime.Lexer;

import std.stdio;
import std.typecons;
import std.array;
import std.conv;
import antlr.v4.runtime.ANTLRErrorListener;
import antlr.v4.runtime.Recognizer;
import antlr.v4.runtime.RecognitionException;
import antlr.v4.runtime.atn.LexerATNSimulator;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenConstants;
import antlr.v4.runtime.TokenSource;
import antlr.v4.runtime.TokenFactory;
import antlr.v4.runtime.CharStream;
import antlr.v4.runtime.IntStream;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.CommonTokenFactory;
import antlr.v4.runtime.IllegalStateException;
import antlr.v4.runtime.LexerNoViableAltException;
import antlr.v4.runtime.misc.IntegerStack;
import antlr.v4.runtime.misc.Interval;

alias TokenFactorySourcePair = Tuple!(TokenSource, "a", CharStream, "b");

// Class Lexer
/**
 * @uml
 * A lexer is recognizer that draws input symbols from a character stream.
 * lexer grammars result in a subclass of this object. A Lexer object
 * uses simplified match() and error recovery mechanisms in the interest
 * of speed.
 */
abstract class Lexer : Recognizer!(int, LexerATNSimulator), TokenSource
{

    public static immutable int DEFAULT_MODE = 0;

    public static immutable int MORE = -2;

    public static immutable int SKIP = -3;

    public static immutable int DEFAULT_TOKEN_CHANNEL = TokenConstants.DEFAULT_CHANNEL;

    public static immutable int HIDDEN = TokenConstants.HIDDEN_CHANNEL;

    public static immutable int MIN_CHAR_VALUE = char.min;

    public static immutable int MAX_CHAR_VALUE = char.max;

    public CharStream _input;

    protected TokenFactorySourcePair _tokenFactorySourcePair;

    /**
     * @uml
     * How to create token objects
     * @read
     * @write
     */
    public TokenFactory!CommonToken tokenFactory_;

    /**
     * @uml
     * The goal of all lexer rules/methods is to create a token object.
     * This is an instance variable as multiple rules may collaborate to
     * create a single token.  nextToken will return this object after
     * matching lexer rule(s).  If you subclass to allow multiple token
     * emissions, then set this to the last token to be matched or
     * something nonnull so that the auto token emit mechanism will not
     * emit another token.
     */
    public Token _token;

    public IntegerStack _modeStack;

    /**
     * @uml
     * What character index in the stream did the current token start at?
     * Needed, for example, to get the text for current token.  Set at
     * the start of nextToken.
     */
    public int _tokenStartCharIndex = -1;

    /**
     * @uml
     * The line on which the first character of the token resides
     */
    public int _tokenStartLine;

    /**
     * @uml
     * The character position of first character within the line
     */
    public int _tokenStartCharPositionInLine;

    public bool _hitEOF;

    /**
     * @uml
     * The channel number for the current token
     */
    public int _channel;

    /**
     * @uml
     * The token type for the current token
     */
    public int _type;

    public int _mode;

    /**
     * @uml
     * You can set the text for the current token to override what is in
     * the input char buffer.  Use setText() or can set this instance var.
     */
    public string _text;

    public this()
    {
    }

    public this(CharStream input)
    {
        tokenFactory_ = CommonTokenFactory.DEFAULT;
        this._input = input;
        this._tokenFactorySourcePair = tuple(this, input);
    }

    public void reset()
    {
	// wack Lexer state variables
        if (_input !is null) {
            _input.seek(0); // rewind the input
        }
        _token = null;
        _type = TokenConstants.INVALID_TYPE;
        _channel = TokenConstants.DEFAULT_CHANNEL;
        _tokenStartCharIndex = -1;
        _tokenStartCharPositionInLine = -1;
        _tokenStartLine = -1;
        _text = null;
        _hitEOF = false;
        _mode = Lexer.DEFAULT_MODE;
        _modeStack.clear();
        getInterpreter().reset();
    }

    /**
     * @uml
     * Return a token from this source; i.e., match a token on the char
     * stream.
     */
    public Token nextToken()
    {
	if (_input is null) {
            throw new IllegalStateException("nextToken requires a non-null input stream.");
        }
        // Mark start location in char stream so unbuffered streams are
        // guaranteed at least have text of current token
        int tokenStartMarker = _input.mark();
        try{
        outer:
            while (true) {
                if (_hitEOF) {
                    emitEOF();
                    return _token;
                }
                _token = null;
                _channel = TokenConstants.DEFAULT_CHANNEL;
                _tokenStartCharIndex = _input.index();
                _tokenStartCharPositionInLine = getInterpreter().getCharPositionInLine();
                _tokenStartLine = getInterpreter().getLine();
                _text = null;
                do {
                    _type = TokenConstants.INVALID_TYPE;
                    //				writeln("nextToken line "+tokenStartLine+" at "+((char)input.LA(1))+
                    //								   " in mode "+mode+
                    //								   " at index "+input.index());
                    int ttype;
                    try {
                        ttype = getInterpreter().match(_input, _mode);
                    }
                    catch (LexerNoViableAltException e) {
                        notifyListeners(e);		// report error
                        recover(e);
                        ttype = SKIP;
                    }
                    if (_input.LA(1) == IntStream.EOF) {
                        _hitEOF = true;
                    }
                    if (_type == TokenConstants.INVALID_TYPE) _type = ttype;
                    if (_type == SKIP) {
                        continue outer;
                    }
                } while (_type == MORE );
                if (_token is null) emit();
                return _token;
            }
        }
        finally {
            // make sure we release marker after match or
            // unbuffered char stream will keep buffering
            _input.release(tokenStartMarker);
        }
        assert(0);
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

    public void pushMode(int m)
    {
        debug writefln("pushMode %s", m);
        _modeStack.push(_mode);
        mode(m);
    }

    public int popMode()
    {
        assert (!_modeStack.isEmpty, "Empty stack");
        debug writefln("popMode back to %s", modeStack.peek());
        mode( _modeStack.pop() );
        return _mode;
    }

    /**
     * @uml
     * Set the char stream and reset the lexer
     * @override
     */
    public override void setInputStream(IntStream input)
    {
        this._input = null;
        this._tokenFactorySourcePair = tuple(this, _input);
        reset();
        this._input = cast(CharStream)input;
        this._tokenFactorySourcePair = tuple(this, _input);
    }

    public string getSourceName()
    {
        return _input.getSourceName();
    }

    /**
     * @uml
     * @override
     */
    public override CharStream getInputStream()
    {
        return _input;
    }

    /**
     * @uml
     * By default does not support multiple emits per nextToken invocation
     * for efficiency reasons.  Subclass and override this method, nextToken,
     * and getToken (to push tokens into a list and pull from that list
     * rather than a single variable as this implementation does).
     */
    public void emit(Token token)
    {
        debug writefln("emit %s", token);
        this._token = token;
    }

    /**
     * @uml
     * The standard method called to automatically emit a token at the
     * outermost lexical rule.  The token object should point into the
     * char buffer start..stop.  If there is a text override in 'text',
     * use that to set the token's text.  Override this method to emit
     * custom Token objects or provide a new factory.
     */
    public Token emit()
    {
        Token t = tokenFactory_.create(_tokenFactorySourcePair, _type, _text, _channel, _tokenStartCharIndex, getCharIndex()-1,
                                       _tokenStartLine, _tokenStartCharPositionInLine);
        emit(t);
        return t;
    }

    public Token emitEOF()
    {
        int cpos = getCharPositionInLine();
        int line = getLine();
        Token eof = tokenFactory_.create(_tokenFactorySourcePair, TokenConstants.EOF, null, TokenConstants.DEFAULT_CHANNEL,
                                         _input.index(), _input.index()-1,
                                         line, cpos);
        emit(eof);
        return eof;
    }

    public int getLine()
    {
        return getInterpreter().getLine();
    }

    public int getCharPositionInLine()
    {
        return getInterpreter().getCharPositionInLine();
    }

    public void setLine(int line)
    {
        getInterpreter().setLine(line);
    }

    public void setCharPositionInLine(int charPositionInLine)
    {
        getInterpreter().setCharPositionInLine(charPositionInLine);
    }

    /**
     * @uml
     * What is the index of the current character of lookahead?
     */
    public int getCharIndex()
    {
        return _input.index();
    }

    /**
     * @uml
     * eturn the text matched so far for the current token or any
     * text override.
     */
    public string getText()
    {
        if (_text !is null) {
            return _text;
        }
        return getInterpreter().getText(_input);
    }

    /**
     * @uml
     * Set the complete text of this token; it wipes any previous
     * changes to the text.
     */
    public void setText(string text)
    {
        this._text = text;
    }

    /**
     * @uml
     * Override if emitting multiple tokens.
     */
    public Token getToken()
    {
        return _token;
    }

    public void setToken(Token token)
    {
        this._token = token;
    }

    public void setType(int ttype)
    {
        _type = ttype;
    }

    public int getType()
    {
        return _type;
    }

    public void setChannel(int channel)
    {
	_channel = channel;
    }

    public int getChannel()
    {
        return _channel;
    }

    public string[] getModeNames()
    {
        return null;
    }

    /**
     * @uml
     * Used to print out token names like ID during debugging and
     * error reporting.  The generated parsers implement a method
     * that overrides this to point to their String[] tokenNames.
     * @override
     */
    public override string[] getTokenNames()
    {
        return null;
    }

    /**
     * @uml
     * Return a list of all Token objects in input char stream.
     * Forces load of all tokens. Does not include EOF token.
     */
    public Token[] getAllTokens()
    {
	Token[] tokens;
        Token t = nextToken();
        while (t.getType() != TokenConstants.EOF) {
            tokens ~= t;
            t = nextToken();
        }
        return tokens;
    }

    public void recover(LexerNoViableAltException e)
    {
	if (_input.LA(1) != IntStream.EOF) {
            // skip a char and try again
            getInterpreter().consume(_input);
        }
    }

    public void notifyListeners(LexerNoViableAltException notifyListeners)
    {
        string text = _input.getText(Interval.of(_tokenStartCharIndex, _input.index()));
        string msg = "token recognition error at: '" ~ getErrorDisplay(text) ~ "'";

        ANTLRErrorListener!(int, LexerATNSimulator) listener = getErrorListenerDispatch();
        listener.syntaxError(this, null, _tokenStartLine, _tokenStartCharPositionInLine, msg, e);
    }

    public string getErrorDisplay(string s)
    {
        auto buf = appender!string;
        foreach (char c; s) {
            buf.put(getErrorDisplay(c));
        }
        return buf.data;
    }

    public string getErrorDisplay(int c)
    {
        string s = to!string(c);
        switch ( c ) {
        case TokenConstants.EOF :
            s = "<EOF>";
            break;
        case '\n' :
            s = "\\n";
            break;
        case '\t' :
            s = "\\t";
            break;
        case '\r' :
            s = "\\r";
            break;
        default: break;
        }
        return s;
    }

    public string getCharErrorDisplay(int c)
    {
        string s = getErrorDisplay(c);
        return "'" ~ s ~ "'";
    }

    /**
     * @uml
     * Lexers can normally match any char in it's vocabulary after matching
     * a token, so do the easy thing and just kill a character and hope
     * it all works out.  You can instead use the rule invocation stack
     * to do sophisticated error recovery if you are in a fragment rule.
     */
    public void recover(RecognitionException!(int, LexerATNSimulator) re)
    {
	//System.out.println("consuming char "+(char)input.LA(1)+" during recovery");
        //re.printStackTrace();
        // TODO: Do we lose character or line position information?
        _input.consume();
    }

    public final TokenFactory!CommonToken tokenFactory()
    {
        return this.tokenFactory_;
    }

    public final void tokenFactory(TokenFactory!CommonToken tokenFactory)
    {
        this.tokenFactory_ = tokenFactory;
    }

}
