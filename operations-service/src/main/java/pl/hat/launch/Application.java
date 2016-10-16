package pl.hat.launch;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import pl.hat.controllers.OperationsController;

@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(OperationsController.class, args);
    }
}
