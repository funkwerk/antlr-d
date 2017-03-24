module antlr.v4.runtime.tree.pattern.ParseTreePatternMatcher;

import antlr.v4.runtime.Parser;
import antlr.v4.runtime.Lexer;
import antlr.v4.runtime.IllegalArgumentException;
import antlr.v4.runtime.ListTokenSource;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.tree.ParseTree;
import antlr.v4.runtime.tree.pattern.ParseTreePattern;
import antlr.v4.runtime.tree.pattern.ParseTreeMatch;

// Class ParseTreePatternMatcher
/**
 * TODO add class description
 * @uml
 * A tree pattern matching mechanism for ANTLR {@link ParseTree}s.
 *
 * <p>Patterns are strings of source input text with special tags representing
 * token or rule references such as:</p>
 *
 * <p>{@code <ID> = <expr>;}</p>
 *
 * <p>Given a pattern start rule such as {@code statement}, this object constructs
 * a {@link ParseTree} with placeholders for the {@code ID} and {@code expr}
 * subtree. Then the {@link #match} routines can compare an actual
 * {@link ParseTree} from a parse with this pattern. Tag {@code <ID>} matches
 * any {@code ID} token and tag {@code <expr>} references the result of the
 * {@code expr} rule (generally an instance of {@code ExprContext}.</p>
 *
 * <p>Pattern {@code x = 0;} is a similar pattern that matches the same pattern
 * except that it requires the identifier to be {@code x} and the expression to
 * be {@code 0}.</p>
 *
 * <p>The {@link #matches} routines return {@code true} or {@code false} based
 * upon a match for the tree rooted at the parameter sent in. The
 * {@link #match} routines return a {@link ParseTreeMatch} object that
 * contains the parse tree, the parse tree pattern, and a map from tag name to
 * matched nodes (more below). A subtree that fails to match, returns with
 * {@link ParseTreeMatch#mismatchedNode} set to the first tree node that did not
 * match.</p>
 *
 * <p>For efficiency, you can compile a tree pattern in string form to a
 * {@link ParseTreePattern} object.</p>
 *
 * <p>See {@code TestParseTreeMatcher} for lots of examples.
 * {@link ParseTreePattern} has two static helper methods:
 * {@link ParseTreePattern#findAll} and {@link ParseTreePattern#match} that
 * are easy to use but not super efficient because they create new
 * {@link ParseTreePatternMatcher} objects each time and have to compile the
 * pattern in string form before using it.</p>
 *
 * <p>The lexer and parser that you pass into the {@link ParseTreePatternMatcher}
 * constructor are used to parse the pattern in string form. The lexer converts
 * the {@code <ID> = <expr>;} into a sequence of four tokens (assuming lexer
 * throws out whitespace or puts it on a hidden channel). Be aware that the
 * input stream is reset for the lexer (but not the parser; a
 * {@link ParserInterpreter} is created to parse the input.). Any user-defined
 * fields you have put into the lexer might get changed when this mechanism asks
 * it to scan the pattern string.</p>
 *
 * <p>Normally a parser does not accept token {@code <expr>} as a valid
 * {@code expr} but, from the parser passed in, we create a special version of
 * the underlying grammar representation (an {@link ATN}) that allows imaginary
 * tokens representing rules ({@code <expr>}) to match entire rules. We call
 * these <em>bypass alternatives</em>.</p>
 *
 * <p>Delimiters are {@code <} and {@code >}, with {@code \} as the escape string
 * by default, but you can set them to whatever you want using
 * {@link #setDelimiters}. You must escape both start and stop strings
 * {@code \<} and {@code \>}.</p>
 */
class ParseTreePatternMatcher
{

    /**
     * @uml
     * This is the backing field for {@link #getLexer()}.
     */
    private Lexer lexer;

    /**
     * @uml
     * This is the backing field for {@link #getParser()}.
     */
    private Parser parser;

    protected string start = "<";

    protected string stop = ">";

    /**
     * @uml
     * e.g., \< and \> must escape BOTH!
     */
    protected string escape = "\\";

    /**
     * @uml
     * Constructs a {@link ParseTreePatternMatcher} or from a {@link Lexer} and
     * {@link Parser} object. The lexer input stream is altered for tokenizing
     * the tree patterns. The parser is used as a convenient mechanism to get
     * the grammar name, plus token, rule names.
     */
    public this(Lexer lexer, Parser parser)
    {
        this.lexer = lexer;
        this.parser = parser;
    }

