package com.kindergarten;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@SpringBootApplication
@EnableTransactionManagement
public class KindergartenApplication {

    public static void main(String[] args) {
        SpringApplication.run(KindergartenApplication.class, args);
    }


}

