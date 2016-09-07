module antlr.v4.runtime.misc.IntegerList;

// Class IntegerList
/**
 * TODO add class description
 */
class IntegerList
{

    /**
     * @uml
     * @read
     */
    public int[] data_;

    /**
     * @uml
     * @final
     * @property
     */
    public final @property void clear()
    {
        data_.length = 0;
    }

    /**
     * @uml
     * @final
     * @property
     */
    public final @property int[] toArray()
    {
        return data;
    }

    public void add(int value)
    {
        data_ ~= value;
    }

    public final int[] data()
    {
        return this.data_.dup;
    }

}
