// Admin Command Control Package
package com.main.eventorr.web.admin_controller;

// Common Imports
import java.util.ArrayList;

// Spring Boot Import
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

// Entity Of Database Models
import com.main.eventorr.web.entity.District;
import com.main.eventorr.web.entity.Event;
import com.main.eventorr.web.entity.Event_Participate;
import com.main.eventorr.web.entity.User;

// Datebase Repository For Accessing Objects
import com.main.eventorr.web.entity_repository.DistrictRepository;
import com.main.eventorr.web.entity_repository.EventRepository;
import com.main.eventorr.web.entity_repository.Event_ParticipateRepository;
import com.main.eventorr.web.entity_repository.UserRepository;
import com.main.eventorr.web.login_current_user.Current_user;

// Model Object Creation Forms
import com.main.eventorr.web.register_login_controller.forms.Admin_District_Update_Form;
import com.main.eventorr.web.register_login_controller.forms.Admin_Event_Update_Form;
import com.main.eventorr.web.register_login_controller.forms.Admin_User_Update_Form;

// Image Uploader Helper
import com.main.eventorr.web.register_login_controller.forms.File_Upload_Helper;


// Admin Url Interface Controller For Admin Work Purpose
@Controller
public class Admin_Controller {
	
    //	 User Database Accessor
	@Autowired
	UserRepository user_repository;
	
    //	 District Database Accessor
	@Autowired
	DistrictRepository district_repository;
	
    //	 Event Database Accessor
	@Autowired
	EventRepository event_repository;
	@Autowired
	
    // Event Participate Database Accessor
	Event_ParticipateRepository event_participate_respository;
	
