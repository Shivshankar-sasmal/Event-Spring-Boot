// Event Form Controller Package
package com.main.eventorr.web.event_controller;

// Common Imports
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestMapping;

// Database Model Imports
import com.main.eventorr.web.entity.Event;
import com.main.eventorr.web.entity_repository.DistrictRepository;
import com.main.eventorr.web.entity_repository.EventRepository;
import com.main.eventorr.web.entity_repository.UserRepository;

// Database Model Form Imports
import com.main.eventorr.web.register_login_controller.forms.Event_Creation_Form;
import com.main.eventorr.web.register_login_controller.forms.File_Upload_Helper;

// Current User
import com.main.eventorr.web.login_current_user.Current_user;



// Main  Event Form Url Controller 
@Controller
public class Event_Form_Controller {
	
	// User Database Accessor
	@Autowired
	UserRepository user_repository;
	
	// District Database Accessor
	@Autowired
	DistrictRepository district_repository;
	
	// Event Database Accessor
	@Autowired
	EventRepository event_repository;
	
	// Image File Uploader
	@Autowired
	private File_Upload_Helper uploader;
	
	
//	Event New Event Creation Url Controller
	@RequestMapping("/event_new")
	public String event_create(@Valid @ModelAttribute("event_create") Event_Creation_Form event_create, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		request.setAttribute("title", "Event Form");
		
		request.setAttribute("path", "/media/event_image/");
		request.setAttribute("district_list", district_repository.findAll());
		
		if (request.getMethod().equals("POST")) {
			ArrayList<String> array_list = new ArrayList<>();
			
			if (event_create.getEvent_poster_image() != null) {
				try {
					boolean value = uploader.uploadFileEvent(event_create.getEvent_poster_image(), Current_user.user.getUsername()+event_create.getTitle()+event_create.getEvent_type());
					
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
				System.out.println(error.getDefaultMessage().toString());
			}
			
			if (array_list.size() > 0) {
				request.setAttribute("error_list", array_list);
				return "event_views/event_form";
			}	
			else {
				DateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");
				ArrayList<String> message = new ArrayList<>();
				Event new_event = new Event();			
				
				new_event.setTitle(event_create.getTitle());
				new_event.setContent(event_create.getContent());
				new_event.setEvent_date(date_format.parse(event_create.getEvent_date()));
				new_event.setEvent_type(event_create.getEvent_type());
				new_event.setDistrict(event_create.getDistrict());
				new_event.setMax_seats(event_create.getMax_seats());
				new_event.setEvent_poster_image((Current_user.user.getUsername()+event_create.getTitle()+event_create.getEvent_type()).hashCode()+"."+event_create.getEvent_poster_image().getContentType().split("/")[1]);
				new_event.setCollege_url(event_create.getCollege_url());
				new_event.setUser_author( user_repository.findById(Current_user.user.getUser_Id()));
				
				event_repository.save(new_event);
				
				message.add("success");
				message.add("Event Created Successfully");
				request.setAttribute("message", message);
				
				return "/event_views/event_form";
			}
		}
		else {
			if (Current_user.is_null()) {
				return "redirect:/login";
			}
			model.addAttribute("event_create",new Event_Creation_Form());
			
			return "event_views/event_form";
		}		
	}
}
