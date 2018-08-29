/*
 * Copyright (c) 2012-2017 The ANTLR Project. All rights reserved.
 * Use of this file is governed by the BSD 3-clause license that
 * can be found in the LICENSE.txt file in the project root.
 */

module antlr.v4.runtime.ConsoleErrorListener;

import std.stdio;
import antlr.v4.runtime.BaseErrorListener;
import antlr.v4.runtime.InterfaceRecognizer;
import antlr.v4.runtime.RecognitionException;


/**
 * TODO add class description
 */
class ConsoleErrorListener(U, V) : BaseErrorListener!(U, V)
{

    /**
     * @uml
     * @override
     */
    public override void syntaxError(InterfaceRecognizer recognizer, Object offendingSymbol, int line,
        int charPositionInLine, string msg, RecognitionException e)
    {
        writefln("line %1$s:%2$s %3$s", line, charPositionInLine, msg);
    }

}
