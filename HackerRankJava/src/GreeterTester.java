/**
 A class for testing the methods of class Greeter.
 */
public class GreeterTester
{
    /**
     This method creates a greeter object and prints the strings
     produced by calling both sayHello and sayGoodbye with that object.
     @param args unused
     */
    public static void main(String[] args)
    {
        Greeter worldGreeter = new Greeter("World");
        String greeting = worldGreeter.sayHello();
        System.out.println(greeting);

        greeting = worldGreeter.sayGoodbye();
        System.out.println(greeting);

        Greeter daveGreeter = new Greeter("Dave");
        worldGreeter.copyNameTo(daveGreeter);
        System.out.println(daveGreeter.sayHello());

        int[] numbers = new int[] {4,6};
    }
}
