module RuleWriter;

import std.array;
import std.stdio;

class RuleWriter{

    private string pathName;
    private string fileName;

    public ushort indentLevel;

    struct Result { ushort indent; string text;}

    private Result[] results;

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
        results.length = 0;
    }

    public void put(string s) {
        results ~= set(s);
    }

    public void put(string[] s) {
        foreach (el; s) {
            results ~= set(el);
        }
    }

    public void putnl(string s) {
        s ~= "\n";
        Result r =  set(s);
        results ~= r;
    }

    public void put(Result r) {
        results ~= set(r.text, r.indent);
    }

    public void put(Result[] r) {
        foreach (el; r) {
            results ~= set(el.text, el.indent);
        }
    }

    public void putnl(Result r) {
        Result res =  set(r.text ~ "\n", r.indent);
        results ~= res;
    }

    public Result set(string s) {
        Result r;
        r.indent = this.indentLevel;
        r.text = s;
        return r;
    }

    public Result set(string s, short indent) {
        Result r;
        r.indent = indent;
        r.text = s;
        return r;
    }

    public void print() {
        auto r =  appender!string;
        bool lastEndWithNL = true;
        foreach (e; results) {
            if (lastEndWithNL)
                while (e.indent-- > 0) {
                    r.put("    "); //indent 4 spaces per level
                }
            r.put(e.text);
        if (e.text.length != 0 && e.text[$-1] == '\n')
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
