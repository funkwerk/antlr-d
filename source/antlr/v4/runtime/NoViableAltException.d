module antlr.v4.runtime.NoViableAltException;

import antlr.v4.runtime.RecognitionException;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.Parser;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.ParserRuleContext;
import antlr.v4.runtime.atn.ATNConfigSet;

/**
 * TODO add class description
 */
class NoViableAltException : RecognitionException
{

    private ATNConfigSet deadEndConfigs;

    private Token startToken;

    public this(Parser recognizer)
    {
	this(recognizer,
             recognizer.getInputStream(),
             recognizer.getCurrentToken(),
             recognizer.getCurrentToken(),
             null,
             recognizer.ctx_);
    }

    public this(Parser recognizer, TokenStream input, Token startToken, Token offendingToken,
        ATNConfigSet deadEndConfigs, ParserRuleContext ctx)
    {
        super(recognizer, input, ctx);
        this.deadEndConfigs = deadEndConfigs;
        this.startToken = startToken;
        this.setOffendingToken(offendingToken);
    }

    public Token getStartToken()
    {
	return startToken;
    }

    public ATNConfigSet getDeadEndConfigs()
    {
	return deadEndConfigs;
    }

}
