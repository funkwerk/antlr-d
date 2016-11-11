module antlr.v4.runtime.WritableToken;

import antlr.v4.runtime.Token;

// Class WritableToken
/**
 * TODO add class description
 */
class WritableToken : Token
{

    abstract public void setText(string text);

    abstract public void setType(int ttype);

    abstract public void setLine(int line);

    abstract public void setCharPositionInLine(int pos);

    abstract public void setChannel(int channel);

    abstract public void setTokenIndex(int index);

}
