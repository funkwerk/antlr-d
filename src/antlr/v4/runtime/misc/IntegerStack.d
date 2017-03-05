module antlr.v4.runtime.misc.IntegerStack;

// Class IntegerStack
/**
 * TODO add class description
 */
class IntegerStack
{

    /**
     * @uml
     * @read
     */
    private int[] stack_;

    public this()
    {
    }

    public this(int capacity)
    {
    }

    public this(IntegerStack list)
    {
        stack_ = list.stack;
    }

    /**
     * @uml
     * @final
     */
    public final void push(int value)
    {
        stack_ ~= value;
    }

    /**
     * @uml
     * @final
     */
    public final int pop()
    {
        int i = stack_[$-1];
        stack_.length --;
        return i;
    }

    /**
     * @uml
     * @final
     */
    public final int peek()
    {
        return stack_[$-1];
    }

    /**
     * @uml
     * @final
     */
    public final void clear()
    {
        this.stack_.length = 0;
    }

    public final int[] stack()
    {
        return this.stack_.dup;
    }

}
