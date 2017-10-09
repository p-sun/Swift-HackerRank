/**
 A class for producing simple greetings. (Revised to include sayGoodbye)
 */
public class Greeter
{
    /**
     Constructs a Greeter object that can greet a person or entity.
     @param aName the name of the person or entity who should
     be addressed in the greetings.
     */
    public Greeter(String aName) { name = aName; }

    /**
     Greet with a "Goodbye" message.
     @return a message containing "Goodbye" and the name of
     the greeted person or entity.
     */
    public String sayGoodbye() { return "Goodbye, " + name + "!"; }

    /**
     Greet with a "Hello" message.
     @return a message containing "Hello" and the name of
     the greeted person or entity.
     */
    public String sayHello() { return "Hello, " + name + "!"; }

    /**
     Sets another Greeter's name to this Greeter's name.
     @param other areferencetotheotherGreeter
     */
    public void copyNameTo(Greeter other) {
        other.name = this.name;
        // Note even tho name field is private, we CAN change the name
        // in other instances of the greeter class
    }

    /**
     Tries to set another Greeter object to a copy of this object.
     @param other the Greeter object to initialize
     */
    public void copyGreeterTo(Greeter other)
    {
        // this assignment has no effect outside the method
        other = new Greeter(name);
    }

    //Public interfaces are listed first, then private methods/fields
    private String name;

}
