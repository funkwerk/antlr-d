module antlr.v4.runtime.DefaultErrorStrategy;

import antlr.v4.runtime.ANTLRErrorStrategy;

// Class DefaultErrorStrategy
/**
 * @uml
 * This is the default implementation of {@link ANTLRErrorStrategy} used for
 * error reporting and recovery in ANTLR parsers.
 */
class DefaultErrorStrategy : ANTLRErrorStrategy
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
