import std.stdio;
import antlr.v4.runtime.ANTLRInputStream;
import antlr.v4.runtime.CommonTokenStream;
import HelloLexer;
import fluent.asserts;
import unit_threaded;


class Test {

	@Tags("simple")
	@("simpleHelloTest")
	unittest {
		File file = File("unittest/simple/hello.txt", "r");
		auto antlrInput = new ANTLRInputStream(file);
		antlrInput.should.not.beNull;
		auto lexer = new HelloLexer(antlrInput);
		lexer.should.not.beNull;
		lexer.getGrammarFileName.should.equal("Hello.g4");
		lexer.getRuleNames.should.equal(["T__0", "ID", "WS"]);
		auto cts = new CommonTokenStream(lexer);
		cts.should.not.beNull;
		cts.getNumberOfOnChannelTokens.should.equal(5);
		file.close();
	}

}
