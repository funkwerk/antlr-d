# Generated from RuleLexerPy.g4 by ANTLR 4.7.2
from antlr4 import *
from io import StringIO
from typing.io import TextIO
import sys


from antlr4.Token import CommonToken
from antlr4.RuleContext import RuleContext
from antlr4.Token import Token
from RuleParserPy import RuleParserPy



def serializedATN():
    with StringIO() as buf:
        buf.write("\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2J")
        buf.write("\u02cf\b\1\b\1\4\2\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6")
        buf.write("\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t\13\4\f\t\f\4\r")
        buf.write("\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22")
        buf.write("\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30")
        buf.write("\t\30\4\31\t\31\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35")
        buf.write("\4\36\t\36\4\37\t\37\4 \t \4!\t!\4\"\t\"\4#\t#\4$\t$\4")
        buf.write("%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t+\4,\t,\4-\t")
        buf.write("-\4.\t.\4/\t/\4\60\t\60\4\61\t\61\4\62\t\62\4\63\t\63")
        buf.write("\4\64\t\64\4\65\t\65\4\66\t\66\4\67\t\67\48\t8\49\t9\4")
        buf.write(":\t:\4;\t;\4<\t<\4=\t=\4>\t>\4?\t?\4@\t@\4A\tA\4B\tB\4")
        buf.write("C\tC\4D\tD\4E\tE\4F\tF\4G\tG\4H\tH\4I\tI\4J\tJ\4K\tK\4")
        buf.write("L\tL\4M\tM\4N\tN\4O\tO\4P\tP\4Q\tQ\4R\tR\4S\tS\4T\tT\4")
        buf.write("U\tU\4V\tV\4W\tW\4X\tX\4Y\tY\4Z\tZ\4[\t[\4\\\t\\\4]\t")
        buf.write("]\4^\t^\4_\t_\4`\t`\4a\ta\4b\tb\4c\tc\4d\td\4e\te\4f\t")
        buf.write("f\3\2\3\2\5\2\u00d1\n\2\3\3\3\3\3\4\3\4\5\4\u00d7\n\4")
        buf.write("\3\5\3\5\3\5\3\5\3\5\3\5\3\6\3\6\3\6\3\6\3\6\3\7\3\7\3")
        buf.write("\7\3\7\3\7\3\b\3\b\3\b\3\b\3\b\3\t\3\t\3\t\3\t\3\n\3\n")
        buf.write("\3\n\3\n\3\n\3\n\3\n\3\13\3\13\3\13\3\f\3\f\3\f\3\r\3")
        buf.write("\r\3\r\3\16\3\16\3\16\3\16\3\16\3\17\3\17\3\17\3\17\3")
        buf.write("\17\3\20\3\20\3\20\3\20\3\20\3\20\3\21\3\21\3\21\3\21")
        buf.write("\3\22\3\22\3\22\3\23\3\23\3\23\3\23\3\24\3\24\3\24\3\24")
        buf.write("\3\25\3\25\3\25\3\25\3\25\3\26\3\26\3\26\3\26\3\26\3\26")
        buf.write("\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\30\3\30")
        buf.write("\3\30\3\30\3\30\3\30\3\31\3\31\3\31\3\31\3\31\3\31\3\32")
        buf.write("\3\32\3\32\5\32\u0144\n\32\3\32\3\32\5\32\u0148\n\32\3")
        buf.write("\32\5\32\u014b\n\32\5\32\u014d\n\32\3\32\3\32\3\33\3\33")
        buf.write("\7\33\u0153\n\33\f\33\16\33\u0156\13\33\3\34\3\34\3\34")
        buf.write("\3\34\3\34\5\34\u015d\n\34\3\34\3\34\5\34\u0161\n\34\3")
        buf.write("\35\3\35\3\35\3\35\3\35\5\35\u0168\n\35\3\35\3\35\5\35")
        buf.write("\u016c\n\35\3\36\3\36\7\36\u0170\n\36\f\36\16\36\u0173")
        buf.write("\13\36\3\36\6\36\u0176\n\36\r\36\16\36\u0177\5\36\u017a")
        buf.write("\n\36\3\37\3\37\3\37\6\37\u017f\n\37\r\37\16\37\u0180")
        buf.write("\3 \3 \3!\3!\3\"\3\"\3\"\3#\3#\3#\3$\3$\3%\3%\3&\3&\3")
        buf.write("\'\3\'\3\'\3(\3(\3)\3)\3)\3*\3*\3*\3+\3+\3,\3,\3-\3-\3")
        buf.write(".\3.\3.\3/\3/\3/\3\60\3\60\3\61\3\61\3\62\3\62\3\63\3")
        buf.write("\63\3\64\3\64\3\65\3\65\3\65\3\66\3\66\3\66\3\67\3\67")
        buf.write("\38\38\39\39\39\3:\3:\3:\3;\3;\3;\3<\3<\3<\3=\3=\3=\3")
        buf.write(">\3>\3>\3?\3?\3?\3@\3@\3@\5@\u01d6\n@\3@\3@\3A\3A\3B\3")
        buf.write("B\3B\7B\u01df\nB\fB\16B\u01e2\13B\3B\3B\3B\3B\7B\u01e8")
        buf.write("\nB\fB\16B\u01eb\13B\3B\5B\u01ee\nB\3C\3C\3C\3C\3C\7C")
        buf.write("\u01f5\nC\fC\16C\u01f8\13C\3C\3C\3C\3C\3C\3C\3C\3C\7C")
        buf.write("\u0202\nC\fC\16C\u0205\13C\3C\3C\3C\5C\u020a\nC\3D\3D")
        buf.write("\5D\u020e\nD\3E\3E\3F\3F\3F\3F\5F\u0216\nF\3G\3G\3H\3")
        buf.write("H\3I\3I\3J\3J\3K\3K\3L\5L\u0223\nL\3L\3L\3L\3L\5L\u0229")
        buf.write("\nL\3M\6M\u022c\nM\rM\16M\u022d\3N\3N\6N\u0232\nN\rN\16")
        buf.write("N\u0233\3O\3O\3O\7O\u0239\nO\fO\16O\u023c\13O\3O\3O\3")
        buf.write("O\3O\7O\u0242\nO\fO\16O\u0245\13O\3O\5O\u0248\nO\3P\3")
        buf.write("P\3P\3P\3P\7P\u024f\nP\fP\16P\u0252\13P\3P\3P\3P\3P\3")
        buf.write("P\3P\3P\3P\7P\u025c\nP\fP\16P\u025f\13P\3P\3P\3P\5P\u0264")
        buf.write("\nP\3Q\3Q\5Q\u0268\nQ\3R\5R\u026b\nR\3S\5S\u026e\nS\3")
        buf.write("T\5T\u0271\nT\3U\3U\3U\3V\6V\u0277\nV\rV\16V\u0278\3W")
        buf.write("\3W\7W\u027d\nW\fW\16W\u0280\13W\3X\3X\5X\u0284\nX\3X")
        buf.write("\5X\u0287\nX\3X\3X\5X\u028b\nX\3Y\5Y\u028e\nY\3Z\3Z\5")
        buf.write("Z\u0292\nZ\3[\3[\3[\3[\3[\3\\\3\\\3\\\3\\\3]\3]\3]\3]")
        buf.write("\3]\3^\3^\3_\3_\3`\3`\7`\u02a8\n`\f`\16`\u02ab\13`\3`")
        buf.write("\3`\3`\7`\u02b0\n`\f`\16`\u02b3\13`\3`\5`\u02b6\n`\3a")
        buf.write("\3a\7a\u02ba\na\fa\16a\u02bd\13a\3b\3b\3b\3b\3c\3c\3d")
        buf.write("\3d\3e\3e\3e\3e\5e\u02cb\ne\3f\5f\u02ce\nf\6\u01f6\u0203")
        buf.write("\u0250\u025d\2g\4\3\6\4\b\5\n\6\f\7\16\b\20\t\22\n\24")
        buf.write("\13\26\f\30\r\32\16\34\17\36\20 \21\"\22$\23&\24(\25*")
        buf.write("\26,\27.\30\60\31\62\32\64\33\66\348\35:\36<\37> @!B\"")
        buf.write("D#F$H%J&L\'N(P)R*T+V,X-Z.\\/^\60`\61b\62d\63f\64h\65j")
        buf.write("\66l\67n8p9r:t;v<x=z>|?~@\u0080A\u0082B\u0084\2\u0086")
        buf.write("\2\u0088\2\u008a\2\u008c\2\u008e\2\u0090\2\u0092\2\u0094")
        buf.write("\2\u0096\2\u0098\2\u009a\2\u009c\2\u009e\2\u00a0\2\u00a2")
        buf.write("\2\u00a4\2\u00a6\2\u00a8\2\u00aa\2\u00ac\2\u00ae\2\u00b0")
        buf.write("\2\u00b2\2\u00b4\2\u00b6C\u00b8D\u00baE\u00bcF\u00beG")
        buf.write("\u00c0H\u00c2I\u00c4J\u00c6\2\u00c8\2\u00ca\2\u00cc\2")
        buf.write("\4\2\3\35\b\2HHTTWWhhttww\4\2HHhh\4\2TTtt\4\2DDdd\4\2")
        buf.write("ZZzz\6\2\f\f\16\17))^^\6\2\f\f\16\17$$^^\3\2^^\3\2\63")
        buf.write(";\3\2\62;\3\2\629\5\2\62;CHch\3\2\62\63\7\2\2\13\r\16")
        buf.write("\20(*]_\u0081\7\2\2\13\r\16\20#%]_\u0081\4\2\2]_\u0081")
        buf.write("\3\2\2\u0081\4\2\13\13\"\"\4\2\f\f\16\17\u0129\2C\\aa")
        buf.write("c|\u00ac\u00ac\u00b7\u00b7\u00bc\u00bc\u00c2\u00d8\u00da")
        buf.write("\u00f8\u00fa\u0243\u0252\u02c3\u02c8\u02d3\u02e2\u02e6")
        buf.write("\u02f0\u02f0\u037c\u037c\u0388\u0388\u038a\u038c\u038e")
        buf.write("\u038e\u0390\u03a3\u03a5\u03d0\u03d2\u03f7\u03f9\u0483")
        buf.write("\u048c\u04d0\u04d2\u04fb\u0502\u0511\u0533\u0558\u055b")
        buf.write("\u055b\u0563\u0589\u05d2\u05ec\u05f2\u05f4\u0623\u063c")
        buf.write("\u0642\u064c\u0670\u0671\u0673\u06d5\u06d7\u06d7\u06e7")
        buf.write("\u06e8\u06f0\u06f1\u06fc\u06fe\u0701\u0701\u0712\u0712")
        buf.write("\u0714\u0731\u074f\u076f\u0782\u07a7\u07b3\u07b3\u0906")
        buf.write("\u093b\u093f\u093f\u0952\u0952\u095a\u0963\u097f\u097f")
        buf.write("\u0987\u098e\u0991\u0992\u0995\u09aa\u09ac\u09b2\u09b4")
        buf.write("\u09b4\u09b8\u09bb\u09bf\u09bf\u09d0\u09d0\u09de\u09df")
        buf.write("\u09e1\u09e3\u09f2\u09f3\u0a07\u0a0c\u0a11\u0a12\u0a15")
        buf.write("\u0a2a\u0a2c\u0a32\u0a34\u0a35\u0a37\u0a38\u0a3a\u0a3b")
        buf.write("\u0a5b\u0a5e\u0a60\u0a60\u0a74\u0a76\u0a87\u0a8f\u0a91")
        buf.write("\u0a93\u0a95\u0aaa\u0aac\u0ab2\u0ab4\u0ab5\u0ab7\u0abb")
        buf.write("\u0abf\u0abf\u0ad2\u0ad2\u0ae2\u0ae3\u0b07\u0b0e\u0b11")
        buf.write("\u0b12\u0b15\u0b2a\u0b2c\u0b32\u0b34\u0b35\u0b37\u0b3b")
        buf.write("\u0b3f\u0b3f\u0b5e\u0b5f\u0b61\u0b63\u0b73\u0b73\u0b85")
        buf.write("\u0b85\u0b87\u0b8c\u0b90\u0b92\u0b94\u0b97\u0b9b\u0b9c")
        buf.write("\u0b9e\u0b9e\u0ba0\u0ba1\u0ba5\u0ba6\u0baa\u0bac\u0bb0")
        buf.write("\u0bbb\u0c07\u0c0e\u0c10\u0c12\u0c14\u0c2a\u0c2c\u0c35")
        buf.write("\u0c37\u0c3b\u0c62\u0c63\u0c87\u0c8e\u0c90\u0c92\u0c94")
        buf.write("\u0caa\u0cac\u0cb5\u0cb7\u0cbb\u0cbf\u0cbf\u0ce0\u0ce0")
        buf.write("\u0ce2\u0ce3\u0d07\u0d0e\u0d10\u0d12\u0d14\u0d2a\u0d2c")
        buf.write("\u0d3b\u0d62\u0d63\u0d87\u0d98\u0d9c\u0db3\u0db5\u0dbd")
        buf.write("\u0dbf\u0dbf\u0dc2\u0dc8\u0e03\u0e32\u0e34\u0e35\u0e42")
        buf.write("\u0e48\u0e83\u0e84\u0e86\u0e86\u0e89\u0e8a\u0e8c\u0e8c")
        buf.write("\u0e8f\u0e8f\u0e96\u0e99\u0e9b\u0ea1\u0ea3\u0ea5\u0ea7")
        buf.write("\u0ea7\u0ea9\u0ea9\u0eac\u0ead\u0eaf\u0eb2\u0eb4\u0eb5")
        buf.write("\u0ebf\u0ebf\u0ec2\u0ec6\u0ec8\u0ec8\u0ede\u0edf\u0f02")
        buf.write("\u0f02\u0f42\u0f49\u0f4b\u0f6c\u0f8a\u0f8d\u1002\u1023")
        buf.write("\u1025\u1029\u102b\u102c\u1052\u1057\u10a2\u10c7\u10d2")
        buf.write("\u10fc\u10fe\u10fe\u1102\u115b\u1161\u11a4\u11aa\u11fb")
        buf.write("\u1202\u124a\u124c\u124f\u1252\u1258\u125a\u125a\u125c")
        buf.write("\u125f\u1262\u128a\u128c\u128f\u1292\u12b2\u12b4\u12b7")
        buf.write("\u12ba\u12c0\u12c2\u12c2\u12c4\u12c7\u12ca\u12d8\u12da")
        buf.write("\u1312\u1314\u1317\u131a\u135c\u1382\u1391\u13a2\u13f6")
        buf.write("\u1403\u166e\u1671\u1678\u1683\u169c\u16a2\u16ec\u16f0")
        buf.write("\u16f2\u1702\u170e\u1710\u1713\u1722\u1733\u1742\u1753")
        buf.write("\u1762\u176e\u1770\u1772\u1782\u17b5\u17d9\u17d9\u17de")
        buf.write("\u17de\u1822\u1879\u1882\u18aa\u1902\u191e\u1952\u196f")
        buf.write("\u1972\u1976\u1982\u19ab\u19c3\u19c9\u1a02\u1a18\u1d02")
        buf.write("\u1dc1\u1e02\u1e9d\u1ea2\u1efb\u1f02\u1f17\u1f1a\u1f1f")
        buf.write("\u1f22\u1f47\u1f4a\u1f4f\u1f52\u1f59\u1f5b\u1f5b\u1f5d")
        buf.write("\u1f5d\u1f5f\u1f5f\u1f61\u1f7f\u1f82\u1fb6\u1fb8\u1fbe")
        buf.write("\u1fc0\u1fc0\u1fc4\u1fc6\u1fc8\u1fce\u1fd2\u1fd5\u1fd8")
        buf.write("\u1fdd\u1fe2\u1fee\u1ff4\u1ff6\u1ff8\u1ffe\u2073\u2073")
        buf.write("\u2081\u2081\u2092\u2096\u2104\u2104\u2109\u2109\u210c")
        buf.write("\u2115\u2117\u2117\u211a\u211f\u2126\u2126\u2128\u2128")
        buf.write("\u212a\u212a\u212c\u2133\u2135\u213b\u213e\u2141\u2147")
        buf.write("\u214b\u2162\u2185\u2c02\u2c30\u2c32\u2c60\u2c82\u2ce6")
        buf.write("\u2d02\u2d27\u2d32\u2d67\u2d71\u2d71\u2d82\u2d98\u2da2")
        buf.write("\u2da8\u2daa\u2db0\u2db2\u2db8\u2dba\u2dc0\u2dc2\u2dc8")
        buf.write("\u2dca\u2dd0\u2dd2\u2dd8\u2dda\u2de0\u3007\u3009\u3023")
        buf.write("\u302b\u3033\u3037\u303a\u303e\u3043\u3098\u309d\u30a1")
        buf.write("\u30a3\u30fc\u30fe\u3101\u3107\u312e\u3133\u3190\u31a2")
        buf.write("\u31b9\u31f2\u3201\u3402\u4db7\u4e02\u9fbd\ua002\ua48e")
        buf.write("\ua802\ua803\ua805\ua807\ua809\ua80c\ua80e\ua824\uac02")
        buf.write("\ud7a5\uf902\ufa2f\ufa32\ufa6c\ufa72\ufadb\ufb02\ufb08")
        buf.write("\ufb15\ufb19\ufb1f\ufb1f\ufb21\ufb2a\ufb2c\ufb38\ufb3a")
        buf.write("\ufb3e\ufb40\ufb40\ufb42\ufb43\ufb45\ufb46\ufb48\ufbb3")
        buf.write("\ufbd5\ufd3f\ufd52\ufd91\ufd94\ufdc9\ufdf2\ufdfd\ufe72")
        buf.write("\ufe76\ufe78\ufefe\uff23\uff3c\uff43\uff5c\uff68\uffc0")
        buf.write("\uffc4\uffc9\uffcc\uffd1\uffd4\uffd9\uffdc\uffde\u0096")
        buf.write("\2\62;\u0302\u0371\u0485\u0488\u0593\u05bb\u05bd\u05bf")
        buf.write("\u05c1\u05c1\u05c3\u05c4\u05c6\u05c7\u05c9\u05c9\u0612")
        buf.write("\u0617\u064d\u0660\u0662\u066b\u0672\u0672\u06d8\u06de")
        buf.write("\u06e1\u06e6\u06e9\u06ea\u06ec\u06ef\u06f2\u06fb\u0713")
        buf.write("\u0713\u0732\u074c\u07a8\u07b2\u0903\u0905\u093e\u093e")
        buf.write("\u0940\u094f\u0953\u0956\u0964\u0965\u0968\u0971\u0983")
        buf.write("\u0985\u09be\u09be\u09c0\u09c6\u09c9\u09ca\u09cd\u09cf")
        buf.write("\u09d9\u09d9\u09e4\u09e5\u09e8\u09f1\u0a03\u0a05\u0a3e")
        buf.write("\u0a3e\u0a40\u0a44\u0a49\u0a4a\u0a4d\u0a4f\u0a68\u0a73")
        buf.write("\u0a83\u0a85\u0abe\u0abe\u0ac0\u0ac7\u0ac9\u0acb\u0acd")
        buf.write("\u0acf\u0ae4\u0ae5\u0ae8\u0af1\u0b03\u0b05\u0b3e\u0b3e")
        buf.write("\u0b40\u0b45\u0b49\u0b4a\u0b4d\u0b4f\u0b58\u0b59\u0b68")
        buf.write("\u0b71\u0b84\u0b84\u0bc0\u0bc4\u0bc8\u0bca\u0bcc\u0bcf")
        buf.write("\u0bd9\u0bd9\u0be8\u0bf1\u0c03\u0c05\u0c40\u0c46\u0c48")
        buf.write("\u0c4a\u0c4c\u0c4f\u0c57\u0c58\u0c68\u0c71\u0c84\u0c85")
        buf.write("\u0cbe\u0cbe\u0cc0\u0cc6\u0cc8\u0cca\u0ccc\u0ccf\u0cd7")
        buf.write("\u0cd8\u0ce8\u0cf1\u0d04\u0d05\u0d40\u0d45\u0d48\u0d4a")
        buf.write("\u0d4c\u0d4f\u0d59\u0d59\u0d68\u0d71\u0d84\u0d85\u0dcc")
        buf.write("\u0dcc\u0dd1\u0dd6\u0dd8\u0dd8\u0dda\u0de1\u0df4\u0df5")
        buf.write("\u0e33\u0e33\u0e36\u0e3c\u0e49\u0e50\u0e52\u0e5b\u0eb3")
        buf.write("\u0eb3\u0eb6\u0ebb\u0ebd\u0ebe\u0eca\u0ecf\u0ed2\u0edb")
        buf.write("\u0f1a\u0f1b\u0f22\u0f2b\u0f37\u0f37\u0f39\u0f39\u0f3b")
        buf.write("\u0f3b\u0f40\u0f41\u0f73\u0f86\u0f88\u0f89\u0f92\u0f99")
        buf.write("\u0f9b\u0fbe\u0fc8\u0fc8\u102e\u1034\u1038\u103b\u1042")
        buf.write("\u104b\u1058\u105b\u1361\u1361\u136b\u1373\u1714\u1716")
        buf.write("\u1734\u1736\u1754\u1755\u1774\u1775\u17b8\u17d5\u17df")
        buf.write("\u17df\u17e2\u17eb\u180d\u180f\u1812\u181b\u18ab\u18ab")
        buf.write("\u1922\u192d\u1932\u193d\u1948\u1951\u19b2\u19c2\u19ca")
        buf.write("\u19cb\u19d2\u19db\u1a19\u1a1d\u1dc2\u1dc5\u2041\u2042")
        buf.write("\u2056\u2056\u20d2\u20de\u20e3\u20e3\u20e7\u20ed\u302c")
        buf.write("\u3031\u309b\u309c\ua804\ua804\ua808\ua808\ua80d\ua80d")
        buf.write("\ua825\ua829\ufb20\ufb20\ufe02\ufe11\ufe22\ufe25\ufe35")
        buf.write("\ufe36\ufe4f\ufe51\uff12\uff1b\uff41\uff41\4\2$$>>\4\2")
        buf.write("))>>\5\2\13\f\17\17\"\"\4\2/\60aa\5\2\u00b9\u00b9\u0302")
        buf.write("\u0371\u2041\u2042\n\2<<C\\c|\u2072\u2191\u2c02\u2ff1")
        buf.write("\u3003\ud801\uf902\ufdd1\ufdf2\uffff\2\u02e8\2\4\3\2\2")
        buf.write("\2\2\6\3\2\2\2\2\b\3\2\2\2\2\n\3\2\2\2\2\f\3\2\2\2\2\16")
        buf.write("\3\2\2\2\2\20\3\2\2\2\2\22\3\2\2\2\2\24\3\2\2\2\2\26\3")
        buf.write("\2\2\2\2\30\3\2\2\2\2\32\3\2\2\2\2\34\3\2\2\2\2\36\3\2")
        buf.write("\2\2\2 \3\2\2\2\2\"\3\2\2\2\2$\3\2\2\2\2&\3\2\2\2\2(\3")
        buf.write("\2\2\2\2*\3\2\2\2\2,\3\2\2\2\2.\3\2\2\2\2\60\3\2\2\2\2")
        buf.write("\62\3\2\2\2\2\64\3\2\2\2\2\66\3\2\2\2\28\3\2\2\2\2:\3")
        buf.write("\2\2\2\2<\3\2\2\2\2>\3\2\2\2\2@\3\2\2\2\2B\3\2\2\2\2D")
        buf.write("\3\2\2\2\2F\3\2\2\2\2H\3\2\2\2\2J\3\2\2\2\2L\3\2\2\2\2")
        buf.write("N\3\2\2\2\2P\3\2\2\2\2R\3\2\2\2\2T\3\2\2\2\2V\3\2\2\2")
        buf.write("\2X\3\2\2\2\2Z\3\2\2\2\2\\\3\2\2\2\2^\3\2\2\2\2`\3\2\2")
        buf.write("\2\2b\3\2\2\2\2d\3\2\2\2\2f\3\2\2\2\2h\3\2\2\2\2j\3\2")
        buf.write("\2\2\2l\3\2\2\2\2n\3\2\2\2\2p\3\2\2\2\2r\3\2\2\2\2t\3")
        buf.write("\2\2\2\2v\3\2\2\2\2x\3\2\2\2\2z\3\2\2\2\2|\3\2\2\2\2~")
        buf.write("\3\2\2\2\2\u0080\3\2\2\2\2\u0082\3\2\2\2\2\u00b6\3\2\2")
        buf.write("\2\3\u00b8\3\2\2\2\3\u00ba\3\2\2\2\3\u00bc\3\2\2\2\3\u00be")
        buf.write("\3\2\2\2\3\u00c0\3\2\2\2\3\u00c2\3\2\2\2\3\u00c4\3\2\2")
        buf.write("\2\4\u00d0\3\2\2\2\6\u00d2\3\2\2\2\b\u00d6\3\2\2\2\n\u00d8")
        buf.write("\3\2\2\2\f\u00de\3\2\2\2\16\u00e3\3\2\2\2\20\u00e8\3\2")
        buf.write("\2\2\22\u00ed\3\2\2\2\24\u00f1\3\2\2\2\26\u00f8\3\2\2")
        buf.write("\2\30\u00fb\3\2\2\2\32\u00fe\3\2\2\2\34\u0101\3\2\2\2")
        buf.write("\36\u0106\3\2\2\2 \u010b\3\2\2\2\"\u0111\3\2\2\2$\u0115")
        buf.write("\3\2\2\2&\u0118\3\2\2\2(\u011c\3\2\2\2*\u0120\3\2\2\2")
        buf.write(",\u0125\3\2\2\2.\u012b\3\2\2\2\60\u0134\3\2\2\2\62\u013a")
        buf.write("\3\2\2\2\64\u014c\3\2\2\2\66\u0150\3\2\2\28\u015c\3\2")
        buf.write("\2\2:\u0167\3\2\2\2<\u0179\3\2\2\2>\u017b\3\2\2\2@\u0182")
        buf.write("\3\2\2\2B\u0184\3\2\2\2D\u0186\3\2\2\2F\u0189\3\2\2\2")
        buf.write("H\u018c\3\2\2\2J\u018e\3\2\2\2L\u0190\3\2\2\2N\u0192\3")
        buf.write("\2\2\2P\u0195\3\2\2\2R\u0197\3\2\2\2T\u019a\3\2\2\2V\u019d")
        buf.write("\3\2\2\2X\u019f\3\2\2\2Z\u01a1\3\2\2\2\\\u01a3\3\2\2\2")
        buf.write("^\u01a6\3\2\2\2`\u01a9\3\2\2\2b\u01ab\3\2\2\2d\u01ad\3")
        buf.write("\2\2\2f\u01af\3\2\2\2h\u01b1\3\2\2\2j\u01b3\3\2\2\2l\u01b6")
        buf.write("\3\2\2\2n\u01b9\3\2\2\2p\u01bb\3\2\2\2r\u01bd\3\2\2\2")
        buf.write("t\u01c0\3\2\2\2v\u01c3\3\2\2\2x\u01c6\3\2\2\2z\u01c9\3")
        buf.write("\2\2\2|\u01cc\3\2\2\2~\u01cf\3\2\2\2\u0080\u01d5\3\2\2")
        buf.write("\2\u0082\u01d9\3\2\2\2\u0084\u01ed\3\2\2\2\u0086\u0209")
        buf.write("\3\2\2\2\u0088\u020d\3\2\2\2\u008a\u020f\3\2\2\2\u008c")
        buf.write("\u0215\3\2\2\2\u008e\u0217\3\2\2\2\u0090\u0219\3\2\2\2")
        buf.write("\u0092\u021b\3\2\2\2\u0094\u021d\3\2\2\2\u0096\u021f\3")
        buf.write("\2\2\2\u0098\u0228\3\2\2\2\u009a\u022b\3\2\2\2\u009c\u022f")
        buf.write("\3\2\2\2\u009e\u0247\3\2\2\2\u00a0\u0263\3\2\2\2\u00a2")
        buf.write("\u0267\3\2\2\2\u00a4\u026a\3\2\2\2\u00a6\u026d\3\2\2\2")
        buf.write("\u00a8\u0270\3\2\2\2\u00aa\u0272\3\2\2\2\u00ac\u0276\3")
        buf.write("\2\2\2\u00ae\u027a\3\2\2\2\u00b0\u0281\3\2\2\2\u00b2\u028d")
        buf.write("\3\2\2\2\u00b4\u0291\3\2\2\2\u00b6\u0293\3\2\2\2\u00b8")
        buf.write("\u0298\3\2\2\2\u00ba\u029c\3\2\2\2\u00bc\u02a1\3\2\2\2")
        buf.write("\u00be\u02a3\3\2\2\2\u00c0\u02b5\3\2\2\2\u00c2\u02b7\3")
        buf.write("\2\2\2\u00c4\u02be\3\2\2\2\u00c6\u02c2\3\2\2\2\u00c8\u02c4")
        buf.write("\3\2\2\2\u00ca\u02ca\3\2\2\2\u00cc\u02cd\3\2\2\2\u00ce")
        buf.write("\u00d1\58\34\2\u00cf\u00d1\5:\35\2\u00d0\u00ce\3\2\2\2")
        buf.write("\u00d0\u00cf\3\2\2\2\u00d1\5\3\2\2\2\u00d2\u00d3\5\b\4")
        buf.write("\2\u00d3\7\3\2\2\2\u00d4\u00d7\5<\36\2\u00d5\u00d7\5>")
        buf.write("\37\2\u00d6\u00d4\3\2\2\2\u00d6\u00d5\3\2\2\2\u00d7\t")
        buf.write("\3\2\2\2\u00d8\u00d9\7h\2\2\u00d9\u00da\7k\2\2\u00da\u00db")
        buf.write("\7t\2\2\u00db\u00dc\7u\2\2\u00dc\u00dd\7v\2\2\u00dd\13")
        buf.write("\3\2\2\2\u00de\u00df\7n\2\2\u00df\u00e0\7c\2\2\u00e0\u00e1")
        buf.write("\7u\2\2\u00e1\u00e2\7v\2\2\u00e2\r\3\2\2\2\u00e3\u00e4")
        buf.write("\7t\2\2\u00e4\u00e5\7w\2\2\u00e5\u00e6\7n\2\2\u00e6\u00e7")
        buf.write("\7g\2\2\u00e7\17\3\2\2\2\u00e8\u00e9\7d\2\2\u00e9\u00ea")
        buf.write("\7c\2\2\u00ea\u00eb\7u\2\2\u00eb\u00ec\7g\2\2\u00ec\21")
        buf.write("\3\2\2\2\u00ed\u00ee\7f\2\2\u00ee\u00ef\7g\2\2\u00ef\u00f0")
        buf.write("\7h\2\2\u00f0\23\3\2\2\2\u00f1\u00f2\7t\2\2\u00f2\u00f3")
        buf.write("\7g\2\2\u00f3\u00f4\7v\2\2\u00f4\u00f5\7w\2\2\u00f5\u00f6")
        buf.write("\7t\2\2\u00f6\u00f7\7p\2\2\u00f7\25\3\2\2\2\u00f8\u00f9")
        buf.write("\7c\2\2\u00f9\u00fa\7u\2\2\u00fa\27\3\2\2\2\u00fb\u00fc")
        buf.write("\7k\2\2\u00fc\u00fd\7h\2\2\u00fd\31\3\2\2\2\u00fe\u00ff")
        buf.write("\7k\2\2\u00ff\u0100\7p\2\2\u0100\33\3\2\2\2\u0101\u0102")
        buf.write("\7g\2\2\u0102\u0103\7n\2\2\u0103\u0104\7k\2\2\u0104\u0105")
        buf.write("\7h\2\2\u0105\35\3\2\2\2\u0106\u0107\7g\2\2\u0107\u0108")
        buf.write("\7n\2\2\u0108\u0109\7u\2\2\u0109\u010a\7g\2\2\u010a\37")
        buf.write("\3\2\2\2\u010b\u010c\7y\2\2\u010c\u010d\7j\2\2\u010d\u010e")
        buf.write("\7k\2\2\u010e\u010f\7n\2\2\u010f\u0110\7g\2\2\u0110!\3")
        buf.write("\2\2\2\u0111\u0112\7h\2\2\u0112\u0113\7q\2\2\u0113\u0114")
        buf.write("\7t\2\2\u0114#\3\2\2\2\u0115\u0116\7q\2\2\u0116\u0117")
        buf.write("\7t\2\2\u0117%\3\2\2\2\u0118\u0119\7c\2\2\u0119\u011a")
        buf.write("\7p\2\2\u011a\u011b\7f\2\2\u011b\'\3\2\2\2\u011c\u011d")
        buf.write("\7p\2\2\u011d\u011e\7q\2\2\u011e\u011f\7v\2\2\u011f)\3")
        buf.write("\2\2\2\u0120\u0121\7V\2\2\u0121\u0122\7t\2\2\u0122\u0123")
        buf.write("\7w\2\2\u0123\u0124\7g\2\2\u0124+\3\2\2\2\u0125\u0126")
        buf.write("\7H\2\2\u0126\u0127\7c\2\2\u0127\u0128\7n\2\2\u0128\u0129")
        buf.write("\7u\2\2\u0129\u012a\7g\2\2\u012a-\3\2\2\2\u012b\u012c")
        buf.write("\7e\2\2\u012c\u012d\7q\2\2\u012d\u012e\7p\2\2\u012e\u012f")
        buf.write("\7v\2\2\u012f\u0130\7k\2\2\u0130\u0131\7p\2\2\u0131\u0132")
        buf.write("\7w\2\2\u0132\u0133\7g\2\2\u0133/\3\2\2\2\u0134\u0135")
        buf.write("\7d\2\2\u0135\u0136\7t\2\2\u0136\u0137\7g\2\2\u0137\u0138")
        buf.write("\7c\2\2\u0138\u0139\7m\2\2\u0139\61\3\2\2\2\u013a\u013b")
        buf.write("\7d\2\2\u013b\u013c\7n\2\2\u013c\u013d\7q\2\2\u013d\u013e")
        buf.write("\7e\2\2\u013e\u013f\7m\2\2\u013f\63\3\2\2\2\u0140\u0141")
        buf.write("\6\32\2\2\u0141\u014d\5\u00acV\2\u0142\u0144\7\17\2\2")
        buf.write("\u0143\u0142\3\2\2\2\u0143\u0144\3\2\2\2\u0144\u0145\3")
        buf.write("\2\2\2\u0145\u0148\7\f\2\2\u0146\u0148\4\16\17\2\u0147")
        buf.write("\u0143\3\2\2\2\u0147\u0146\3\2\2\2\u0148\u014a\3\2\2\2")
        buf.write("\u0149\u014b\5\u00acV\2\u014a\u0149\3\2\2\2\u014a\u014b")
        buf.write("\3\2\2\2\u014b\u014d\3\2\2\2\u014c\u0140\3\2\2\2\u014c")
        buf.write("\u0147\3\2\2\2\u014d\u014e\3\2\2\2\u014e\u014f\b\32\2")
        buf.write("\2\u014f\65\3\2\2\2\u0150\u0154\5\u00b2Y\2\u0151\u0153")
        buf.write("\5\u00b4Z\2\u0152\u0151\3\2\2\2\u0153\u0156\3\2\2\2\u0154")
        buf.write("\u0152\3\2\2\2\u0154\u0155\3\2\2\2\u0155\67\3\2\2\2\u0156")
        buf.write("\u0154\3\2\2\2\u0157\u015d\t\2\2\2\u0158\u0159\t\3\2\2")
        buf.write("\u0159\u015d\t\4\2\2\u015a\u015b\t\4\2\2\u015b\u015d\t")
        buf.write("\3\2\2\u015c\u0157\3\2\2\2\u015c\u0158\3\2\2\2\u015c\u015a")
        buf.write("\3\2\2\2\u015c\u015d\3\2\2\2\u015d\u0160\3\2\2\2\u015e")
        buf.write("\u0161\5\u0084B\2\u015f\u0161\5\u0086C\2\u0160\u015e\3")
        buf.write("\2\2\2\u0160\u015f\3\2\2\2\u01619\3\2\2\2\u0162\u0168")
        buf.write("\t\5\2\2\u0163\u0164\t\5\2\2\u0164\u0168\t\4\2\2\u0165")
        buf.write("\u0166\t\4\2\2\u0166\u0168\t\5\2\2\u0167\u0162\3\2\2\2")
        buf.write("\u0167\u0163\3\2\2\2\u0167\u0165\3\2\2\2\u0168\u016b\3")
        buf.write("\2\2\2\u0169\u016c\5\u009eO\2\u016a\u016c\5\u00a0P\2\u016b")
        buf.write("\u0169\3\2\2\2\u016b\u016a\3\2\2\2\u016c;\3\2\2\2\u016d")
        buf.write("\u0171\5\u008eG\2\u016e\u0170\5\u0090H\2\u016f\u016e\3")
        buf.write("\2\2\2\u0170\u0173\3\2\2\2\u0171\u016f\3\2\2\2\u0171\u0172")
        buf.write("\3\2\2\2\u0172\u017a\3\2\2\2\u0173\u0171\3\2\2\2\u0174")
        buf.write("\u0176\7\62\2\2\u0175\u0174\3\2\2\2\u0176\u0177\3\2\2")
        buf.write("\2\u0177\u0175\3\2\2\2\u0177\u0178\3\2\2\2\u0178\u017a")
        buf.write("\3\2\2\2\u0179\u016d\3\2\2\2\u0179\u0175\3\2\2\2\u017a")
        buf.write("=\3\2\2\2\u017b\u017c\7\62\2\2\u017c\u017e\t\6\2\2\u017d")
        buf.write("\u017f\5\u0094J\2\u017e\u017d\3\2\2\2\u017f\u0180\3\2")
        buf.write("\2\2\u0180\u017e\3\2\2\2\u0180\u0181\3\2\2\2\u0181?\3")
        buf.write("\2\2\2\u0182\u0183\7\60\2\2\u0183A\3\2\2\2\u0184\u0185")
        buf.write("\7,\2\2\u0185C\3\2\2\2\u0186\u0187\7*\2\2\u0187\u0188")
        buf.write("\b\"\3\2\u0188E\3\2\2\2\u0189\u018a\7+\2\2\u018a\u018b")
        buf.write("\b#\4\2\u018bG\3\2\2\2\u018c\u018d\7.\2\2\u018dI\3\2\2")
        buf.write("\2\u018e\u018f\7<\2\2\u018fK\3\2\2\2\u0190\u0191\7=\2")
        buf.write("\2\u0191M\3\2\2\2\u0192\u0193\7,\2\2\u0193\u0194\7,\2")
        buf.write("\2\u0194O\3\2\2\2\u0195\u0196\7?\2\2\u0196Q\3\2\2\2\u0197")
        buf.write("\u0198\7]\2\2\u0198\u0199\b)\5\2\u0199S\3\2\2\2\u019a")
        buf.write("\u019b\7_\2\2\u019b\u019c\b*\6\2\u019cU\3\2\2\2\u019d")
        buf.write("\u019e\7~\2\2\u019eW\3\2\2\2\u019f\u01a0\7`\2\2\u01a0")
        buf.write("Y\3\2\2\2\u01a1\u01a2\7(\2\2\u01a2[\3\2\2\2\u01a3\u01a4")
        buf.write("\7>\2\2\u01a4\u01a5\7>\2\2\u01a5]\3\2\2\2\u01a6\u01a7")
        buf.write("\7@\2\2\u01a7\u01a8\7@\2\2\u01a8_\3\2\2\2\u01a9\u01aa")
        buf.write("\7-\2\2\u01aaa\3\2\2\2\u01ab\u01ac\7/\2\2\u01acc\3\2\2")
        buf.write("\2\u01ad\u01ae\7\61\2\2\u01aee\3\2\2\2\u01af\u01b0\7\'")
        buf.write("\2\2\u01b0g\3\2\2\2\u01b1\u01b2\7\u0080\2\2\u01b2i\3\2")
        buf.write("\2\2\u01b3\u01b4\7}\2\2\u01b4\u01b5\b\65\7\2\u01b5k\3")
        buf.write("\2\2\2\u01b6\u01b7\7\177\2\2\u01b7\u01b8\b\66\b\2\u01b8")
        buf.write("m\3\2\2\2\u01b9\u01ba\7>\2\2\u01bao\3\2\2\2\u01bb\u01bc")
        buf.write("\7@\2\2\u01bcq\3\2\2\2\u01bd\u01be\7?\2\2\u01be\u01bf")
        buf.write("\7?\2\2\u01bfs\3\2\2\2\u01c0\u01c1\7@\2\2\u01c1\u01c2")
        buf.write("\7?\2\2\u01c2u\3\2\2\2\u01c3\u01c4\7>\2\2\u01c4\u01c5")
        buf.write("\7?\2\2\u01c5w\3\2\2\2\u01c6\u01c7\7>\2\2\u01c7\u01c8")
        buf.write("\7@\2\2\u01c8y\3\2\2\2\u01c9\u01ca\7#\2\2\u01ca\u01cb")
        buf.write("\7?\2\2\u01cb{\3\2\2\2\u01cc\u01cd\7-\2\2\u01cd\u01ce")
        buf.write("\7?\2\2\u01ce}\3\2\2\2\u01cf\u01d0\7/\2\2\u01d0\u01d1")
        buf.write("\7?\2\2\u01d1\177\3\2\2\2\u01d2\u01d6\5\u00acV\2\u01d3")
        buf.write("\u01d6\5\u00aeW\2\u01d4\u01d6\5\u00b0X\2\u01d5\u01d2\3")
        buf.write("\2\2\2\u01d5\u01d3\3\2\2\2\u01d5\u01d4\3\2\2\2\u01d6\u01d7")
        buf.write("\3\2\2\2\u01d7\u01d8\b@\t\2\u01d8\u0081\3\2\2\2\u01d9")
        buf.write("\u01da\13\2\2\2\u01da\u0083\3\2\2\2\u01db\u01e0\7)\2\2")
        buf.write("\u01dc\u01df\5\u008cF\2\u01dd\u01df\n\7\2\2\u01de\u01dc")
        buf.write("\3\2\2\2\u01de\u01dd\3\2\2\2\u01df\u01e2\3\2\2\2\u01e0")
        buf.write("\u01de\3\2\2\2\u01e0\u01e1\3\2\2\2\u01e1\u01e3\3\2\2\2")
        buf.write("\u01e2\u01e0\3\2\2\2\u01e3\u01ee\7)\2\2\u01e4\u01e9\7")
        buf.write("$\2\2\u01e5\u01e8\5\u008cF\2\u01e6\u01e8\n\b\2\2\u01e7")
        buf.write("\u01e5\3\2\2\2\u01e7\u01e6\3\2\2\2\u01e8\u01eb\3\2\2\2")
        buf.write("\u01e9\u01e7\3\2\2\2\u01e9\u01ea\3\2\2\2\u01ea\u01ec\3")
        buf.write("\2\2\2\u01eb\u01e9\3\2\2\2\u01ec\u01ee\7$\2\2\u01ed\u01db")
        buf.write("\3\2\2\2\u01ed\u01e4\3\2\2\2\u01ee\u0085\3\2\2\2\u01ef")
        buf.write("\u01f0\7)\2\2\u01f0\u01f1\7)\2\2\u01f1\u01f2\7)\2\2\u01f2")
        buf.write("\u01f6\3\2\2\2\u01f3\u01f5\5\u0088D\2\u01f4\u01f3\3\2")
        buf.write("\2\2\u01f5\u01f8\3\2\2\2\u01f6\u01f7\3\2\2\2\u01f6\u01f4")
        buf.write("\3\2\2\2\u01f7\u01f9\3\2\2\2\u01f8\u01f6\3\2\2\2\u01f9")
        buf.write("\u01fa\7)\2\2\u01fa\u01fb\7)\2\2\u01fb\u020a\7)\2\2\u01fc")
        buf.write("\u01fd\7$\2\2\u01fd\u01fe\7$\2\2\u01fe\u01ff\7$\2\2\u01ff")
        buf.write("\u0203\3\2\2\2\u0200\u0202\5\u0088D\2\u0201\u0200\3\2")
        buf.write("\2\2\u0202\u0205\3\2\2\2\u0203\u0204\3\2\2\2\u0203\u0201")
        buf.write("\3\2\2\2\u0204\u0206\3\2\2\2\u0205\u0203\3\2\2\2\u0206")
        buf.write("\u0207\7$\2\2\u0207\u0208\7$\2\2\u0208\u020a\7$\2\2\u0209")
        buf.write("\u01ef\3\2\2\2\u0209\u01fc\3\2\2\2\u020a\u0087\3\2\2\2")
        buf.write("\u020b\u020e\5\u008aE\2\u020c\u020e\5\u008cF\2\u020d\u020b")
        buf.write("\3\2\2\2\u020d\u020c\3\2\2\2\u020e\u0089\3\2\2\2\u020f")
        buf.write("\u0210\n\t\2\2\u0210\u008b\3\2\2\2\u0211\u0212\7^\2\2")
        buf.write("\u0212\u0216\13\2\2\2\u0213\u0214\7^\2\2\u0214\u0216\5")
        buf.write("\64\32\2\u0215\u0211\3\2\2\2\u0215\u0213\3\2\2\2\u0216")
        buf.write("\u008d\3\2\2\2\u0217\u0218\t\n\2\2\u0218\u008f\3\2\2\2")
        buf.write("\u0219\u021a\t\13\2\2\u021a\u0091\3\2\2\2\u021b\u021c")
        buf.write("\t\f\2\2\u021c\u0093\3\2\2\2\u021d\u021e\t\r\2\2\u021e")
        buf.write("\u0095\3\2\2\2\u021f\u0220\t\16\2\2\u0220\u0097\3\2\2")
        buf.write("\2\u0221\u0223\5\u009aM\2\u0222\u0221\3\2\2\2\u0222\u0223")
        buf.write("\3\2\2\2\u0223\u0224\3\2\2\2\u0224\u0229\5\u009cN\2\u0225")
        buf.write("\u0226\5\u009aM\2\u0226\u0227\7\60\2\2\u0227\u0229\3\2")
        buf.write("\2\2\u0228\u0222\3\2\2\2\u0228\u0225\3\2\2\2\u0229\u0099")
        buf.write("\3\2\2\2\u022a\u022c\5\u0090H\2\u022b\u022a\3\2\2\2\u022c")
        buf.write("\u022d\3\2\2\2\u022d\u022b\3\2\2\2\u022d\u022e\3\2\2\2")
        buf.write("\u022e\u009b\3\2\2\2\u022f\u0231\7\60\2\2\u0230\u0232")
        buf.write("\5\u0090H\2\u0231\u0230\3\2\2\2\u0232\u0233\3\2\2\2\u0233")
        buf.write("\u0231\3\2\2\2\u0233\u0234\3\2\2\2\u0234\u009d\3\2\2\2")
        buf.write("\u0235\u023a\7)\2\2\u0236\u0239\5\u00a4R\2\u0237\u0239")
        buf.write("\5\u00aaU\2\u0238\u0236\3\2\2\2\u0238\u0237\3\2\2\2\u0239")
        buf.write("\u023c\3\2\2\2\u023a\u0238\3\2\2\2\u023a\u023b\3\2\2\2")
        buf.write("\u023b\u023d\3\2\2\2\u023c\u023a\3\2\2\2\u023d\u0248\7")
        buf.write(")\2\2\u023e\u0243\7$\2\2\u023f\u0242\5\u00a6S\2\u0240")
        buf.write("\u0242\5\u00aaU\2\u0241\u023f\3\2\2\2\u0241\u0240\3\2")
        buf.write("\2\2\u0242\u0245\3\2\2\2\u0243\u0241\3\2\2\2\u0243\u0244")
        buf.write("\3\2\2\2\u0244\u0246\3\2\2\2\u0245\u0243\3\2\2\2\u0246")
        buf.write("\u0248\7$\2\2\u0247\u0235\3\2\2\2\u0247\u023e\3\2\2\2")
        buf.write("\u0248\u009f\3\2\2\2\u0249\u024a\7)\2\2\u024a\u024b\7")
        buf.write(")\2\2\u024b\u024c\7)\2\2\u024c\u0250\3\2\2\2\u024d\u024f")
        buf.write("\5\u00a2Q\2\u024e\u024d\3\2\2\2\u024f\u0252\3\2\2\2\u0250")
        buf.write("\u0251\3\2\2\2\u0250\u024e\3\2\2\2\u0251\u0253\3\2\2\2")
        buf.write("\u0252\u0250\3\2\2\2\u0253\u0254\7)\2\2\u0254\u0255\7")
        buf.write(")\2\2\u0255\u0264\7)\2\2\u0256\u0257\7$\2\2\u0257\u0258")
        buf.write("\7$\2\2\u0258\u0259\7$\2\2\u0259\u025d\3\2\2\2\u025a\u025c")
        buf.write("\5\u00a2Q\2\u025b\u025a\3\2\2\2\u025c\u025f\3\2\2\2\u025d")
        buf.write("\u025e\3\2\2\2\u025d\u025b\3\2\2\2\u025e\u0260\3\2\2\2")
        buf.write("\u025f\u025d\3\2\2\2\u0260\u0261\7$\2\2\u0261\u0262\7")
        buf.write("$\2\2\u0262\u0264\7$\2\2\u0263\u0249\3\2\2\2\u0263\u0256")
        buf.write("\3\2\2\2\u0264\u00a1\3\2\2\2\u0265\u0268\5\u00a8T\2\u0266")
        buf.write("\u0268\5\u00aaU\2\u0267\u0265\3\2\2\2\u0267\u0266\3\2")
        buf.write("\2\2\u0268\u00a3\3\2\2\2\u0269\u026b\t\17\2\2\u026a\u0269")
        buf.write("\3\2\2\2\u026b\u00a5\3\2\2\2\u026c\u026e\t\20\2\2\u026d")
        buf.write("\u026c\3\2\2\2\u026e\u00a7\3\2\2\2\u026f\u0271\t\21\2")
        buf.write("\2\u0270\u026f\3\2\2\2\u0271\u00a9\3\2\2\2\u0272\u0273")
        buf.write("\7^\2\2\u0273\u0274\t\22\2\2\u0274\u00ab\3\2\2\2\u0275")
        buf.write("\u0277\t\23\2\2\u0276\u0275\3\2\2\2\u0277\u0278\3\2\2")
        buf.write("\2\u0278\u0276\3\2\2\2\u0278\u0279\3\2\2\2\u0279\u00ad")
        buf.write("\3\2\2\2\u027a\u027e\7%\2\2\u027b\u027d\n\24\2\2\u027c")
        buf.write("\u027b\3\2\2\2\u027d\u0280\3\2\2\2\u027e\u027c\3\2\2\2")
        buf.write("\u027e\u027f\3\2\2\2\u027f\u00af\3\2\2\2\u0280\u027e\3")
        buf.write("\2\2\2\u0281\u0283\7^\2\2\u0282\u0284\5\u00acV\2\u0283")
        buf.write("\u0282\3\2\2\2\u0283\u0284\3\2\2\2\u0284\u028a\3\2\2\2")
        buf.write("\u0285\u0287\7\17\2\2\u0286\u0285\3\2\2\2\u0286\u0287")
        buf.write("\3\2\2\2\u0287\u0288\3\2\2\2\u0288\u028b\7\f\2\2\u0289")
        buf.write("\u028b\4\16\17\2\u028a\u0286\3\2\2\2\u028a\u0289\3\2\2")
        buf.write("\2\u028b\u00b1\3\2\2\2\u028c\u028e\t\25\2\2\u028d\u028c")
        buf.write("\3\2\2\2\u028e\u00b3\3\2\2\2\u028f\u0292\5\u00b2Y\2\u0290")
        buf.write("\u0292\t\26\2\2\u0291\u028f\3\2\2\2\u0291\u0290\3\2\2")
        buf.write("\2\u0292\u00b5\3\2\2\2\u0293\u0294\7>\2\2\u0294\u0295")
        buf.write("\5\66\33\2\u0295\u0296\3\2\2\2\u0296\u0297\b[\n\2\u0297")
        buf.write("\u00b7\3\2\2\2\u0298\u0299\7@\2\2\u0299\u029a\3\2\2\2")
        buf.write("\u029a\u029b\b\\\13\2\u029b\u00b9\3\2\2\2\u029c\u029d")
        buf.write("\7\61\2\2\u029d\u029e\7@\2\2\u029e\u029f\3\2\2\2\u029f")
        buf.write("\u02a0\b]\13\2\u02a0\u00bb\3\2\2\2\u02a1\u02a2\7\61\2")
        buf.write("\2\u02a2\u00bd\3\2\2\2\u02a3\u02a4\7?\2\2\u02a4\u00bf")
        buf.write("\3\2\2\2\u02a5\u02a9\7$\2\2\u02a6\u02a8\n\27\2\2\u02a7")
        buf.write("\u02a6\3\2\2\2\u02a8\u02ab\3\2\2\2\u02a9\u02a7\3\2\2\2")
        buf.write("\u02a9\u02aa\3\2\2\2\u02aa\u02ac\3\2\2\2\u02ab\u02a9\3")
        buf.write("\2\2\2\u02ac\u02b6\7$\2\2\u02ad\u02b1\7)\2\2\u02ae\u02b0")
        buf.write("\n\30\2\2\u02af\u02ae\3\2\2\2\u02b0\u02b3\3\2\2\2\u02b1")
        buf.write("\u02af\3\2\2\2\u02b1\u02b2\3\2\2\2\u02b2\u02b4\3\2\2\2")
        buf.write("\u02b3\u02b1\3\2\2\2\u02b4\u02b6\7)\2\2\u02b5\u02a5\3")
        buf.write("\2\2\2\u02b5\u02ad\3\2\2\2\u02b6\u00c1\3\2\2\2\u02b7\u02bb")
        buf.write("\5\u00ccf\2\u02b8\u02ba\5\u00cae\2\u02b9\u02b8\3\2\2\2")
        buf.write("\u02ba\u02bd\3\2\2\2\u02bb\u02b9\3\2\2\2\u02bb\u02bc\3")
        buf.write("\2\2\2\u02bc\u00c3\3\2\2\2\u02bd\u02bb\3\2\2\2\u02be\u02bf")
        buf.write("\t\31\2\2\u02bf\u02c0\3\2\2\2\u02c0\u02c1\bb\t\2\u02c1")
        buf.write("\u00c5\3\2\2\2\u02c2\u02c3\t\r\2\2\u02c3\u00c7\3\2\2\2")
        buf.write("\u02c4\u02c5\t\13\2\2\u02c5\u00c9\3\2\2\2\u02c6\u02cb")
        buf.write("\5\u00ccf\2\u02c7\u02cb\t\32\2\2\u02c8\u02cb\5\u0090H")
        buf.write("\2\u02c9\u02cb\t\33\2\2\u02ca\u02c6\3\2\2\2\u02ca\u02c7")
        buf.write("\3\2\2\2\u02ca\u02c8\3\2\2\2\u02ca\u02c9\3\2\2\2\u02cb")
        buf.write("\u00cb\3\2\2\2\u02cc\u02ce\t\34\2\2\u02cd\u02cc\3\2\2")
        buf.write("\2\u02ce\u00cd\3\2\2\2;\2\3\u00d0\u00d6\u0143\u0147\u014a")
        buf.write("\u014c\u0154\u015c\u0160\u0167\u016b\u0171\u0177\u0179")
        buf.write("\u0180\u01d5\u01de\u01e0\u01e7\u01e9\u01ed\u01f6\u0203")
        buf.write("\u0209\u020d\u0215\u0222\u0228\u022d\u0233\u0238\u023a")
        buf.write("\u0241\u0243\u0247\u0250\u025d\u0263\u0267\u026a\u026d")
        buf.write("\u0270\u0278\u027e\u0283\u0286\u028a\u028d\u0291\u02a9")
        buf.write("\u02b1\u02b5\u02bb\u02ca\u02cd\f\3\32\2\3\"\3\3#\4\3)")
        buf.write("\5\3*\6\3\65\7\3\66\b\b\2\2\7\3\2\6\2\2")
        return buf.getvalue()


