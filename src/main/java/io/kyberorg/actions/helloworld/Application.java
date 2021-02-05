package io.kyberorg.actions.helloworld;

public class Application  {
    public static void main(String[] args) {
        String name;
	    if (args.length > 0) {
            name = args[0];
        } else {
            name = "Unknown";
        }
        System.out.println("Hello, "+name);
	    System.exit(0);
    }
}
