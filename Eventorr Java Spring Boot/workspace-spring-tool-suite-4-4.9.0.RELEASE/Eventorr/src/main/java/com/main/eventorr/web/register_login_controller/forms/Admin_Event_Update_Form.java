// Database Model Forms Package
package com.main.eventorr.web.register_login_controller.forms;

// Database Model Validation Imports
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;



public class Admin_Event_Update_Form {
	
	private long event_id;
	
	
	@Size(min = 3, max = 75, message = "Title must be between 3 - 75 characters")
	private String title;
	
	
	@Size(min = 3, max = 400, message = "Content must be between 3 - 400 characters")
	private String content;

	
	private int max_seats;
	
	
	MultipartFile event_poster_image;
	
	
	private String college_url;

	
	private String event_type; 
	
	
	// Event Type
	public String getEvent_type() {
		return event_type;
	}
	public void setEvent_type(String event_type) {
		this.event_type = event_type;
	}
	
	
	// College Url
	public String getCollege_url() {
		return college_url;
	}
	public void setCollege_url(String college_url) {
		this.college_url = college_url;
	}
	
	
	// Event Id
	public long getEvent_id() {
		return event_id;
	}
	public void setEvent_id(long event_id) {
		this.event_id = event_id;
	}

	
	//	Event Title
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

	
	// Event Max Seats
	public int getMax_seats() {
		return max_seats;
	}
	public void setMax_seats(int max_seats) {
		this.max_seats = max_seats;
	}

	
	// Event Image Getter and Setter
	public MultipartFile getEvent_poster_image() {
		return event_poster_image;
	}
	public void setEvent_poster_image(MultipartFile event_poster_image) {
		this.event_poster_image = event_poster_image;
	}
}
