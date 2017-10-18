module antlr.v4.runtime.InterfaceLexer;
import antlr.v4.runtime.InterfaceRuleContext;

// Interface InterfaceLexer
/**
 * TODO add interface description
 */
interface InterfaceLexer
{

    public void more();

    public void skip();

    public int popMode();

    public void pushMode(int);

    public void action(InterfaceRuleContext, int, int);

    //public void action(Object, int, int);

    public void setChannel(int);

    public void mode(int);
    
    public void setType(int);

}
