module TestRunner;

import std.array;
import std.format;
import unit_threaded;

int main(string[] args)
{
    mixin("return args.runTests!(" ~ format!"%(%s, %)"(import("modules").split) ~ ");");
}
