/*
 * Copyright (c) 2012-2019 The ANTLR Project. All rights reserved.
 * Use of this file is governed by the BSD 3-clause license that
 * can be found in the LICENSE.txt file in the project root.
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
     * The data being scanned
     */
    protected char[] data;

    /**
     * How many characters are actually in the buffer
     */
    protected int n;

    /**
     * 0..n-1 index into string of next char
     */
    protected int p = 0;

    /**
     * What is name or source of this char stream?
     */
    public string name;

    public this()
    {
    }

    /**
     * Copy data in string to a local char array
     */
    public this(string input)
    {
        this.data = input.to!(char []);
        this.n = to!int(input.length);
    }

    /**
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
        name = r.name;
        data = to!(char[])(name.readText);
        // set the actual size of the data available;
        n = to!int(data.length);
        debug(ANTLRInput)
            writefln("n= $s", n);
    }

    /**
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
     * mark/release do nothing; we have entire buffer
     * @uml
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
     * consume() ahead until p==index; can't just set p=index as we must
     * update line and charPositionInLine. If we seek backwards, just set p
     * @uml
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
        if (!name) {
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
