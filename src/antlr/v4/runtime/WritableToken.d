module antlr.v4.runtime.WritableToken;

import antlr.v4.runtime.Token;

// Interface WritableToken
/**
 * Add write functions for Token attributes
 */
interface WritableToken : Token
{

    public void setText(string text);

    public void setType(int ttype);

    public void setLine(int line);

    public void setCharPositionInLine(int charPositionInLine);

    public void setChannel(int channel);

    public void setTokenIndex(int index);

}
