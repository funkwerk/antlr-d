module antlr.v4.runtime.WritableToken;

import antlr.v4.runtime.Token;
import std.variant;

/**
 * Add write functions for Token attributes
 */
interface WritableToken : Token
{

    public void setText(Variant text);

    public void setType(int ttype);

    public void setLine(int line);

    public void setCharPositionInLine(int charPositionInLine);

    public void setChannel(int channel);

    public void setTokenIndex(int index);

}
