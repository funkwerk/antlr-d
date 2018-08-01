module RuleWriter;

import std.array;
import std.stdio;

class RuleWriter{

    private string pathName;
    private string fileName;

    public ushort indentLevel;

    struct Result { ushort indent; string s;}

    private Result[] result;

    this() {
    }

    this(string pathName) {
        this.pathName = pathName;
    }

    public void setOutputFilename(string fileName)
    {
        this.fileName = fileName;
    }

    public void setOutputPath(string pathName)
    {
        this.pathName = pathName;
    }

    public void clear() {
        result.length = 0;
    }

    public void put(string s) {
        result ~= set(s);
    }

    public void put(string[] s) {
        foreach (el; s) {
            result ~= set(el);
        }
    }

    public void putnl(string s) {
        s ~= "\n";
        Result r =  set(s);
        result ~= r;
    }

    public Result set(string s) {
        Result r;
        r.indent = indentLevel;
        r.s = s;
        return r;
    }

    public void print() {
        auto r =  appender!string;
        bool lastEndWithNL = true;
        foreach (e; result) {
            if (lastEndWithNL)
                while (e.indent-- > 0) {
                    r.put("    "); //indent 4 spaces per level
                }
            r.put(e.s);
        if (e.s.length != 0 && e.s[$-1] == '\n')
            lastEndWithNL = true;
        else
            lastEndWithNL = false;
        }
        if (pathName) {
            auto f = File(pathName ~ "/" ~ fileName, "w");
            f.write(r.data);
            f.close;
        }
        else {
            write(r.data);
        }
    }
}
