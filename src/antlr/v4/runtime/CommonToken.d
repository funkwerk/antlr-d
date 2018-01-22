/*
 * Copyright (c) 2012-2018 The ANTLR Project. All rights reserved.
 * Use of this file is governed by the BSD 3-clause license that
 * can be found in the LICENSE.txt file in the project root.
 */

module antlr.v4.runtime.CommonToken;

import std.conv;
import std.array;
import std.typecons;
import std.container : DList;
import antlr.v4.runtime.WritableToken;
import antlr.v4.runtime.CharStream;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.TokenConstantDefinition;
import antlr.v4.runtime.TokenSource;
import antlr.v4.runtime.misc.Interval;

alias TokenFactorySourcePair = Tuple!(TokenSource, "a", CharStream, "b");

// Class CommonToken
/**
 * TODO add class description
 */
class CommonToken : WritableToken
{

    /**
     * An empty {@link Pair} which is used as the default value of
     * {@link #source} for tokens that do not have a source.
     */
    protected static TokenFactorySourcePair EMPTY_SOURCE;

    /**
     * This is the backing field for {@link #getType} and {@link #setType}.
     */
    protected int type;

    /**
     * This is the backing field for {@link #getLine} and {@link #setLine}.
     */
    protected int line;

    /**
     * This is the backing field for {@link #getCharPositionInLine} and
     * {@link #setCharPositionInLine}.
     */
    protected int charPositionInLine = -1;

    /**
     * This is the backing field for {@link #getChannel} and
     * {@link #setChannel}.
     */
    protected int channel = TokenConstantDefinition.DEFAULT_CHANNEL;

    /**
     * This is the backing field for {@link #getTokenSource} and
     * {@link #getInputStream}.
     *
     * <p>
     * These properties share a field to reduce the memory footprint of
     * {@link CommonToken}. Tokens created by a {@link CommonTokenFactory} from
     * the same source and input stream share a reference to the same
     * {@link Pair} containing these values.</p>
     */
    protected TokenFactorySourcePair source;

    /**
     * This is the backing field for {@link #getText} when the token text is
     * explicitly set in the constructor or via {@link #setText}.
     *
     *  @see #getText()
     */
    protected string text;

    /**
     * This is the backing field for {@link #getTokenIndex} and
     * {@link #setTokenIndex}.
     */
    protected int index = -1;

    /**
     * This is the backing field for {@link #getStartIndex} and
     * {@link #setStartIndex}.
     */
    protected int start;

    /**
     * This is the backing field for {@link #getStopIndex} and
     * {@link #setStopIndex}.
     */
    protected int stop;

    /**
     * Constructs a new {@link CommonToken} with the specified token type.
     *
     *  @param type The token type.
     */
    public this(int type)
    {
	this.type = type;
        this.source = EMPTY_SOURCE;
    }

    public this(TokenFactorySourcePair source, int type, int channel, int start, int stop)
    {
	this.source = source;
        this.type = type;
        this.channel = channel;
        this.start = start;
        this.stop = stop;
        if (source.a !is null) {
            this.line = source.a.getLine();
            this.charPositionInLine = source.a.getCharPositionInLine();
        }
    }

    /**
     * Constructs a new {@link CommonToken} with the specified token type and
     * text.
     *
     *  @param type The token type.
     *  @param text The text of the token.
     */
    public this(int type, string text)
    {
	this.type = type;
        this.channel = TokenConstantDefinition.DEFAULT_CHANNEL;
        this.text = text;
        this.source = EMPTY_SOURCE;
    }

