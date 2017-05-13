/*
 * [The "BSD license"]
 *  Copyright (c) 2013 Terence Parr
 *  Copyright (c) 2013 Sam Harwell
 *  Copyright (c) 2017 Egbert Voigt
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

// Singleton ATNDeserializationOptions
/**
 * TODO add class description
 */
class ATNDeserializationOptions
{

    private bool readOnly;

    private bool verifyATN;

    private bool generateRuleBypassTransitions;

    /**
     * The single instance of ATNDeserializationOptions.
     */
    private static __gshared ATNDeserializationOptions instance_;

    public static this()
    {
        instance_.verifyATN = true;
        instance_.generateRuleBypassTransitions = false;
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

    private void throwIfReadOnly()
    {
        assert(!isReadOnly, "The object is read only.");
    }

    /**
     * Creates the single instance of ATNDeserializationOptions.
     */
    private shared static this()
    {
        instance_ = new ATNDeserializationOptions;
    }

    /**
     * Returns: A single instance of ATNDeserializationOptions.
     */
    public static ATNDeserializationOptions instance()
    {
        return instance_;
    }

}
