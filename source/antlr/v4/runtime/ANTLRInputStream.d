/*
 * [The "BSD license"]
 *  Copyright (c) 2012 Terence Parr
 *  Copyright (c) 2012 Sam Harwell
 *  Copyright (c) 2012 Egbert Voigt
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

module antlr.v4.runtime.ANTLRInputStream;

import antlr.v4.runtime.CharStream;
import antlr.v4.runtime.IntStream;
import antlr.v4.runtime.IntStreamConstant;
import antlr.v4.runtime.misc.Interval;
import std.algorithm;
import std.conv;
import std.file;
import std.format;
import std.stdio;

/**
 * Vacuum all input from a {@link Reader}/{@link InputStream} and then treat it
 * like a {@code char[]} buffer. Can also pass in a {@link String} or
 * {@code char[]} to use.
 *
 * <p>If you need encoding, pass in stream/reader with correct encoding.</p>
 */
class ANTLRInputStream : CharStream
{

    public static int READ_BUFFER_SIZE = 1024;

    public static int INITIAL_BUFFER_SIZE = 1024;;

    /**
     * @uml
     * The data being scanned
     */
    protected char[] data;

    /**
     * @uml
     * How many characters are actually in the buffer
     */
    protected int n;

    /**
     * @uml
     * 0..n-1 index into string of next char
     */
    protected int p = 0;

    /**
     * @uml
     * What is name or source of this char stream?
     */
    public string name;

    public this()
    {
    }

    /**
     * @uml
     * Copy data in string to a local char array
     */
    public this(string input)
    {
        this.data = input.to!(char []);
        this.n = to!int(input.length);
    }

    /**
     * @uml
     * This is the preferred constructor for strings as no data is copied
     */
    public this(char[] data, int numberOfActualCharsInArray)
    {
        this.data = data;
        this.n = numberOfActualCharsInArray;
    }

    public this(File r)
    {
        load(r, INITIAL_BUFFER_SIZE, READ_BUFFER_SIZE);
    }

    public void load(File r, int size, int readChunkSize)
    {
        debug(ANTLRInput)
            writefln("load %1$s in chunks of %2$s", size, readChunkSize);
        data = to!(char[])(r.name.readText);
        // set the actual size of the data available;
        n = to!int(data.length);
        debug(ANTLRInput)
            writefln("n= $s", n);
    }

    /**
     * @uml
     * Reset the stream so that it's in the same state it was
     * when the object was created *except* the data array is not
     * touched.
     */
    public void reset()
    {
        p = 0;
    }

    /**
     * @uml
     * @override
     */
    public override void consume()
    {
	if (p >= n) {
            assert (LA(1) == IntStreamConstant.EOF, "cannot consume EOF");
        }
        //System.out.println("prev p="+p+", c="+(char)data[p]);
        if (p < n) {
            p++;
            //System.out.println("p moves to "+p+" (c='"+(char)data[p]+"')");
        }
    }

    /**
     * @uml
     * @override
     */
    public override int LA(int i)
    {
        if (i == 0) {
            return 0; // undefined
        }
        if (i < 0) {
            i++; // e.g., translate LA(-1) to use offset i=0; then data[p+0-1]
            if ((p + i - 1) < 0) {
                return IntStreamConstant.EOF; // invalid; no char before first char
            }
        }
        if (( p + i - 1) >= n) {
            debug(ANTLRInput) {
                import std.stdio;
                writefln("char LA(%s)=EOF; p=%s", i, p);
            }
            return IntStreamConstant.EOF;
        }
        debug(ANTLRInput) {
                import std.stdio;
                writefln("LA(%s); p=%s n=%s data.length=%s", i, p, n, data.length);
                writefln("char LA(%s)=%s; p=%s", i, data[p+i-1], p);
            }
        return data[p+i-1];
    }

    public int LT(int i)
    {
        return LA(i);
    }

    /**
     * @uml
     * @override
     */
    public override int index()
    {
        return p;
    }

    /**
     * @uml
     * @override
     */
    public override int size()
    {
        return n;
    }

    /**
     * @uml
     * mark/release do nothing; we have entire buffer
     * @override
     */
    public override int mark()
    {
        return -1;
    }

    /**
     * @uml
     * @override
     */
    public override void release(int marker)
    {
    }

    /**
     * @uml
     * consume() ahead until p==index; can't just set p=index as we must
     * update line and charPositionInLine. If we seek backwards, just set p
     * @override
     */
    public override void seek(int index)
    {
	if (index <= p) {
            p = index; // just jump; don't update stream state (line, ...)
            return;
        }
        // seek forward, consume until p hits index or n (whichever comes first)
        index = min(index, n);
        while (p < index) {
            consume();
        }
    }

    /**
     * @uml
     * @override
     */
    public override string getText(Interval interval)
    {
        int start = interval.a;
        int stop = interval.b;
        if (stop >= n)
            stop = n-1;
        if (start >= n) return "";
        //		System.err.println("data: "+Arrays.toString(data)+", n="+n+
        //						   ", start="+start+
        //						   ", stop="+stop);
        return to!string(data[start..stop+1]);
    }

    /**
     * @uml
     * @override
     */
    public override string getSourceName()
    {
        if (name is null || name.length == 0) {
            return IntStreamConstant.UNKNOWN_SOURCE_NAME;
        }
        return name;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        return to!string(data);
    }

}
