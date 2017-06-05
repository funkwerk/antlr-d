module antlr.v4.runtime.WritableToken;

import antlr.v4.runtime.Token;

// Interface WritableToken
/**
 * TODO add interface description
 */
interface WritableToken :Token
{

    public void setText(string text);

    public void setType(int ttype);

    public void setLine(int line);

    public void setCharPositionInLine();

    public void setChannel(int channel);

    public void setTokenIndex(int index);

}
