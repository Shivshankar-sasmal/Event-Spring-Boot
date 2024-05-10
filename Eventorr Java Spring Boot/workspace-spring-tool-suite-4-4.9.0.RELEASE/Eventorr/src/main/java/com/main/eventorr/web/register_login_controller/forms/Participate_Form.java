// Participate Forms Package
package com.main.eventorr.web.register_login_controller.forms;

// Database Model Validation Import
import javax.validation.constraints.Size;



public class Participate_Form {

	@Size(min = 10, max = 10, message = "Enter Your Mobile Number Without Country Code")
	private String phone_number = "";
	
	
	@Size(min = 10, max = 70, message = "Enter Full Name College")
	private String college = "";

	
	// Participate Phone Number
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	

	// Participate College Full Name
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}	
	
}
