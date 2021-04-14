module main;

import calc;
import std.range;
import std.stdio;

void main(string[] args)
{
    args.popFront;

    if (args.empty)
        eval(stdin);
    foreach (arg; args)
        eval(File(arg));
}
