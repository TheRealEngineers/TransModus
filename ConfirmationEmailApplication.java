package com.TransModus.ConfirmationEmail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;

@SpringBootApplication
public class ConfirmationEmailApplication {
	@Autowired
	private EmailSenderService senderService;

	public static void main(String[] args) {
		SpringApplication.run(ConfirmationEmailApplication.class, args);
	}
	@EventListener(ApplicationReadyEvent.class)
	public void sendMail(){
		senderService.sendEmail("TransModusServices@gmail.com,",
				"Thank You for Your Reservation with Transmodus",
				"We hope this email finds you well. We are writing to express our sincere gratitude for choosing Transmodus as your preferred reservation system for managing your bookings. We are thrilled to have you on board, and we appreciate your trust in our application.\n" +
						"\n" +
						"At Transmodus, we understand the importance of efficient reservation management, and our primary goal is to provide you with a seamless experience. Our team has been working tirelessly to develop a robust system that caters to your specific needs, streamlining your reservation processes and enhancing customer satisfaction.\n" +
						"\n" +
						"We are excited to confirm that your reservation system is now successfully set up with Transmodus. With our intuitive user interface and comprehensive features, you will have full control over your bookings, ensuring a hassle-free management experience.\n" +
						"\n");
	}
}



