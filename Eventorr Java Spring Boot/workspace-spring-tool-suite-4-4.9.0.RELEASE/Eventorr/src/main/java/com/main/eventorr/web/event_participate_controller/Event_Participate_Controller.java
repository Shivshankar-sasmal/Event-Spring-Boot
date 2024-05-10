// Event Participate Controller Package
package com.main.eventorr.web.event_participate_controller;

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

// Datbase Model Imports
import com.main.eventorr.web.entity.Event_Participate;

// Database Model Repository Imports
import com.main.eventorr.web.entity_repository.EventRepository;
import com.main.eventorr.web.entity_repository.Event_ParticipateRepository;
import com.main.eventorr.web.entity_repository.UserRepository;

// Event Participation Form Imports
import com.main.eventorr.web.register_login_controller.forms.Participate_Form;

// Current User
import com.main.eventorr.web.login_current_user.Current_user;




// Main Event Participate Url Controller
@Controller
public class Event_Participate_Controller {
	
	// User Database Accessor
	@Autowired
	UserRepository user_repository;
	
	//Event Database Accessor
	@Autowired
	EventRepository event_repository;
	
	// Event Participate Database Accessor
	@Autowired
	Event_ParticipateRepository event_participate_repository;
	
	
//	Event Participate Url Controller
	@RequestMapping("/participate/{event_id}")
	public String participate_event(@PathVariable("event_id") long event_id, @Valid @ModelAttribute("participate_form") Participate_Form participate_form, BindingResult result ,Model model, HttpServletRequest request) {
		request.setAttribute("title", "Participate Event");
		
		try {
			request.setAttribute("event", event_repository.findByEvent_Id(event_id).get(0));
			
			if (Current_user.is_null()) {
				return "redirect:/login";
			}
		} 
		catch (Exception e) {
			return "redirect:/";
		}
		
		if (request.getMethod().equals("POST")) {
			ArrayList<String> array_list = new ArrayList<>();
			ArrayList<String> message = new ArrayList<>();
			
			for (FieldError error : result.getFieldErrors()) {
				array_list.add(error.getDefaultMessage().toString());
			}		
			
			if (array_list.size() > 0) {
				request.setAttribute("error_list", array_list);
				return "/event_partcipate_views/participate_event";
			}
			
			if (event_participate_repository.findByEvent(event_repository.findByEvent_Id(event_id).get(0)).size() == event_repository.findByEvent_Id(event_id).get(0).getMax_seats()) {
				message.add("primary");
				message.add("Event Is Full");
				request.setAttribute("message", message);
				
				return "/event_partcipate_views/participate_event";
			}			
						
			if (event_participate_repository.existsByUserAndEvent(Current_user.user, event_repository.findByEvent_Id(event_id).get(0))) {
				message.add("primary");
				message.add("You Have Already Participated On The Event");
				request.setAttribute("message", message);
				
				return "/event_partcipate_views/participate_event";
			}
			
			Event_Participate new_event_participator = new Event_Participate();
			
			new_event_participator.setUser(Current_user.user);
			new_event_participator.setEvent(event_repository.findByEvent_Id(event_id).get(0));
			new_event_participator.setPhone_number(participate_form.getPhone_number());
			new_event_participator.setCollege(participate_form.getCollege());
			
			event_participate_repository.saveAndFlush(new_event_participator);		
			
			return "redirect:/";
		}
		else {
			model.addAttribute("participate_form", new Participate_Form());
			
			return "/event_partcipate_views/participate_event";
		}
	}
	
	
	
//	Event Participate Deletetion Url Controller
	@RequestMapping("/participate_form_delete/{event_id}/{form_id}")
	public String delete_form_participate_event(@PathVariable("event_id") long event_id,@PathVariable("form_id") long form_id, HttpServletRequest request) {
		request.setAttribute("title", "Delete Form");
		
		try {
			if (! Current_user.user.getEmail().contentEquals(event_repository.findByEvent_Id(event_id).get(0).getUser_author().getEmail())) {
				return "redirect:/";
			}
			
			event_repository.findByEvent_Id(event_id).get(0);
			event_participate_repository.deleteById(form_id);
			
			String url = "redirect:/detail/"+event_id;
			return url;
		} 
		catch (Exception e) {
			return "redirect:/";
		}					
	}
}
