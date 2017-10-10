module antlr.v4.runtime.InterfaceRecognizer;

import antlr.v4.runtime.Vocabulary;
import antlr.v4.runtime.atn.ATN;
import antlr.v4.runtime.IntStream;

// Interface InterfaceRecognizer
/**
 * TODO add interface description
 */
interface InterfaceRecognizer
{

    public Vocabulary getVocabulary();

    public string[] getRuleNames();

    public string getGrammarFileName();

    public ATN getATN();

    public int getState();

    public IntStream getInputStream();

}
