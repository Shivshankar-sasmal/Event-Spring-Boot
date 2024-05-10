// Database Model Forms Package
package com.main.eventorr.web.register_login_controller.forms;

// Database Model Validation Imports
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import com.main.eventorr.web.entity.District;




public class Event_Creation_Form {

	@Size(min = 3, max = 75, message = "Title must be between 3 - 75 characters")
	private String title = "";

	
	@Size(min = 3, max = 400, message = "Content must be between 3 - 400 characters")
	private String content = "";
	
	
	private String event_date;
	
	
	private MultipartFile event_poster_image;
	
	
	private District district;
	
	
	private int max_seats = 0;
	
	
	@Size(min = 3, max = 30, message = "Event Type must be between 3 - 30 characters")
	private String event_type = "";	
	
	
	private String college_url = null;
	

	
	// Event Title
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	
	// Event Content
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	

	// Event Event Date
	public String getEvent_date() {
		return event_date;
	}
	public void setEvent_date(String event_date) {
		this.event_date = event_date;
	}

	
	// Event Image Getter and Setter
	public MultipartFile getEvent_poster_image() {
		return event_poster_image;
	}
	public void setEvent_poster_image(MultipartFile event_poster_image) {
		this.event_poster_image = event_poster_image;
	}

	
	// Event District
	public District getDistrict() {
		return district;
	}
	public void setDistrict(District district) {
		this.district = district;
	}

	
	// Event Max Seats
	public int getMax_seats() {
		return max_seats;
	}
	public void setMax_seats(int max_seats) {
		this.max_seats = max_seats;
	}

	
	// Event Event Type
	public String getEvent_type() {
		return event_type;
	}
	public void setEvent_type(String event_type) {
		this.event_type = event_type;
	}

	
	// Event College Url
	public String getCollege_url() {
		return college_url;
	}
	public void setCollege_url(String college_url) {
		this.college_url = college_url;
	}
	
}
