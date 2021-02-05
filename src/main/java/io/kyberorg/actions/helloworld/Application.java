package io.kyberorg.actions.helloworld;

import kong.unirest.Unirest;

public class Application  {
    public static void main(String[] args) {
        String name;
	    if (args.length > 0) {
            name = args[0];
        } else {
            name = "Unknown";
        }

        Unirest.get("https://google.com");
        System.out.println("Hello, "+name);
	    System.exit(0);
    }
}
