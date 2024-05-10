// Event Creation Updation Deletion Package
package com.main.eventorr.web.event_controller;

// Common Imports
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

// Spring Boot Import
import org.springframework.beans.factory.annotation.Autowired;

//Java Servlet Request and Validation Imports
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

// Datebase Model Imports
import com.main.eventorr.web.entity.Event;
import com.main.eventorr.web.entity.Event_Participate;

// Datebase Model Repository Imports
import com.main.eventorr.web.entity_repository.DistrictRepository;
import com.main.eventorr.web.entity_repository.EventRepository;
import com.main.eventorr.web.entity_repository.Event_ParticipateRepository;

// Database Forms
import com.main.eventorr.web.register_login_controller.forms.Event_Creation_Form;
import com.main.eventorr.web.register_login_controller.forms.File_Upload_Helper;

// Current User
import com.main.eventorr.web.login_current_user.Current_user;



// Main Event Url Controller
@Controller
public class Event_Controller {	
	
	// Event Database Model Accessor
	@Autowired
	EventRepository event_repository;

	// District Database Model Accessor
	@Autowired
	DistrictRepository district_repository;
	
	@Autowired
	// Event Participate Model Accessor
	Event_ParticipateRepository event_participate_respository;
	
	// Image File Uploader
	@Autowired
	private File_Upload_Helper uploader;
	
	
// Home Main 
	@RequestMapping("/")
	public String home(HttpServletRequest request) {
		request.setAttribute("title", "Home");
		
		request.setAttribute("path", "/media/event_image/");
		request.setAttribute("path_user", "/media/user_image/");
		
		if (request.getParameter("search") == null || request.getParameter("search").contentEquals("")) {
			request.setAttribute("event_post", event_repository.findAllByEventGreaterThanToday(new Date()));
		}
		else {
			request.setAttribute("event_post", event_repository.findBySearch(request.getParameter("search").strip()));
			request.setAttribute("search", request.getParameter("search").strip());
		}		
		
		if (Current_user.is_null()) {
			return "redirect:/login";
		}
		
		return "/event_views/home";
	}
	

	
//	 Event Detail Url Controller
	@RequestMapping("/detail/{event_id}")
	public String detailed_event(@PathVariable("event_id") long event_id, HttpServletRequest request) {
		request.setAttribute("title", "Detailed Event");
		
		request.setAttribute("path", "/media/event_image/");
		request.setAttribute("path_user", "/media/user_image/");
		
		try {
			request.setAttribute("event", event_repository.findByEvent_Id(event_id).get(0));
			request.setAttribute("participate_list", event_participate_respository.findByEventOrderByUserAsc(event_repository.findByEvent_Id(event_id).get(0)));
		} 
		catch (Exception e) {
			return "redirect:/";
		}
		
		if (Current_user.is_null()) {
			return "redirect:/login";
		}
		
		return "/event_views/detail_event";
	}
	
	
	
// Event Update Url Controller	
	@RequestMapping("/update/{event_id}")
	public String update_event(@PathVariable("event_id") long event_id, @Valid @ModelAttribute("event_create") Event_Creation_Form event_create, BindingResult result, Model model, HttpServletRequest request) throws Exception {
		request.setAttribute("title", "Update Event");
		
		request.setAttribute("path", "/media/event_image/");
		request.setAttribute("path_user", "/media/user_image/");
		request.setAttribute("district_list", district_repository.findAll());
			
		try {
			request.setAttribute("event", event_repository.findByEvent_Id(event_id).get(0));
			
			if (! Current_user.user.getEmail().contentEquals(event_repository.findByEvent_Id(event_id).get(0).getUser_author().getEmail())) {
				return "redirect:/";
			}
		} 
		catch (Exception e) {
			return "redirect:/";
		}		
				
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
					System.out.println("Something We");
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
				ArrayList<String> message = new ArrayList<>();
				
				message.add("success");
				message.add("Event Updated Successfully");
				
				DateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");
				
				try {
					Event new_event = event_repository.findByEvent_Id(event_id).get(0);
					
					new_event.setTitle(event_create.getTitle());
					new_event.setContent(event_create.getContent());
					new_event.setEvent_date(date_format.parse(event_create.getEvent_date()));
					new_event.setEvent_type(event_create.getEvent_type());
					new_event.setDistrict(event_create.getDistrict());
					new_event.setMax_seats(event_create.getMax_seats());
					new_event.setEvent_poster_image((Current_user.user.getUsername()+event_create.getTitle()+event_create.getEvent_type()).hashCode()+"."+event_create.getEvent_poster_image().getContentType().split("/")[1]);
					new_event.setCollege_url(event_create.getCollege_url());
					
					event_repository.save(new_event);
					request.setAttribute("message", message);
					
					String url = "redirect:/detail/"+String.valueOf(new_event.getEvent_id());
					return url;
				} 
				catch (Exception e) {
					return "redirect:/";
				}		
			}
		}
		else {
			if (Current_user.is_null()) {
				return "redirect:/login";
			}
		}
		return "/event_views/update_event";
	}
	
	
	
//	 Event Delete Url Controller
	@RequestMapping("/delete/{event_id}")
	public String delete_event(@PathVariable("event_id") long event_id, HttpServletRequest request) {
		request.setAttribute("title", "Delete Event");
		
		try {
			request.setAttribute("event", event_repository.findByEvent_Id(event_id).get(0));
			
			if (! Current_user.user.getEmail().contentEquals(event_repository.findByEvent_Id(event_id).get(0).getUser_author().getEmail())) {
				return "redirect:/";
			}
		} 
		catch (Exception e) {
			return "redirect:/";
		}		
		
		for(Event_Participate i : event_participate_respository.findByEvent(event_repository.findByEvent_Id(event_id).get(0))) {
			event_participate_respository.delete(i);
		}
		
		event_repository.delete(event_repository.findByEvent_Id(event_id).get(0));
				
		return "redirect:/";
	}
}
