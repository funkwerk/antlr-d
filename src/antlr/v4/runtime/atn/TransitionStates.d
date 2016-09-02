module antlr.v4.runtime.atn.TransitionStates;

// Enum TransitionStates
/**
 * TODO add enumeration class description
 * @uml
 * Type: ushort
 */
enum TransitionStates : ushort
{
    INVALID,
    EPSILON,
    RANGE,
    RULE,
    PREDICATE,
    ATOM,
    ACTION,
    SET,
    NOT_SET,
    WILDCARD,
    PRECEDENCE,
}
