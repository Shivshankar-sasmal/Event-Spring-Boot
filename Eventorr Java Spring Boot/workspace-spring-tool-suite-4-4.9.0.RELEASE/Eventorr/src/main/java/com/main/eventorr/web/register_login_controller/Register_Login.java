// Login Register Controller Package
package com.main.eventorr.web.register_login_controller;

// Common Imports
import java.util.ArrayList;

// Spring Boot Import
import org.springframework.beans.factory.annotation.Autowired;

// Java Servlet Request and Validation Imports
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

// Email Service
import com.main.eventorr.web.email.EmailService;

// Database Model Import
import com.main.eventorr.web.entity.User;

// Database Model Repository Imports
import com.main.eventorr.web.entity_repository.DistrictRepository;
import com.main.eventorr.web.entity_repository.UserRepository;

// Current User
import com.main.eventorr.web.login_current_user.Current_user;

// Database Model Form Imports
import com.main.eventorr.web.register_login_controller.forms.Login_Form;
import com.main.eventorr.web.register_login_controller.forms.Register_Form;



//Main Register Login Url Controller
@Controller
public class Register_Login {
	
	// User Database Accessor
	@Autowired
	UserRepository user_repository;
	
	// District Database Accessor
	@Autowired
	DistrictRepository district_repository;
	
	// Email Service Accessor
	@Autowired
	EmailService emailService;
		
	
//	Register Url Controller
	@RequestMapping("/register") 
	public String register(@Valid @ModelAttribute("user_register") Register_Form user_register, BindingResult result, Model model, HttpServletRequest request) {
		request.setAttribute("title", "Register");
		
		request.setAttribute("district_list", district_repository.findAll());
		
		if (request.getMethod().equals("POST")) {
			ArrayList<String> array_list = new ArrayList<>();
			
			for (FieldError error : result.getFieldErrors()) {
				array_list.add(error.getDefaultMessage().toString());
			}
			
			if (user_repository.existsByEmail(user_register.getEmail())) {
				array_list.add("Email already present ");
			}
			
			if (user_repository.existsByUsername(user_register.getUsername())) {
				array_list.add("Username already taken ");
			}
			
			if (array_list.size() > 0) {
				request.setAttribute("error_list", array_list);
				return "/register_login_views/register";
			}
			
			User user_save = new User();
			
			user_save.setFull_Name(user_register.getFull_name());
			user_save.setUsername(user_register.getUsername());
			user_save.setEmail(user_register.getEmail());
			user_save.setDistrict(user_register.getDistrict());
			user_save.setPassword(Eventorr_Encryption.encrypt(user_register.getPassword()));
			
			user_repository.saveAndFlush(user_save);	
			
			try {
				emailService.sendEmailWithAttachment(user_save, user_save.getEmail(), user_save.getUsername());
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
						
			return "redirect:/login";
		}
		else {
			model.addAttribute("user_register", new Register_Form());
			
			return "/register_login_views/register";
		}
	}
	
	
	
//	Login Url Controller
	@RequestMapping("/login") 
	public String login(@Valid @ModelAttribute("user_login") Login_Form user_login, BindingResult result ,Model model, HttpServletRequest request) {
		request.setAttribute("title", "Login");	
		
		if (request.getMethod().equals("POST")) {
			ArrayList<String> array_list = new ArrayList<>();			
			
			User user_logged = user_repository.findByUsernameAndPassword(user_login.getUsername(), Eventorr_Encryption.encrypt(user_login.getPassword()));
			if (user_logged == null) {
				array_list.add("Please enter a correct username and password. Note that both fields may be case-sensitive.");
			}
			
			for (FieldError error : result.getFieldErrors()) {
				array_list.add(error.getDefaultMessage().toString());
			}
			
			if (array_list.size() > 0) {
				request.setAttribute("error_list", array_list);
				return "/register_login_views/login";
			}
						
			Current_user.user = user_logged;
				
			if (user_logged.getIsSuperuser() == 1) {
				return "redirect:/admin";
			}
			else {
				return "redirect:/";
			}
		}
		else {
			model.addAttribute("user_login", new Login_Form());
			
			return "/register_login_views/login";
		}
	}
		
	
	
//	Logout Url Controller
	@RequestMapping("/logout") 
	public String logout(HttpServletRequest request) {
		request.setAttribute("title", "Logout");	
		
		Current_user.user = null;
		
		return "/register_login_views/logout";
	}
	
	
	
//	User Activator Url Controller
	@RequestMapping("/activate/{username}/{email}/{number}") 
	public String activate_account(@PathVariable("username") String username,@PathVariable("email") String email ,@PathVariable("number") long number  ,HttpServletRequest request) {	
		try {
			if (number == (username+email).hashCode()) {
				User user = user_repository.findByUsernameAndEmail(username,email);
				
				user.setIsActive(1);
				
				user_repository.saveAndFlush(user);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/login";
	}
	
	
	
//	User Password_Reset Url Controller
	@RequestMapping("/password-reset") 
	public String password_reset(HttpServletRequest request){
		request.setAttribute("title", "Password Reset");
	
		if (request.getMethod().equals("POST")) {
			ArrayList<String> array_list = new ArrayList<>();		
			String email = request.getParameter("email").strip();
			
			if(! user_repository.existsByEmail(email)) {
				array_list.add("Email Is Not Present In Database");
			}
				
			try {
				emailService.sendPasswordResetEmailWithAttachment(email.strip());
			} catch (Exception e) {
				array_list.add("Unable To Send Email Please Try Again");
			}

			if (array_list.size() > 0) {
				request.setAttribute("error_list", array_list);
				return "/register_login_views/password_reset";
			}
												
			return "redirect:/login";
		}
		else {
			
			return "/register_login_views/password_reset";
		}
	}
	
	
	
// User Password Reset Confirm Controller	
	@RequestMapping("/password_reset_confirm/{email}/{number}") 
	public String password_reset_confirm(@PathVariable("email") String email ,@PathVariable("number") long number ,HttpServletRequest request) {
		request.setAttribute("title", "Password Reset Confirm");
	
		if (request.getMethod().equals("POST")) {
			ArrayList<String> message = new ArrayList<>();
					
			if (number == email.hashCode()) {
				try {
					User user = user_repository.findByEmail(email);
					user.setPassword(Eventorr_Encryption.encrypt(request.getParameter("password")));
					
					user_repository.saveAndFlush(user);
				} 
				catch (Exception e) {
					return "redirect:/login";
				}
								
				return "redirect:/login";
			}
			else {
				message.add("danger");
				message.add("Password Cannot Be Update Because The Password Reset Link Is Wrong");
				request.setAttribute("message", message);
				
				return "/register_login_views/password_reset_confirm";
			}
		}
		else {
			
			return "/register_login_views/password_reset_confirm";
		}
	}
}