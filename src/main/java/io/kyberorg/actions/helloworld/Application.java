package io.kyberorg.actions.helloworld;

import org.springframework.boot.Banner;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application implements CommandLineRunner {

	public static void main(String[] args) {
	    SpringApplication app = new SpringApplication(Application.class);
		app.setBannerMode(Banner.Mode.OFF);
		app.run(args);
	}

    @Override
    public void run(String... args){
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
