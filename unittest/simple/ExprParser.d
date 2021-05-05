// Generated from Expr.g4 by ANTLR 4.9.2
import antlr.v4.runtime.atn.ATN : ATN;
alias ATNType = ATN;
import antlr.v4.runtime.atn.ATNDeserializer;
import antlr.v4.runtime.atn.PredictionContextCache;
import antlr.v4.runtime.atn.PredictionModeConst;
import antlr.v4.runtime.atn.ParserATNSimulator;
import antlr.v4.runtime.atn.InterfaceParserATNSimulator;
import antlr.v4.runtime.dfa.DFA;
import antlr.v4.runtime.BailErrorStrategy;
import antlr.v4.runtime.RuntimeMetaData;
import antlr.v4.runtime.Parser;
import antlr.v4.runtime.Token;
import antlr.v4.runtime.CommonToken;
import antlr.v4.runtime.TokenConstantDefinition;
import antlr.v4.runtime.ParserRuleContext;
import antlr.v4.runtime.InterfaceRuleContext;
import antlr.v4.runtime.LexerNoViableAltException;
import antlr.v4.runtime.FailedPredicateException;
import antlr.v4.runtime.NoViableAltException;
import antlr.v4.runtime.RecognitionException;
import antlr.v4.runtime.Vocabulary;
import antlr.v4.runtime.VocabularyImpl;
import antlr.v4.runtime.TokenStream;
import antlr.v4.runtime.tree.ParseTreeListener;
import antlr.v4.runtime.tree.ParseTreeVisitor;
import antlr.v4.runtime.tree.TerminalNode;
import antlr.v4.runtime.tree.ParseTreeWalker;
import std.conv : to;
import std.variant : Variant;

public class ExprParser : Parser {
    static this() { RuntimeMetaData.checkVersion("4.9.2", RuntimeMetaData.VERSION); }

    protected static DFA[] _decisionToDFA;
    protected PredictionContextCache _sharedContextCache =
        new PredictionContextCache();
    public enum int
        T__0=1,T__1=2,T__2=3,T__3=4,T__4=5,T__5=6,NEWLINE=7,INT=8;
    public enum int
        RULE_prog = 0,RULE_expr = 1;
    public static const string[] ruleNames = [
        "prog","expr"
    ];

    private static const string[] _LITERAL_NAMES = [
        null,"'/'","'*'","'-'","'+'","'('","')'"
    ];
    private static const string[] _SYMBOLIC_NAMES = [
        null,null,null,null,null,null,null,"NEWLINE","INT"
    ];
    public static Vocabulary VOCABULARY;

    /**
     * @deprecated Use {@link #VOCABULARY} instead.
     */
    public static string[_SYMBOLIC_NAMES.length] tokenNames;

