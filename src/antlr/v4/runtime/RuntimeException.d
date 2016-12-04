module antlr.v4.runtime.RuntimeException;

// Class RuntimeException
/**
 * TODO add class description
 */
class RuntimeException : Exception
{

    public string elementDescription;

    public this()
    {
        super("");
    }

    public this(string elementDescription)
    {
        super("");
        this.elementDescription = elementDescription;
    }

    public string msg()
    {
        if (elementDescription !is null) {
            return elementDescription;
        }
        return null;
    }

}
