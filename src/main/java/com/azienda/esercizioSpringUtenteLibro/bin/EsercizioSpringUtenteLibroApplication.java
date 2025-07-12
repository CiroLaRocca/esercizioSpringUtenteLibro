package com.azienda.esercizioSpringUtenteLibro.bin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.azienda.esercizioSpringUtenteLibro.service.UserService;

@SpringBootApplication(scanBasePackages = {"com.azienda.esercizioSpringUtenteLibro"})
@EnableJpaRepositories(basePackages = {"com.azienda.esercizioSpringUtenteLibro.repository"})
@EntityScan(basePackages = {"com.azienda.esercizioSpringUtenteLibro.model"})
public class EsercizioSpringUtenteLibroApplication {

	public static void main(String[] args) {
		try {
			ConfigurableApplicationContext context = SpringApplication.run(EsercizioSpringUtenteLibroApplication.class, args);
			UserService user = context.getBean("userService", UserService.class);
			user.init();
			System.out.println("Connessione al db riuscita");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
