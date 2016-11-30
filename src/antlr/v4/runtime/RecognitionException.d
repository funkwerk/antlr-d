module antlr.v4.runtime.RecognitionException;

import antlr.v4.runtime.RuntimeException;
import antlr.v4.runtime.Recognizer;


// Class Template RecognitionException
/**
 * TODO add class description
 */
class RecognitionException(U, V) : RuntimeException
{

    public Recognizer!(U, V) recognizer;

}