    /**
     * @uml
     * Set the delimiters used for marking rule and token tags within concrete
     * syntax used by the tree pattern parser.
     *
     *  @param start The start delimiter.
     *  @param stop The stop delimiter.
     *  @param escapeLeft The escape sequence to use for escaping a start or stop delimiter.
     *
     *  @exception IllegalArgumentException if {@code start} is {@code null} or empty.
     *  @exception IllegalArgumentException if {@code stop} is {@code null} or empty.
     */
    public void setDelimiters(string start, string stop, string escapeLeft)
    {
        if (start is null || start.length) {
            throw new IllegalArgumentException("start cannot be null or empty");
        }

        if (stop is null || stop.length) {
            throw new IllegalArgumentException("stop cannot be null or empty");
        }

        this.start = start;
        this.stop = stop;
        this.escape = escapeLeft;
    }

    /**
     * @uml
     * Does {@code pattern} matched as rule {@code patternRuleIndex} match {@code tree}?
     */
    public bool matches(ParseTree tree, string pattern, int patternRuleIndex)
    {
        ParseTreePattern p = compile(pattern, patternRuleIndex);
        return matches(tree, p);
    }

    /**
     * @uml
     * Does {@code pattern} matched as rule patternRuleIndex match tree? Pass in a
     * compiled pattern instead of a string representation of a tree pattern.
     */
    public bool matches(ParseTree tree, ParseTreePattern pattern)
    {
        ParseTree[][string] labels;
        ParseTree mismatchedNode = matchImpl(tree, pattern.getPatternTree(), labels);
        return mismatchedNode is null;
    }

    /**
     * @uml
     * Compare {@code pattern} matched as rule {@code patternRuleIndex} against
     * {@code tree} and return a {@link ParseTreeMatch} object that contains the
     * matched elements, or the node at which the match failed.
     */
    public ParseTreeMatch match(ParseTree tree, string pattern, int patternRuleIndex)
    {
        ParseTreePattern p = compile(pattern, patternRuleIndex);
        return match(tree, p);
    }

    /**
     * @uml
     * Compare {@code pattern} matched against {@code tree} and return a
     * {@link ParseTreeMatch} object that contains the matched elements, or thenode at which the match failed. Pass in a compiled pattern instead of a
     * string representation of a tree pattern.
     */
    public ParseTreeMatch match(ParseTree tree, ParseTreePattern pattern)
    {
        ParseTree[][string] labels;
        ParseTree mismatchedNode = matchImpl(tree, pattern.getPatternTree(), labels);
        return new ParseTreeMatch(tree, pattern, labels, mismatchedNode);
    }

    /**
     * @uml
     * For repeated use of a tree pattern, compile it to a
     * {@link ParseTreePattern} using this method.
     */
    public ParseTreePattern compile(string pattern, int patternRuleIndex)
    {
	auto tokenList = tokenize(pattern);
        ListTokenSource tokenSrc = new ListTokenSource(tokenList);
        CommonTokenStream tokens = new CommonTokenStream(tokenSrc);

        ParserInterpreter parserInterp = new ParserInterpreter(parser.getGrammarFileName(),
                                                               parser.getVocabulary(),
                                                               Arrays.asList(parser.getRuleNames()),
                                                               parser.getATNWithBypassAlts(),
                                                               tokens);

        ParseTree tree = null;
        try {
            parserInterp.setErrorHandler(new BailErrorStrategy());
            tree = parserInterp.parse(patternRuleIndex);
            //			System.out.println("pattern tree = "+tree.toStringTree(parserInterp));
        }
        catch (ParseCancellationException e) {
            throw cast(RecognitionException)e.getCause();
        }
        catch (RecognitionException re) {
            throw re;
        }
        catch (Exception e) {
            throw new CannotInvokeStartRule(e);
        }

        // Make sure tree pattern compilation checks for a complete parse
        if ( tokens.LA(1)!=Token.EOF ) {
            throw new StartRuleDoesNotConsumeFullPattern();
        }
        return new ParseTreePattern(this, pattern, patternRuleIndex, tree);
    }

}
