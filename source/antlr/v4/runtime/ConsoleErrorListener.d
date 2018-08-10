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

// Singleton Template ConsoleErrorListener
/**
 * Default error listener
 */
class ConsoleErrorListener(U, V) : BaseErrorListener!(U, V)
{

    /**
     * The single instance of ConsoleErrorListener.
     */
    private static __gshared ConsoleErrorListener instance_;

    /**
     * @uml
     * @override
     */
    public override void syntaxError(InterfaceRecognizer recognizer, Object offendingSymbol, int line,
        int charPositionInLine, string msg, RecognitionException e)
    {
        writefln("line %1$s:%2$s %3$s", line, charPositionInLine, msg);
    }

    /**
     * Creates the single instance of ConsoleErrorListener.
     */
    private shared static this()
    {
        instance_ = new ConsoleErrorListener;
    }

    /**
     * Returns: A single instance of ConsoleErrorListener.
     */
    public static ConsoleErrorListener instance()
    {
        return instance_;
    }

}
