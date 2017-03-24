module antlr.v4.runtime.tree.StartRuleDoesNotConsumeFullPattern;

import antlr.v4.runtime.RuntimeException;

// Class StartRuleDoesNotConsumeFullPattern
/**
 * @uml
 * Fixes https://github.com/antlr/antlr4/issues/413
 * // "Tree pattern compilation doesn't check for a complete parse"
 */
class StartRuleDoesNotConsumeFullPattern : RuntimeException
{

}
