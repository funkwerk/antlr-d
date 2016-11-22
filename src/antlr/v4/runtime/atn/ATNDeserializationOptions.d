module antlr.v4.runtime.atn.ATNDeserializationOptions;

// Class ATNDeserializationOptions
/**
 * TODO add class description
 */
class ATNDeserializationOptions
{

    private static ATNDeserializationOptions defaultOptions;

    private bool readOnly;

    private bool verifyATN;

    private bool generateRuleBypassTransitions;

    public static this()
    {
        defaultOptions = new ATNDeserializationOptions();
        defaultOptions.makeReadOnly();
    }

    public this()
    {
        this.verifyATN = true;
        this.generateRuleBypassTransitions = false;
    }

    public this(ATNDeserializationOptions options)
    {
        this.verifyATN = options.verifyATN;
        this.generateRuleBypassTransitions = options.generateRuleBypassTransitions;
    }

    public static ATNDeserializationOptions getDefaultOptions()
    {
        return defaultOptions;
    }

    public bool isReadOnly()
    {
    }

    public void makeReadOnly()
    {
    }

    public bool isVerifyATN()
    {
    }

    public void setVerifyATN(bool verifyATN)
    {
    }

    public bool isGenerateRuleBypassTransitions()
    {
    }

    public void setGenerateRuleBypassTransitions(bool generateRuleBypassTransitions)
    {
    }

    protected void throwIfReadOnly()
    {
    }

}
