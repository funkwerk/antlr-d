/*
 * [The "BSD license"]
 *  Copyright (c) 2012 Terence Parr
 *  Copyright (c) 2012 Sam Harwell
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

module antlr.v4.runtime.DefaultErrorStrategy;

import antlr.v4.runtime.ANTLRErrorStrategy;
import antlr.v4.runtime.misc.IntervalSet;
import antlr.v4.runtime.Parser;

// Class Template DefaultErrorStrategy
/**
 * @uml
 * This is the default implementation of {@link ANTLRErrorStrategy} used for
 * error reporting and recovery in ANTLR parsers.
 */
class DefaultErrorStrategy(U, V) : ANTLRErrorStrategy!(U,V)
{

    /**
     * @uml
     * Indicates whether the error strategy is currently "recovering from anerror". This is used to suppress reporting multiple error messages whileattempting to recover from a detected syntax error.
     *
     *  @see #inErrorRecoveryMode
     */
    protected bool errorRecoveryMode;

    /**
     * @uml
     * The index into the input stream where the last error occurred.
     * This is used to prevent infinite loops where an error is foundbut no token is consumed during recovery...another error is found,ad nauseum.  This is a failsafe mechanism to guarantee that at leastone token/tree node is consumed for two errors.
     */
    protected int lastErrorIndex = -1;

    public IntervalSet lastErrorStates;

    /**
     * @uml
     * <p>The default implementation simply calls {@link #endErrorCondition} toensure that the handler is not in error recovery mode.</p>
     */
    public void reset(Parser recognizer)
    {
    }

}
