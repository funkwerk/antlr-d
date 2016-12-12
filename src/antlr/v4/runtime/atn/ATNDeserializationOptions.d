/*
 * [The "BSD license"]
 *  Copyright (c) 2013 Terence Parr
 *  Copyright (c) 2013 Sam Harwell
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *  3. The name of the author may not be used to endorse or promote products
 *     derived from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 *  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 *  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

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
        return readOnly;
    }

    public void makeReadOnly()
    {
        readOnly = true;
    }

    public bool isVerifyATN()
    {
        return verifyATN;
    }

    public void setVerifyATN(bool verifyATN)
    {
        throwIfReadOnly();
        this.verifyATN = verifyATN;
    }

    public bool isGenerateRuleBypassTransitions()
    {
        return generateRuleBypassTransitions;
    }

    public void setGenerateRuleBypassTransitions(bool generateRuleBypassTransitions)
    {
        throwIfReadOnly();
        this.generateRuleBypassTransitions = generateRuleBypassTransitions;
    }

    protected void throwIfReadOnly()
    {
        assert(isReadOnly, "The object is read only.");
    }

}

unittest
{
    auto so = new ATNDeserializationOptions();
    assert(!so.isReadOnly);
    assert(so.defaultOptions.isReadOnly);
    assert(so.defaultOptions.verifyATN);
}
