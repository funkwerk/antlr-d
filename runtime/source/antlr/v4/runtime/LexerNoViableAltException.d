/*
 * [The "BSD license"]
 *  Copyright (c) 2012 Terence Parr
 *  Copyright (c) 2012 Sam Harwell
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

module antlr.v4.runtime.LexerNoViableAltException;

import std.format;
import antlr.v4.runtime.RecognitionException;
import antlr.v4.runtime.Lexer;
import antlr.v4.runtime.CharStream;
import antlr.v4.runtime.atn.ATNConfigSet;
import antlr.v4.runtime.atn.LexerATNSimulator;
import antlr.v4.runtime.misc.Utils;
import antlr.v4.runtime.misc.Interval;

// Class LexerNoViableAltException
/**
 * TODO add class description
 */
class LexerNoViableAltException : RecognitionException
{

    /**
     * @uml
     * Matching attempted at what input index?
     */
    private int startIndex;

    /**
     * @uml
     * Which configurations did we try at input.index() that couldn't match input.LA(1)?
     */
    private ATNConfigSet deadEndConfigs;

    public this(Lexer lexer, CharStream input, int startIndex, ATNConfigSet deadEndConfigs)
    {
        super(lexer, input, null);
        this.startIndex = startIndex;
        this.deadEndConfigs = deadEndConfigs;
    }

    public int getStartIndex()
    {
        return startIndex;
    }

    public ATNConfigSet getDeadEndConfigs()
    {
        return deadEndConfigs;
    }

    /**
     * @uml
     * @override
     */
    public override CharStream getInputStream()
    {
        return cast(CharStream)super.getInputStream();
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
	string symbol = "";
        if (startIndex >= 0 && startIndex < getInputStream().size()) {
            symbol = getInputStream().getText(Interval.of(startIndex,startIndex));
            symbol = Utils.escapeWhitespace(symbol, false);
        }

        return format("%s('%s')", "LexerNoViableAltException", symbol);
    }

}
