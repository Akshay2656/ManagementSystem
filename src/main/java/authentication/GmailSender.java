package authentication;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class GmailSender {

    public static void sendEmail(String to, String subject, String body) throws MessagingException, UnsupportedEncodingException {
        final String from = "patilhardika96@gmail.com";
        final String password = "nvlf ajif pxsg tevf";

        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host","smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties,
                new Authenticator() {
                    @Override
                    protected jakarta.mail.PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(from, password);
                    }
                });

        Message message = new MimeMessage(session); // multi[urspose internet mail sender
        message.setFrom(new InternetAddress(from, "Hr Department"));
        message.setRecipients(
                Message.RecipientType.TO, InternetAddress.parse(to)
        );

        message.setSubject(subject);
        message.setText(body);
        Transport.send(message);


    }


}
