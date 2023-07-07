package com.TransModus.ConfirmationEmail;

import javax.swing.JOptionPane;

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
        message.setFrom("jaikoisal@gmail.com");
        message.setTo(toEmail);
        message.setText(body);
        message.setSubject(String.valueOf(message));

        mailSender.send(message);

        System.out.println("Mail Sent successfully...");

    }
    private void btnSendReviewActionPerformed(java.awt.event.ActionEvent evt) {
    // Get the user's review text from the jTextField1 field
    String reviewText = jTextField1.getText();
    
    // Create an instance of the EmailSenderService
    EmailSenderService emailSenderService = new EmailSenderService();
    
    // Set the email details
    String toEmail = "jaikoisal@gmail.com"; // Set the recipient email address
    String subject = "Review Feedback"; // Set the email subject
    String body = "Review Text: " + reviewText; // Set the email body
    
    // Send the email
    emailSenderService.sendEmail(toEmail, subject, body);
    
    // Show a confirmation message to the user
    JOptionPane.showMessageDialog(this,
        "Your review has been sent! Thank you for your feedback!");
}

}
/*
For Application Properties we need to add an EMAIL AND PASSWORD under the password and username section this we
will use either Bhance Bhim to get this going I already tried making one for TransModus but couldn't complete it as
I did not have another email or phone number to associate this email sender too so this is why we prefer to use
you Bhance Bhime : )
 */
