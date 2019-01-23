module antlr.v4.runtime.RewriteOperation;

import antlr.v4.runtime.TokenStreamRewriter;
import std.conv;
import std.format;

/**
 * TODO add class description
 */
class RewriteOperation : TokenStreamRewriter
{

    /**
     * What index into rewrites List are we?
     */
    public size_t instructionIndex;

    /**
     * Token buffer index.
     */
    public size_t index;

    public Object text;

    public this()
    {
        assert(false, "default construction not allowed!");
    }

    public this(size_t index)
    {
	this.index = index;
    }

    public this(size_t index, Object text)
    {
	this.index = index;
        this.text = text;
    }

    /**
     * Execute the rewrite operation by possibly adding to the buffer.
     *  Return the index of the next token to operate on.
     */
    public size_t execute(ref string buf)
    {
	return index;
    }

    /**
     * @uml
     * @override
     */
    public override string toString()
    {
        string opName = this.classinfo.name;
        //int dollar_index = opName.indexOf('$');
        // opName = opName.substring(dollar_index+1, opName.length());
        return format("<%s@%s:\"%s\">", opName, tokens.get(to!int(index)),
                      text);
    }

}