    /**
     * Constructs a new {@link CommonToken} as a copy of another {@link Token}.
     * 	 *
     * <p>
     * If {@code oldToken} is also a {@link CommonToken} instance, the newly
     * constructed token will share a reference to the {@link #text} field and
     * the {@link Pair} stored in {@link #source}. Otherwise, {@link #text} will
     * be assigned the result of calling {@link #getText}, and {@link #source}
     * will be constructed from the result of {@link Token#getTokenSource} and
     * {@link Token#getInputStream}.</p>
     *
     *  @param oldToken The token to copy.
     */
    public this(Token oldToken)
    {
	type = oldToken.getType();
        line = oldToken.getLine();
        index = oldToken.getTokenIndex();
        charPositionInLine = oldToken.getCharPositionInLine();
        channel = oldToken.getChannel();
        start = oldToken.getStartIndex();
        stop = oldToken.getStopIndex();

        if (oldToken.classinfo == CommonToken.classinfo) {
            text = (cast(CommonToken)oldToken).text;
            source = (cast(CommonToken)oldToken).source;
        }
        else {
            text = oldToken.getText();
            TokenFactorySourcePair sourceNew = tuple(
                                                     oldToken.getTokenSource,
                                                     oldToken.getInputStream);
            source = sourceNew;
        }
    }

    public int getType()
    {
        return type;
    }

    public void setLine(int line)
    {
        this.line = line;
    }

    /**
     * @uml
     * @override
     */
    public override string getText()
    {
	if (text) {
            return text;
        }

        CharStream input = getInputStream();
        if (input is null) return null;
        int n = input.size();
        if ( start<n && stop<n) {
            return input.getText(Interval.of(start,stop));
        }
        else {
            return "<EOF>";
        }
    }

    /**
     * @uml
     * @override
     * Explicitly set the text for this token. If {code text} is not
     * {@code null}, then {@link #getText} will return this value rather than
     * extracting the text from the input.
     *
     *  @param text The explicit text of the token, or {@code null} if the text
     * should be obtained from the input along with the start and stop indexes
     * of the token.
     */
    public override void setText(string text)
    {
        this.text = text;
    }

    /**
     * @uml
     * @override
     */
    public override int getLine()
    {
        return line;
    }

    /**
     * @uml
     * @override
     */
    public override int getCharPositionInLine()
    {
        return charPositionInLine;
    }

    public void setCharPositionInLine(int charPositionInLine)
    {
        this.charPositionInLine = charPositionInLine;
    }

    /**
     * @uml
     * @override
     */
    public override int getChannel()
    {
        return channel;
    }

    /**
     * @uml
     * @override
     */
    public override void setChannel(int channel)
    {
        this.channel = channel;
    }

    /**
     * @uml
     * @override
     */
    public override void setType(int type)
    {
        this.type = type;
    }

    /**
     * @uml
     * @override
     */
    public override int getStartIndex()
    {
        return start;
    }

    public void setStartIndex(int start)
    {
        this.start = start;
    }

    /**
     * @uml
     * @override
     */
    public override int getStopIndex()
    {
        return stop;
    }

    public void setStopIndex(int stop)
    {
        this.stop = stop;
    }

    /**
     * @uml
     * @override
     */
    public override int getTokenIndex()
    {
        return index;
    }

    /**
     * @uml
     * @override
     */
    public override void setTokenIndex(int index)
    {
        this.index = index;
    }

    /**
     * @uml
     * @override
     */
    public override TokenSource getTokenSource()
    {
        return source.a;
    }

    /**
     * @uml
     * @override
     */
    public override CharStream getInputStream()
    {
        return source.b;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        string channelStr = "";
        if (channel > 0) {
            channelStr=",channel=" ~ to!string(channel);
        }
        string txt = getText;
        if (txt) {
            txt = txt.replace("\n","\\n");
            txt = txt.replace("\r","\\r");
            txt = txt.replace("\t","\\t");
        }
        else {
            txt = "<no text>";
        }
        return "[@" ~ to!string(getTokenIndex) ~ "," ~ to!string(start) ~ ":"
            ~ to!string(stop) ~ "='" ~ txt ~ "',<" ~ to!string(type)
            ~ ">" ~ channelStr ~ "," ~ to!string(line) ~ ":"
            ~ to!string(getCharPositionInLine) ~ "]";
    }

}
