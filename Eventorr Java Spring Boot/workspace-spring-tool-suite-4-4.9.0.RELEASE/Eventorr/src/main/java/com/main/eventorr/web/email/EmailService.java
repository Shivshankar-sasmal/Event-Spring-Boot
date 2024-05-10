// Email Package
package com.main.eventorr.web.email;

// User Datebase Model Import
import com.main.eventorr.web.entity.User;

// Email Imports
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

// Url Path Creator Import
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;


// Email Service Provider
@Service
public class EmailService {
	
    //	Main Mail Sender Object
	@Autowired
	private JavaMailSender javaMailSender;
	
	
	public void sendEmailWithAttachment(User user, String email, String username) throws Exception {
		String url = ServletUriComponentsBuilder.fromCurrentContextPath().toUriString() + "/activate/" + username + "/" + email + "/" + (username+email).hashCode();
		
		String activate = "Hi," + user.getFull_Name() + "\n" 
		+ "Welcome To Eventorr Organization" + "\n"
		+ "Please Click On The Below Link To Activate Your Account" + "\n"
		+ url;		
		
		MimeMessage mime_msg = javaMailSender.createMimeMessage();
		MimeMessageHelper mime_msg_helper = new MimeMessageHelper(mime_msg, "UTF-8");
		
		mime_msg_helper.setSubject("Activate Your Account, Eventorr");
		mime_msg_helper.setText(activate);
		mime_msg_helper.setTo(user.getEmail());
		
		javaMailSender.send(mime_msg);
	}
	
	
	public void sendPasswordResetEmailWithAttachment(String email) throws Exception {
		String url = ServletUriComponentsBuilder.fromCurrentContextPath().toUriString() + "/password_reset_confirm/" + email + "/"  + (email).hashCode();
		
		String activate = "Hi, " + "\n" 
		+ "Welcome To Eventorr Organization" + "\n"
		+ "Click On The Below Link For Password Reset" + "\n"
		+ url;		
		
		MimeMessage mime_msg = javaMailSender.createMimeMessage();
		MimeMessageHelper mime_msg_helper = new MimeMessageHelper(mime_msg, "UTF-8");
		
		mime_msg_helper.setSubject("Activate Your Account, Eventorr");
		mime_msg_helper.setText(activate);
		mime_msg_helper.setTo(email);
		
		javaMailSender.send(mime_msg);
	}

}
