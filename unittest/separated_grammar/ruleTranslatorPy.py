from RuleTranslatorPyLexer import RuleTranslatorPyLexer
from RuleTranslatorPyLexer import RuleTranslatorPyParser
from antlr4.CommonTokenStream import CommonTokenStream

import sys
from antlr4.FileStream import * 

def main(fileName):
    fs = FileStream(fileName)
    lexer = RuleTranslatorPyLexer(fs)
    stream = CommonTokenStream(lexer)
    nst:int = stream.getNumberOfOnChannelTokens()
    print("number of tokens:",  nst,  "\n")
    for el in stream.tokens:
        print(el)
    parser = RuleTranslatorPyParser(stream)
    rootContext = parser.file_input()
    pass

if __name__ == '__main__':
    main(sys.argv[1])
