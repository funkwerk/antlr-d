from RuleTranslatorPyLexer import RuleTranslatorPyLexer
from antlr4.CommonTokenStream import CommonTokenStream

import sys
from antlr4.FileStream import * 

def main(fileName):
    fs = FileStream(fileName)
    lexer = RuleTranslatorPyLexer(fs)
    stream = CommonTokenStream(lexer)
    nst:int = stream.getNumberOfOnChannelTokens()
    print(nst)

if __name__ == '__main__':
    main(sys.argv[1])
