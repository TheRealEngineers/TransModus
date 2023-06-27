package com.TransModus.ConfirmationEmail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailSenderService {
    @Autowired
    private JavaMailSender mailSender;
    public void sendEmail(String toEmail,
                          String subject,
                          String body){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("TransModusServices@gmail.com");
        message.setTo(toEmail);
        message.setText(body);
        message.setSubject(String.valueOf(message));

        mailSender.send(message);

        System.out.println("Mail Sent successfully...");

    }
}
/*
For Application Properties we need to add an EMAIL AND PASSWORD under the password and username section this we
will use either Bhance Bhim to get this going I already tried making one for TransModus but couldn't complete it as
I did not have another email or phone number to associate this email sender too so this is why we prefer to use
you Bhance Bhime : )
 */
