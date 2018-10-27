module debugMixin;

string DebugEnter() {
    string result = "debug {";
    result ~= "import std.string;";
    result ~= "import std.conv;";
    result ~= "debugInfo.writefln(\"%s %s:\", to!string(counter++), __FUNCTION__.split(\".\")[$-1]);";
    result ~= "debugInfo.writefln(\"\t getText = %s\", ctx.getText);";
    result ~= "}";
    return result;
}

string DebugExit() {
    string result = "debug {";
    result ~= "import std.string;";
    result ~= "import std.conv;";
    result ~= "debugInfo.writefln(\"%s %s:\", to!string(counter++), __FUNCTION__.split(\".\")[$-1]);";
    result ~= "}";
    return result;
}

string DebugPrintValues() {
    return "debug { debugInfo.writefln(\"\tvalues = %s\", values.get(ctx)); }";
}

string DebugPrintIf() {
    return "debug { debugInfo.writefln(\"\tifTest = '%s'\", ifTests.get(ctx)); }";
}

string DebugStack() {
    return "debug { foreach (el; stack.opSlice) debugInfo.writefln(\"\t%s\", el); }";
}
