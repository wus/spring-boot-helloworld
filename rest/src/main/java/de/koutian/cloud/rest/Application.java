package de.koutian.cloud.rest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

//CHECKSTYLE OFF: UncommentedMain|HideUtilityClassConstructor
@SpringBootApplication
@ComponentScan("de.koutian.cloud")
public class Application {

    public static void main(final String[] args) {
        /*
         * run application
         */
        SpringApplication.run(Application.class, args);
    }

}
// CHECKSTYLE ON: UncommentedMain|HideUtilityClassConstructor