class RuleLexerPy(Lexer):

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    INSIDE = 1

    STRING = 1
    NUMBER = 2
    INTEGER = 3
    FIRST = 4
    LAST = 5
    RULE = 6
    BASE = 7
    DEF = 8
    RETURN = 9
    AS = 10
    IF = 11
    IN = 12
    ELIF = 13
    ELSE = 14
    WHILE = 15
    FOR = 16
    OR = 17
    AND = 18
    NOT = 19
    TRUE = 20
    FALSE = 21
    CONTINUE = 22
    BREAK = 23
    BLOCK = 24
    NEWLINE = 25
    NAME = 26
    STRING_LITERAL = 27
    BYTES_LITERAL = 28
    DECIMAL_INTEGER = 29
    HEX_INTEGER = 30
    DOT = 31
    STAR = 32
    OPEN_PAREN = 33
    CLOSE_PAREN = 34
    COMMA = 35
    COLON = 36
    SEMI_COLON = 37
    POWER = 38
    ASSIGN = 39
    OPEN_BRACK = 40
    CLOSE_BRACK = 41
    OR_OP = 42
    XOR = 43
    AND_OP = 44
    LEFT_SHIFT = 45
    RIGHT_SHIFT = 46
    ADD = 47
    MINUS = 48
    DIV = 49
    MOD = 50
    NOT_OP = 51
    OPEN_BRACE = 52
    CLOSE_BRACE = 53
    LESS_THAN = 54
    GREATER_THAN = 55
    EQUALS = 56
    GT_EQ = 57
    LT_EQ = 58
    NOT_EQ_1 = 59
    NOT_EQ_2 = 60
    ADD_ASSIGN = 61
    SUB_ASSIGN = 62
    SKIP_ = 63
    UNKNOWN_CHAR = 64
    OPEN = 65
    CLOSE = 66
    SLASH_CLOSE = 67
    SLASH = 68
    XML_EQUALS = 69
    XML_STRING = 70
    Name = 71
    S = 72

    channelNames = [ u"DEFAULT_TOKEN_CHANNEL", u"HIDDEN" ]

    modeNames = [ "DEFAULT_MODE", "INSIDE" ]

    literalNames = [ "<INVALID>",
            "'first'", "'last'", "'rule'", "'base'", "'def'", "'return'", 
            "'as'", "'if'", "'in'", "'elif'", "'else'", "'while'", "'for'", 
            "'or'", "'and'", "'not'", "'True'", "'False'", "'continue'", 
            "'break'", "'block'", "'.'", "'*'", "'('", "')'", "','", "':'", 
            "';'", "'**'", "'['", "']'", "'|'", "'^'", "'&'", "'<<'", "'>>'", 
            "'+'", "'-'", "'%'", "'~'", "'{'", "'}'", "'<'", "'=='", "'>='", 
            "'<='", "'<>'", "'!='", "'+='", "'-='", "'/>'" ]

    symbolicNames = [ "<INVALID>",
            "STRING", "NUMBER", "INTEGER", "FIRST", "LAST", "RULE", "BASE", 
            "DEF", "RETURN", "AS", "IF", "IN", "ELIF", "ELSE", "WHILE", 
            "FOR", "OR", "AND", "NOT", "TRUE", "FALSE", "CONTINUE", "BREAK", 
            "BLOCK", "NEWLINE", "NAME", "STRING_LITERAL", "BYTES_LITERAL", 
            "DECIMAL_INTEGER", "HEX_INTEGER", "DOT", "STAR", "OPEN_PAREN", 
            "CLOSE_PAREN", "COMMA", "COLON", "SEMI_COLON", "POWER", "ASSIGN", 
            "OPEN_BRACK", "CLOSE_BRACK", "OR_OP", "XOR", "AND_OP", "LEFT_SHIFT", 
            "RIGHT_SHIFT", "ADD", "MINUS", "DIV", "MOD", "NOT_OP", "OPEN_BRACE", 
            "CLOSE_BRACE", "LESS_THAN", "GREATER_THAN", "EQUALS", "GT_EQ", 
            "LT_EQ", "NOT_EQ_1", "NOT_EQ_2", "ADD_ASSIGN", "SUB_ASSIGN", 
            "SKIP_", "UNKNOWN_CHAR", "OPEN", "CLOSE", "SLASH_CLOSE", "SLASH", 
            "XML_EQUALS", "XML_STRING", "Name", "S" ]

    ruleNames = [ "STRING", "NUMBER", "INTEGER", "FIRST", "LAST", "RULE", 
                  "BASE", "DEF", "RETURN", "AS", "IF", "IN", "ELIF", "ELSE", 
                  "WHILE", "FOR", "OR", "AND", "NOT", "TRUE", "FALSE", "CONTINUE", 
                  "BREAK", "BLOCK", "NEWLINE", "NAME", "STRING_LITERAL", 
                  "BYTES_LITERAL", "DECIMAL_INTEGER", "HEX_INTEGER", "DOT", 
                  "STAR", "OPEN_PAREN", "CLOSE_PAREN", "COMMA", "COLON", 
                  "SEMI_COLON", "POWER", "ASSIGN", "OPEN_BRACK", "CLOSE_BRACK", 
                  "OR_OP", "XOR", "AND_OP", "LEFT_SHIFT", "RIGHT_SHIFT", 
                  "ADD", "MINUS", "DIV", "MOD", "NOT_OP", "OPEN_BRACE", 
                  "CLOSE_BRACE", "LESS_THAN", "GREATER_THAN", "EQUALS", 
                  "GT_EQ", "LT_EQ", "NOT_EQ_1", "NOT_EQ_2", "ADD_ASSIGN", 
                  "SUB_ASSIGN", "SKIP_", "UNKNOWN_CHAR", "SHORT_STRING", 
                  "LONG_STRING", "LONG_STRING_ITEM", "LONG_STRING_CHAR", 
                  "STRING_ESCAPE_SEQ", "NON_ZERO_DIGIT", "DIGIT", "OCT_DIGIT", 
                  "HEX_DIGIT", "BIN_DIGIT", "POINT_FLOAT", "INT_PART", "FRACTION", 
                  "SHORT_BYTES", "LONG_BYTES", "LONG_BYTES_ITEM", "SHORT_BYTES_CHAR_NO_SINGLE_QUOTE", 
                  "SHORT_BYTES_CHAR_NO_DOUBLE_QUOTE", "LONG_BYTES_CHAR", 
                  "BYTES_ESCAPE_SEQ", "SPACES", "COMMENT", "LINE_JOINING", 
                  "ID_START", "ID_CONTINUE", "OPEN", "CLOSE", "SLASH_CLOSE", 
                  "SLASH", "XML_EQUALS", "XML_STRING", "Name", "S", "HEXDIGIT", 
                  "XML_DIGIT", "NameChar", "NameStartChar" ]

    grammarFileName = "RuleLexerPy.g4"

    def __init__(self, input=None, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.7.2")
        self._interp = LexerATNSimulator(self, self.atn, self.decisionsToDFA, PredictionContextCache())
        self._actions = None
        self._predicates = None


    # A queue where extra tokens are pushed on (see the NEWLINE lexer rule).
    tokens:Token = []
    # The stack that keeps track of the indentation level.
    indents:int = []
    # The amount of opened braces, brackets and parenthesis.
    opened:int = 0
    # The most recently produced token.
    lastToken:Token
    def emitToken(self, t:Token):
        super().emitToken(t)
        self.tokens.append(t)

    def nextToken(self):
        #Check if the end-of-file is ahead and there are still some DEDENTS expected.
        if self._input.LA(1) == Token.EOF and self.indents:
            # Remove any trailing EOF tokens from our buffer
            while true:
                if self.tokens[len(self.tokens)-1].getType == Token.EOF:
                    self.tokens.pop()
                if not self.indents:
                    break

            # First emit an extra line break that serves as the end of the statement.
            self.emitToken(self.commonToken(RuleParserPy.NEWLINE, "\n"))

            # Now emitToken as much DEDENT tokens as needed.
            while self.indents:
                self.emitToken(self.createDedent())
                self.indents.pop()

            # Put the EOF back on the token stream.
            self.emitToken(self.commonToken(RuleParserPy.EOF, "<EOF>"))
            
        next:Token = super().nextToken()

        if next.channel == Token.DEFAULT_CHANNEL:
            # Keep track of the last token on the default channel.
            self.lastToken = next

        if not self.tokens:
            return next
        else:
            res:Token = self.tokens[0];
            self.tokens.pop(0);
            return res

    def createDedent(self):
        self.dedent:CommonToken = self.commonToken(RuleParserPy.DEDENT, "")
        self.dedent.line = self.lastToken.line
        self.dedent.text = " " * self.indents[0]
        return self.dedent

    def commonToken(self, type:int, text:str):
        stop:int = self.getCharIndex() - 1
        start:int = 0
        if text:
            start = stop - len(text) + 1
        ct = CommonToken(self._tokenFactorySourcePair, type, self.DEFAULT_TOKEN_CHANNEL, start, stop)
        return ct

    # Calculates the indentation of the provided spaces, taking the
    # following rules into account:
    #
    # "Tabs are replaced (from left to right) by one to eight spaces
    #  such that the total number of characters up to and including
    #  the replacement is a multiple of eight [...]"

    @staticmethod
    def getIndentationCount(spaces:str):
            count:int = 0
            for ch in spaces:
                if ch == '\t':
                    count += 8 - (count % 8)
                    break
                else:
                    # A normal space char.
                    count += 1;
            return count

    def atStartOfInput(self):
            return super().column == 0 and super().line == 1
            


    def action(self, localctx:RuleContext, ruleIndex:int, actionIndex:int):
        if self._actions is None:
            actions = dict()
            actions[24] = self.NEWLINE_action 
            actions[32] = self.OPEN_PAREN_action 
            actions[33] = self.CLOSE_PAREN_action 
            actions[39] = self.OPEN_BRACK_action 
            actions[40] = self.CLOSE_BRACK_action 
            actions[51] = self.OPEN_BRACE_action 
            actions[52] = self.CLOSE_BRACE_action 
            self._actions = actions
        action = self._actions.get(ruleIndex, None)
        if action is not None:
            action(localctx, actionIndex)
        else:
            raise Exception("No registered action for:" + str(ruleIndex))


    def NEWLINE_action(self, localctx:RuleContext , actionIndex:int):
        if actionIndex == 0:

                 import re
                 newLine:str = re.sub(r'[^\r\n\f]+', '',  self.text)
                 spaces:str = re.sub(r'[\r\n\f]+', '',  self.text)
                 next:str = self._input.LA(1)
                 if self.opened > 0 or next in [ord(e) for e in ['\r', '\n', '\f', '#']]:
                    #  If we are inside a list or on a blank line, ignore all indents,
                    #  dedents and line breaks.
                    self.skip()
                 else:
                     self.emitToken(self.commonToken(RuleParserPy.NEWLINE, newLine))
                     indent:int = self.getIndentationCount(spaces)
                     previous:int = 0
                     if self.indents:
                         previous =  self.indents[0]
                     if indent == previous:
                         # skip indents of the same size as the present indent-size
                         self.skip()
                     elif indent > previous:
                         self.indents.insert(0, indent)
                         self.emitToken(self.commonToken(RuleParserPy.INDENT, spaces))
                     else:
                         # Possibly emit more than 1 DEDENT token.
                         while self.indents and self.indents[0] > indent:
                             self.emitToken(self.createDedent())
                             self.indents.pop(0)
               
     

    def OPEN_PAREN_action(self, localctx:RuleContext , actionIndex:int):
        if actionIndex == 1:
            self.opened += 1
     

    def CLOSE_PAREN_action(self, localctx:RuleContext , actionIndex:int):
        if actionIndex == 2:
            self.opened -= 1
     

    def OPEN_BRACK_action(self, localctx:RuleContext , actionIndex:int):
        if actionIndex == 3:
            self.opened += 1
     

    def CLOSE_BRACK_action(self, localctx:RuleContext , actionIndex:int):
        if actionIndex == 4:
            self.opened -= 1
     

    def OPEN_BRACE_action(self, localctx:RuleContext , actionIndex:int):
        if actionIndex == 5:
            self.opened += 1
     

    def CLOSE_BRACE_action(self, localctx:RuleContext , actionIndex:int):
        if actionIndex == 6:
            self.opened -= 1
     

    def sempred(self, localctx:RuleContext, ruleIndex:int, predIndex:int):
        if self._predicates is None:
            preds = dict()
            preds[24] = self.NEWLINE_sempred
            self._predicates = preds
        pred = self._predicates.get(ruleIndex, None)
        if pred is not None:
            return pred(localctx, predIndex)
        else:
            raise Exception("No registered predicate for:" + str(ruleIndex))

    def NEWLINE_sempred(self, localctx:RuleContext, predIndex:int):
            if predIndex == 0:
                return self.atStartOfInput()
         