    static this() {
        VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);
        int index = 0;
        foreach (ref tokenName; tokenNames)
            {
                tokenName = VOCABULARY.getLiteralName(index);
                    if (!tokenName) {
                        tokenName = VOCABULARY.getSymbolicName(index);
                }
                if (!tokenName)
                {
                    tokenName = "<INVALID>";
                }
            }
            ++index;
    }

    override public string[] getTokenNames() {
        return tokenNames;
    }

    override public Vocabulary getVocabulary() {
        return VOCABULARY;
    }

    override
    public string getGrammarFileName() { return "Expr.g4"; }

    override
    public string[] getRuleNames() { return ruleNames.dup; }

    override
    public wstring getSerializedATN() { return _serializedATN; }

    override
    public ATNType getATN() { return _ATN; }

    public this(TokenStream input) {
        super(input);
        _interp = new ParserATNSimulator(this,_ATN, _decisionToDFA, _sharedContextCache);
    }

    public static class ProgContext : ParserRuleContext {
        public ExprContext[] expr() {
            return getRuleContexts!ExprContext;
        }
        public ExprContext expr(int i) {
            return getRuleContext!ExprContext(i);
        }
        public TerminalNode[] NEWLINE() { return getTokens(ExprParser.NEWLINE); }
        public TerminalNode NEWLINE(int i) {
            return getToken(ExprParser.NEWLINE, i);
        }
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_prog; }
        override
        public Variant accept(ParseTreeVisitor visitor) {
            import ExprVisitor : ExprVisitor;
            if (cast(ExprVisitor) visitor)
                return (cast(ExprVisitor) visitor).visitProg(this);
            else
                return visitor.visitChildren(this);
        }
    }

    public ProgContext prog() {
        ProgContext _localctx = new ProgContext(ctx_, getState());
        enterRule(_localctx, 0, RULE_prog);
        int _la;
        try {
            enterOuterAlt(_localctx, 1);
            {
            setState(9);
            _errHandler.sync(this);
            _la = _input.LA(1);
            while (_la==T__4 || _la==INT) {
                {
                {
                setState(4);
                expr(0);
                setState(5);
                match(NEWLINE);
                }
                }
                setState(11);
                _errHandler.sync(this);
                _la = _input.LA(1);
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            exitRule();
        }
        return _localctx;
    }

    public static class ExprContext : ParserRuleContext {
        public this(ParserRuleContext parent, int invokingState) {
            super(parent, invokingState);
        }
        override public size_t getRuleIndex() { return RULE_expr; }
     
        public this() { }
            alias copyFrom = ParserRuleContext.copyFrom;
        public void copyFrom(ExprContext ctx) {
            super.copyFrom(ctx);
        }
    }
    public static class DivContext : ExprContext {
        public ExprContext[] expr() {
            return getRuleContexts!ExprContext;
        }
        public ExprContext expr(int i) {
            return getRuleContext!ExprContext(i);
        }
            alias copyFrom = ExprContext.copyFrom;
        public this(ExprContext ctx) { copyFrom(ctx); }
        override
        public Variant accept(ParseTreeVisitor visitor) {
            import ExprVisitor : ExprVisitor;
            if (cast(ExprVisitor) visitor)
                return (cast(ExprVisitor) visitor).visitDiv(this);
            else
                return visitor.visitChildren(this);
        }
    }
    public static class AddContext : ExprContext {
        public ExprContext[] expr() {
            return getRuleContexts!ExprContext;
        }
        public ExprContext expr(int i) {
            return getRuleContext!ExprContext(i);
        }
            alias copyFrom = ExprContext.copyFrom;
        public this(ExprContext ctx) { copyFrom(ctx); }
        override
        public Variant accept(ParseTreeVisitor visitor) {
            import ExprVisitor : ExprVisitor;
            if (cast(ExprVisitor) visitor)
                return (cast(ExprVisitor) visitor).visitAdd(this);
            else
                return visitor.visitChildren(this);
        }
    }
    public static class SubContext : ExprContext {
        public ExprContext[] expr() {
            return getRuleContexts!ExprContext;
        }
        public ExprContext expr(int i) {
            return getRuleContext!ExprContext(i);
        }
            alias copyFrom = ExprContext.copyFrom;
        public this(ExprContext ctx) { copyFrom(ctx); }
        override
        public Variant accept(ParseTreeVisitor visitor) {
            import ExprVisitor : ExprVisitor;
            if (cast(ExprVisitor) visitor)
                return (cast(ExprVisitor) visitor).visitSub(this);
            else
                return visitor.visitChildren(this);
        }
    }
    public static class MulContext : ExprContext {
        public ExprContext[] expr() {
            return getRuleContexts!ExprContext;
        }
        public ExprContext expr(int i) {
            return getRuleContext!ExprContext(i);
        }
            alias copyFrom = ExprContext.copyFrom;
        public this(ExprContext ctx) { copyFrom(ctx); }
        override
        public Variant accept(ParseTreeVisitor visitor) {
            import ExprVisitor : ExprVisitor;
            if (cast(ExprVisitor) visitor)
                return (cast(ExprVisitor) visitor).visitMul(this);
            else
                return visitor.visitChildren(this);
        }
    }
    public static class BracketExprContext : ExprContext {
        public ExprContext expr() {
            return getRuleContext!ExprContext(0);
        }
            alias copyFrom = ExprContext.copyFrom;
        public this(ExprContext ctx) { copyFrom(ctx); }
        override
        public Variant accept(ParseTreeVisitor visitor) {
            import ExprVisitor : ExprVisitor;
            if (cast(ExprVisitor) visitor)
                return (cast(ExprVisitor) visitor).visitBracketExpr(this);
            else
                return visitor.visitChildren(this);
        }
    }
    public static class IntContext : ExprContext {
        public TerminalNode INT() { return getToken(ExprParser.INT, 0); }
            alias copyFrom = ExprContext.copyFrom;
        public this(ExprContext ctx) { copyFrom(ctx); }
        override
        public Variant accept(ParseTreeVisitor visitor) {
            import ExprVisitor : ExprVisitor;
            if (cast(ExprVisitor) visitor)
                return (cast(ExprVisitor) visitor).visitInt(this);
            else
                return visitor.visitChildren(this);
        }
    }

    public ExprContext expr() {
        return expr(0);
    }

    private ExprContext expr(int _p) {
        ParserRuleContext _parentctx = ctx_;
        int _parentState = getState();
        ExprContext _localctx = new ExprContext(ctx_, _parentState);
        ExprContext _prevctx = _localctx;
        int _startState = 2;
        enterRecursionRule(_localctx, 2, RULE_expr, _p);
        try {
            int _alt;
            enterOuterAlt(_localctx, 1);
            {
            setState(18);
            _errHandler.sync(this);
            switch (_input.LA(1)) {
            case INT:
                {
                _localctx = new IntContext(_localctx);
                ctx_ = _localctx;
                _prevctx = _localctx;

                setState(13);
                match(INT);
                }
                break;
            case T__4:
                {
                _localctx = new BracketExprContext(_localctx);
                ctx_ = _localctx;
                _prevctx = _localctx;
                setState(14);
                match(T__4);
                setState(15);
                expr(0);
                setState(16);
                match(T__5);
                }
                break;
            default:
                throw new NoViableAltException(this);
            }
            ctx_.stop = _input.LT(-1);
            setState(34);
            _errHandler.sync(this);
            _alt = getInterpreter.adaptivePredict(_input,3, ctx_);
            while ( _alt!=2 && _alt!=ATNType.INVALID_ALT_NUMBER ) {
                if ( _alt==1 ) {
                    if (_parseListeners) triggerExitRuleEvent();
                    _prevctx = _localctx;
                    {
                    setState(32);
                    _errHandler.sync(this);
                    switch ( getInterpreter.adaptivePredict(_input,2, ctx_) ) {
                    case 1:
                        {
                        _localctx = new DivContext(new ExprContext(_parentctx, _parentState));
                        pushNewRecursionContext(_localctx, _startState, RULE_expr);
                        setState(20);
                        if (!(precpred(ctx_, 6))) throw new FailedPredicateException(this, "precpred(ctx_, 6)");
                        setState(21);
                        match(T__0);
                        setState(22);
                        expr(7);
                        }
                        break;
                    case 2:
                        {
                        _localctx = new MulContext(new ExprContext(_parentctx, _parentState));
                        pushNewRecursionContext(_localctx, _startState, RULE_expr);
                        setState(23);
                        if (!(precpred(ctx_, 5))) throw new FailedPredicateException(this, "precpred(ctx_, 5)");
                        setState(24);
                        match(T__1);
                        setState(25);
                        expr(6);
                        }
                        break;
                    case 3:
                        {
                        _localctx = new SubContext(new ExprContext(_parentctx, _parentState));
                        pushNewRecursionContext(_localctx, _startState, RULE_expr);
                        setState(26);
                        if (!(precpred(ctx_, 4))) throw new FailedPredicateException(this, "precpred(ctx_, 4)");
                        setState(27);
                        match(T__2);
                        setState(28);
                        expr(5);
                        }
                        break;
                    case 4:
                        {
                        _localctx = new AddContext(new ExprContext(_parentctx, _parentState));
                        pushNewRecursionContext(_localctx, _startState, RULE_expr);
                        setState(29);
                        if (!(precpred(ctx_, 3))) throw new FailedPredicateException(this, "precpred(ctx_, 3)");
                        setState(30);
                        match(T__3);
                        setState(31);
                        expr(4);
                        }
                        break;
                            default: {}
                    }
                    } 
                }
                setState(36);
                _errHandler.sync(this);
                _alt = getInterpreter.adaptivePredict(_input,3, ctx_);
            }
            }
        }
        catch (RecognitionException re) {
            _localctx.exception = re;
            _errHandler.reportError(this, re);
            _errHandler.recover(this, re);
        }
        finally {
            unrollRecursionContexts(_parentctx);
        }
        return _localctx;
    }

    override
    public bool sempred(InterfaceRuleContext _localctx, int ruleIndex, int predIndex) {
        switch (ruleIndex) {
        case 1:
            return expr_sempred(cast(ExprContext)_localctx, predIndex);
    default: {}
    }
    return true;
}
    private bool expr_sempred(ExprContext _localctx, int predIndex) {
        switch (predIndex) {
        case 0:
            return precpred(ctx_, 6);
        case 1:
            return precpred(ctx_, 5);
        case 2:
            return precpred(ctx_, 4);
        case 3:
            return precpred(ctx_, 3);
            default: {}
        }
        return true;
    }

    public static immutable wstring _serializedATN =
        "\x03\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\x03\n(\x04"~
    	"\x02\t\x02\x04\x03\t\x03\x03\x02\x03\x02\x03\x02\x07\x02\n\n\x02\f"~
    	"\x02\x0e\x02\r\x0b\x02\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03"~
    	"\x03\x05\x03\x15\n\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03"~
    	"\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x03\x07\x03#\n\x03"~
    	"\f\x03\x0e\x03&\x0b\x03\x03\x03\x02\x03\x04\x04\x02\x04\x02\x02\x02"~
    	"+\x02\x0b\x03\x02\x02\x02\x04\x14\x03\x02\x02\x02\x06\x07\x05\x04\x03"~
    	"\x02\x07\b\x07\t\x02\x02\b\n\x03\x02\x02\x02\t\x06\x03\x02\x02\x02"~
    	"\n\r\x03\x02\x02\x02\x0b\t\x03\x02\x02\x02\x0b\f\x03\x02\x02\x02\f"~
    	"\x03\x03\x02\x02\x02\r\x0b\x03\x02\x02\x02\x0e\x0f\b\x03\x01\x02\x0f"~
    	"\x15\x07\n\x02\x02\x10\x11\x07\x07\x02\x02\x11\x12\x05\x04\x03\x02"~
    	"\x12\x13\x07\b\x02\x02\x13\x15\x03\x02\x02\x02\x14\x0e\x03\x02\x02"~
    	"\x02\x14\x10\x03\x02\x02\x02\x15$\x03\x02\x02\x02\x16\x17\f\b\x02\x02"~
    	"\x17\x18\x07\x03\x02\x02\x18#\x05\x04\x03\t\x19\x1a\f\x07\x02\x02\x1a"~
    	"\x1b\x07\x04\x02\x02\x1b#\x05\x04\x03\b\x1c\x1d\f\x06\x02\x02\x1d\x1e"~
    	"\x07\x05\x02\x02\x1e#\x05\x04\x03\x07\x1f \f\x05\x02\x02 !\x07\x06"~
    	"\x02\x02!#\x05\x04\x03\x06\"\x16\x03\x02\x02\x02\"\x19\x03\x02\x02"~
    	"\x02\"\x1c\x03\x02\x02\x02\"\x1f\x03\x02\x02\x02#&\x03\x02\x02\x02"~
    	"$\"\x03\x02\x02\x02$%\x03\x02\x02\x02%\x05\x03\x02\x02\x02&$\x03\x02"~
    	"\x02\x02\x06\x0b\x14\"$";
    public static ATNType _ATN;

    static this() {
        auto atnDeserializer = new ATNDeserializer;
        _ATN = atnDeserializer.deserialize(_serializedATN);
        _decisionToDFA.length = 0;
        for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
            _decisionToDFA ~= new DFA(_ATN.getDecisionState(i), i);
        }
    }
}