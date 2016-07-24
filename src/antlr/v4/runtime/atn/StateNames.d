module antlr.v4.runtime.atn.StateNames;

// Enum StateNames
/**
 * @uml
 * Type: short
 */
enum StateNames : short
{
    INVALID,
    BASIC,
    RULE_START,
    BLOCK_START,
    PLUS_BLOCK_START,
    STAR_BLOCK_START,
    TOKEN_START,
    RULE_STOP,
    BLOCK_END,
    STAR_LOOP_BACK,
    STAR_LOOP_ENTRY,
    PLUS_LOOP_BACK,
    LOOP_END,
}
