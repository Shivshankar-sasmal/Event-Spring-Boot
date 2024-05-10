// Profile Package
package com.main.eventorr.web.user_profile_controller;

// Common Imports
import java.util.ArrayList;

// Spring Boot Imports
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

// Database Model Imports
import com.main.eventorr.web.entity.User;

// Database Model Repository Imports
import com.main.eventorr.web.entity_repository.DistrictRepository;
import com.main.eventorr.web.entity_repository.EventRepository;
import com.main.eventorr.web.entity_repository.Event_ParticipateRepository;
import com.main.eventorr.web.entity_repository.UserRepository;

// Current User
import com.main.eventorr.web.login_current_user.Current_user;

// Image File Uploader Import
import com.main.eventorr.web.register_login_controller.forms.File_Upload_Helper;

// Database Model Form Import
import com.main.eventorr.web.register_login_controller.forms.Profile_Form;



// Main Profile Url Controller 
@Controller
public class Profile_Controller {
	
	// User Database Accessor
	@Autowired
	UserRepository user_repository;
	
	// District Database Accessor
	@Autowired
	DistrictRepository district_repository;
	
	// File Upload Helper
	@Autowired
	private File_Upload_Helper uploader;
	
	// Event Database Accessor
	@Autowired
	EventRepository event_repository;
	
	@Autowired
	// Event Participate Model Accessor
	Event_ParticipateRepository event_participate_respository;
		
		
	
	
//	 Profile Url Controller
	@RequestMapping("/profile")
	public String profile(@Valid @ModelAttribute("user_update") Profile_Form user_update, BindingResult result, Model model, HttpServletRequest request) {
		request.setAttribute("title", "Profile");
		
		if (Current_user.is_null()) {
			return "redirect:/login";
		}
		
		User user_profile = user_repository.findById(Current_user.user.getUser_Id());
		
		request.setAttribute("district_list", district_repository.findAll());
		request.setAttribute("path", "/media/user_image/");
		request.setAttribute("user_profile", user_profile);
		
		if (request.getMethod().equals("POST")) {
			ArrayList<String> array_list = new ArrayList<>();
			ArrayList<String> message = new ArrayList<>();
						
			if (user_update.getImage() != null) {
				try {
					boolean value = uploader.uploadFile(user_update.getImage(), Current_user.user.getUsername());
					
					if (!value) {
						array_list.add("Image Not Uploaded");
					}
				}
				catch(Exception error) {
					error.printStackTrace();
				}
			}
			
			for (FieldError error : result.getFieldErrors()) {
				array_list.add(error.getDefaultMessage().toString());
			}
			
			if (array_list.size() > 0) {
				request.setAttribute("error_list", array_list);
				return "user_profile/profile";
			}
			
			if (! user_update.getImage().isEmpty()) {
				user_profile.setImage(Current_user.user.getUsername().hashCode()+"."+user_update.getImage().getContentType().split("/")[1]);
			}
			
			user_profile.setFull_Name(user_update.getFull_name());
			user_profile.setDistrict(user_update.getDistrict());
			user_profile.setSomething_About_You(user_update.getSomething_about_you());
			
			user_repository.saveAndFlush(user_profile);
			
			message.add("info");
			message.add("Profile Updated Successfully");
			request.setAttribute("message", message);
		}
		else {
			model.addAttribute("user_update",new Profile_Form());
		}
			
		return "user_profile/profile";
	}
	
	
	
//	User Current Event All Post and Events Created ( Your Posts/Events )
	@RequestMapping("/user_events/{auth_user}")
	public String User_Events (@PathVariable("auth_user") String auth_user, HttpServletRequest request) {
		request.setAttribute("title", "Your Event");		
		
		request.setAttribute("path", "/media/event_image/");
		request.setAttribute("path_user", "/media/user_image/");
		
		try {
			User auth_user_s = user_repository.findByUsername(auth_user);
			request.setAttribute("event_post", event_repository.findAllByUser_Author(Current_user.user));
			request.setAttribute("event_participate_post", event_participate_respository.findByUser(Current_user.user));
			if (!Current_user.user.getEmail().contentEquals(auth_user_s.getEmail())) {
				return "redirect:/";
			}
		} catch (Exception e) {
			return "redirect:/";
		}		
				
		if (Current_user.is_null()) {
			return "redirect:/login";
		}
		
		return "user_profile/user_event";
	}
}