     // Image File Uploading Heler
	@Autowired
	private File_Upload_Helper uploader;
	
	
    //	Main Admin Url Controller
	@RequestMapping("/admin") 
	public String admin_main(HttpServletRequest request) {
		request.setAttribute("title", "Admin");
		
		if (Current_user.is_null()) {
			return "redirect:/login";
		}
		
		request.setAttribute("superusers", user_repository.findAllIs_Superuser());		
		request.setAttribute("user_table_size", user_repository.findAll().size());
		request.setAttribute("event_table_size", event_repository.findAll().size());
		request.setAttribute("district_table_size", district_repository.findAll().size());
		request.setAttribute("event_participate_table_size", event_participate_respository.findAll().size());
				
		if (Current_user.user.getIsSuperuser() == 1) {
			return "admin_views/admin_dashboard";
		}
		return "redirect:/";
	}
	
	
//	 Admin User Update Url Controller
	@RequestMapping("/admin/user/update/{user_id}")
	public String admin_user_update(@PathVariable("user_id") long user_id, @Valid @ModelAttribute("user_update") Admin_User_Update_Form user_update, BindingResult result, Model model, HttpServletRequest request) {
		request.setAttribute("title", "Admin User Update");
		
		User user_profile = user_repository.findById(user_id);
		request.setAttribute("district_list", district_repository.findAll());
		request.setAttribute("user_profile", user_profile);
		
		if (request.getMethod().equals("POST")) {
			ArrayList<String> array_list = new ArrayList<>();	
			
			for (FieldError error : result.getFieldErrors()) {
				array_list.add(error.getDefaultMessage().toString());
			}
			
			if (array_list.size() > 0) {
				request.setAttribute("error_list", array_list);
				return "admin_views/admin_user_update";
			}	
			
			user_profile.setUser_Id(user_update.getUser_id());
			user_profile.setUsername(user_update.getUsername());
			user_profile.setFull_Name(user_update.getFull_name());
			user_profile.setEmail(user_update.getEmail());
			
			if (user_update.getDistrict() != null) {
				user_profile.setDistrict(user_update.getDistrict());
			}
			
			user_profile.setSomething_About_You(user_update.getSomething_about_you());
			user_profile.setPassword(Eventorr_Encryption.encrypt(user_update.getPassword()));
			
			if (! user_update.getImage_file().isEmpty()) {
				try {
					boolean value = uploader.uploadFile(user_update.getImage_file(), user_update.getUsername());
					if (!value) {
						array_list.add("Image Not Uploaded");
					}
				}
				catch(Exception error) {
					error.printStackTrace();
				}
				user_profile.setImage(user_update.getUsername().hashCode()+"."+user_update.getImage_file().getContentType().split("/")[1]);
			}
			
			user_profile.setIsSuperuser(user_update.getIs_superuser());
			user_profile.setIsActive(user_update.getIs_active());
			
			user_repository.saveAndFlush(user_profile);
			
			return "redirect:/admin/user_table";
		}
		else {
			if (Current_user.is_null()) {
				return "redirect:/login";
			}
			
			if (user_repository.findById(user_id) == null || Current_user.user.getIsSuperuser() != 1) {
				return "redirect:/";
			}
			
			request.setAttribute("user_update_password", Eventorr_Encryption.decrypt(user_profile.getPassword()));
			model.addAttribute("user_update", new Admin_User_Update_Form());
		}
		
		return "admin_views/admin_user_update";
	}
	
	
	
// Admin User Delete Url Controller	
	@RequestMapping("/admin/user/delete/{user_id}")
	public String admin_user_delete(@PathVariable("user_id") long user_id) {
		if (Current_user.is_null()) {
			return "redirect:/login";
		}
		
		if (user_repository.findById(user_id) == null || Current_user.user.getIsSuperuser() != 1) {
			return "redirect:/";
		}
		else {	
			for (Event i : event_repository.findAllByUser_Author(user_repository.findById(user_id))) {
				for (Event_Participate j : event_participate_respository.findByEvent(i)) {
					event_participate_respository.delete(j);
				}
				event_repository.delete(i);
			}
			
			for (Event_Participate i : event_participate_respository.findByUser(user_repository.findById(user_id))) {
				event_participate_respository.delete(i);
			}		
			
			user_repository.deleteById(user_id);
			
			return "redirect:/admin/user_table";
		}		
	}
	
	
	
//  Admin User Add Url Controller
	@RequestMapping("/admin/user/add")
	public String admin_user_add(@Valid @ModelAttribute("user_update") Admin_User_Update_Form user_update, BindingResult result, Model model, HttpServletRequest request) {
		request.setAttribute("title", "Admin User Add");
		
		request.setAttribute("district_list", district_repository.findAll());
		
		if (request.getMethod().equals("POST")) {
			ArrayList<String> array_list = new ArrayList<>();		
			
			for (FieldError error : result.getFieldErrors()) {
				array_list.add(error.getDefaultMessage().toString());
			}
			
			if (array_list.size() > 0) {
				request.setAttribute("error_list", array_list);
				return "admin_views/admin_user_update";
			}	
			
			User user = new User();
			user.setUsername(user_update.getUsername());
			user.setFull_Name(user_update.getFull_name());
			user.setEmail(user_update.getEmail());
			
			if (user_update.getDistrict() != null) {
				user.setDistrict(user_update.getDistrict());
			}
			
			user.setSomething_About_You(user_update.getSomething_about_you());
			user.setPassword(Eventorr_Encryption.encrypt(user_update.getPassword()));
			
			if (! user_update.getImage_file().isEmpty()) {
				try {
					boolean value = uploader.uploadFile(user_update.getImage_file(), user_update.getUsername());
					if (!value) {
						array_list.add("Image Not Uploaded");
					}
				}
				catch(Exception error) {
					error.printStackTrace();
				}
				
				user.setImage(user_update.getUsername().hashCode()+"."+user_update.getImage_file().getContentType().split("/")[1]);
			}
			
			user.setIsSuperuser(user_update.getIs_superuser());
			user.setIsActive(user_update.getIs_active());
			
			user_repository.saveAndFlush(user);
			
			return "redirect:/admin/user_table";
		}
		else {
			if (Current_user.is_null()) {
				return "redirect:/login";
			}
			if (Current_user.user.getIsSuperuser() != 1) {
				return "redirect:/";
			}
			model.addAttribute("user_update", new Admin_User_Update_Form());
		}
		
		return "admin_views/admin_user_update";
	}
	
	
//	 Admin District Update Url Controller
	@RequestMapping("/admin/district/update/{district_id}")
	public String admin_district_update(@PathVariable("district_id") long district_id, @Valid @ModelAttribute("district_update") Admin_District_Update_Form district_update, BindingResult result, Model model, HttpServletRequest request) {
		request.setAttribute("title", "Admin District Update");
		
		District district_record = district_repository.findById(district_id);
		request.setAttribute("district_list", district_repository.findById(district_id));
		request.setAttribute("district_record", district_record);
		
		if (request.getMethod().equals("POST")) {
			ArrayList<String> array_list = new ArrayList<>();	
			
			for (FieldError error : result.getFieldErrors()) {
				array_list.add(error.getDefaultMessage().toString());
			}
			
			if (array_list.size() > 0) {
				request.setAttribute("error_list", array_list);
				return "admin_views/admin_district_update";
			}		
			
			district_record.setDistrict(district_update.getDistrict());
			
			district_repository.save(district_record);
			
			return "redirect:/admin/district_table";
		}
		else {
			if (Current_user.is_null()) {
				return "redirect:/login";
			}
			
			if (district_repository.findById(district_id) == null || Current_user.user.getIsSuperuser() != 1) {
				return "redirect:/";
			}
			
			model.addAttribute("district_update", new Admin_District_Update_Form());
		}
		
		return "admin_views/admin_district_update";
	}
	
	
	
// Admin District Delete Url Controller
	@RequestMapping("/admin/district/delete/{district_id}")
	public String admin_district_delete(@PathVariable("district_id") long district_id) {
		if (Current_user.is_null()) {
			return "redirect:/login";
		}
		
		if (district_repository.findById(district_id) == null || Current_user.user.getIsSuperuser() != 1) {
			return "redirect:/";
		} 
		else {			
			try {
				
				for (User i : user_repository.findByDistrict(district_repository.findById(district_id))) {
					for (Event j : event_repository.findAllByUser_Author(i)) {
						for (Event_Participate k : event_participate_respository.findByEvent(j)) {
							event_participate_respository.delete(k);
						}	
						event_repository.delete(j);
					}
					user_repository.delete(i);
				}
				
				district_repository.deleteById(district_id);
				
				return "redirect:/admin/district_table";
			} 
			catch(Exception e ) {
				
				return "redirect:/";
			}
		}
	}
	
	
	
// Admin District Adding Url Controller
	@RequestMapping("/admin/district/add")
	public String admin_district_add(@Valid @ModelAttribute("district_update") Admin_District_Update_Form district_update, BindingResult result, Model model, HttpServletRequest request) {
		request.setAttribute("title", "Admin District Add");
		
		request.setAttribute("district_list", district_repository.findAll());
		
		if (request.getMethod().equals("POST")) {
			ArrayList<String> array_list = new ArrayList<>();		
			
			for (FieldError error : result.getFieldErrors()) {
				array_list.add(error.getDefaultMessage().toString());
			}
			
			if (array_list.size() > 0) {
				request.setAttribute("error_list", array_list);
				return "admin_views/admin_user_update";
			}		
			
			try {
				District district = new District();
				district.setDistrict(district_update.getDistrict());
				
				district_repository.saveAndFlush(district);
				
				return "redirect:/admin/district_table";
			} catch (Exception e) {
				
				return "redirect:/admin";
			}
		}
		else {
			if (Current_user.is_null()) {
				return "redirect:/login";
			}
			
			if (Current_user.user.getIsSuperuser() != 1) {
				return "redirect:/";
			}
			
			model.addAttribute("district_update", new Admin_District_Update_Form());
		}
		return "admin_views/admin_district_update";
	}
	
	
	
// Admin Event Update Url Controller	
	@RequestMapping("/admin/event/update/{event_id}")
	public String admin_event_update(@PathVariable("event_id") long event_id, @Valid @ModelAttribute("event_update") Admin_Event_Update_Form event_update, BindingResult result, Model model, HttpServletRequest request) {
		request.setAttribute("title", "Admin Event Update");
		
		Event event = event_repository.findByEvent_Id(event_id).get(0);
		request.setAttribute("district_list", district_repository.findAll());
		request.setAttribute("user_list", user_repository.findAll());
		request.setAttribute("event", event);
		
		if (request.getMethod().equals("POST")) {
			ArrayList<String> array_list = new ArrayList<>();	
			
			Event event_s = event_repository.findByEvent_Id(event_id).get(0);			
			
			if (event_update.getEvent_poster_image() != null) {
				try {
					boolean value = uploader.uploadFileEvent(event_update.getEvent_poster_image(), Current_user.user.getUsername()+event_update.getTitle()+event_update.getEvent_type());
					
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
				return "admin_views/admin_event_update";
			}			
			
			event_s.setTitle(event_update.getTitle());
			event_s.setContent(event_update.getContent());
			event_s.setMax_seats(event_update.getMax_seats());
			event_s.setCollege_url(event_update.getCollege_url());
			event_s.setEvent_poster_image((Current_user.user.getUsername()+event_update.getTitle()+event_update.getEvent_type()).hashCode()+"."+event_update.getEvent_poster_image().getContentType().split("/")[1]);			
			
			event_repository.saveAndFlush(event_s);
			
			return "redirect:/admin/event_table";
		}
		else {
			if (Current_user.is_null()) {
				return "redirect:/login";
			}
			
			if (Current_user.user.getIsSuperuser() != 1) {
				return "redirect:/";
			}
			
			model.addAttribute("event_update", new Admin_Event_Update_Form());
		}
		
		return "admin_views/admin_event_update";
	}
	
	
	
// Admin Event Delete Url Controller
	@RequestMapping("/admin/event/delete/{event_id}")
	public String admin_event_delete(@PathVariable("event_id") long event_id) {
		if (Current_user.is_null()) {
			return "redirect:/login";
		}
		
		if (event_repository.findById(event_id) == null || Current_user.user.getIsSuperuser() != 1) {
			return "redirect:/";
		} 
		else {	
			for(Event_Participate i : event_participate_respository.findByEvent(event_repository.findByEvent_Id(event_id).get(0))) {
				event_participate_respository.delete(i);
			}
			
			event_repository.delete(event_repository.findByEvent_Id(event_id).get(0));
			
			return "redirect:/admin/event_table";
		}
	}
	
	
	
// Admin Event Participate Form Delete Url Controller
	@RequestMapping("admin/participate_form_delete/{form_id}")
	public String admin_delete_form_participate_event(@PathVariable("form_id") long form_id, HttpServletRequest request) {
		request.setAttribute("title", " Admin Delete Event");
		
		try {
			
			if (Current_user.is_null()) {
				return "redirect:/login";
			}
			
			if (Current_user.user.getIsSuperuser() != 1) {
				return "redirect:/";
			}
			
			event_participate_respository.deleteById(form_id);
			
			return "redirect:/admin/event_participate_table";
		} 
		catch (Exception e) {
			
			return "redirect:/";
		}					
	}
	
	
	
	// Admin User Table Url Controller
	@RequestMapping("/admin/user_table") 
	public String admin_user_table(HttpServletRequest request) {
		request.setAttribute("title", "User Table");
		
		if (Current_user.is_null()) {
			return "redirect:/login";
		}		
		
		// User Search
		if (request.getParameter("search_user") == null || request.getParameter("search_user").contentEquals("")) {
			request.setAttribute("user_table", user_repository.findAll());
		}
		else {
			request.setAttribute("user_table", user_repository.findBySearchAdminUser(request.getParameter("search_user").strip()));
			request.setAttribute("search_user", request.getParameter("search_user").strip());
		}
		
		
		if (Current_user.user.getIsSuperuser() == 1) {
			return "admin_views/admin_user_table";
		}
		return "redirect:/";
	}
	
	
	
	// Admin District Table Url Controller
		@RequestMapping("/admin/district_table") 
		public String admin_district_table(HttpServletRequest request) {
			request.setAttribute("title", "District Table");
			
			if (Current_user.is_null()) {
				return "redirect:/login";
			}
			
			
			// District Search
			if (request.getParameter("search_district") == null || request.getParameter("search_district").contentEquals("")) {
				request.setAttribute("district_table", district_repository.findAll());
			}
			else {
				request.setAttribute("district_table", district_repository.findBySearchAdminDistrict(request.getParameter("search_district").strip()));
				request.setAttribute("search_district", request.getParameter("search_district").strip());
			}		
			
			
			if (Current_user.user.getIsSuperuser() == 1) {
				return "admin_views/admin_district_table";
			}
			return "redirect:/";
		}
		
		
		
	// Admin Event Table Url Controller
		@RequestMapping("/admin/event_table") 
		public String admin_event_table(HttpServletRequest request) {
			request.setAttribute("title", "Event Table");
			
			if (Current_user.is_null()) {
				return "redirect:/login";
			}
			
			
			// Event Search
			if (request.getParameter("search_event") == null || request.getParameter("search_event").contentEquals("")) {
				request.setAttribute("event_table", event_repository.findAll());
			}
			else {
				request.setAttribute("event_table", event_repository.findBySearchAdminEvent(request.getParameter("search_event").strip()));
				request.setAttribute("search_event", request.getParameter("search_event").strip());
			}
			
			
			if (Current_user.user.getIsSuperuser() == 1) {
				return "admin_views/admin_event_table";
			}
			return "redirect:/";
		}	
		
		
		
		// Admin Event Participate Table Url Controller
		@RequestMapping("/admin/event_participate_table") 
		public String admin_event_participate_table(HttpServletRequest request) {
			request.setAttribute("title", "Event Participate Table");
			
			if (Current_user.is_null()) {
				return "redirect:/login";
			}
			
			
			// Event Participate Search
			if (request.getParameter("search_event_participate") == null || request.getParameter("search_event_participate").contentEquals("")) {
				request.setAttribute("event_participate_table", event_participate_respository.findAll());
			}
			else {
				request.setAttribute("event_participate_table", event_participate_respository.findBySearchAdminEvent_Participate(request.getParameter("search_event_participate").strip()));
				request.setAttribute("search_event_participate", request.getParameter("search_event_participate").strip());
			}	

			
			
			if (Current_user.user.getIsSuperuser() == 1) {
				return "admin_views/admin_event_participate_table";
			}
			return "redirect:/";
		}	
}
