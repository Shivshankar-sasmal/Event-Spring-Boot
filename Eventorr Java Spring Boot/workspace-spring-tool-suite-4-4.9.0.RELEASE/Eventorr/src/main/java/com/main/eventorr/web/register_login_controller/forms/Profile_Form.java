// Database Model Forms Package
package com.main.eventorr.web.register_login_controller.forms;

// Database Model Validation Package
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import com.main.eventorr.web.entity.District;



public class Profile_Form {	
	
	@Size(min = 3, max = 45, message = "Full Name must contain your first and last name")
	private String full_name;
	
	
	private District district;
	
	
	private MultipartFile image;
	
	
	private String something_about_you;

	
	// User Full Name
	public String getFull_name() {
		return full_name;
	}
	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}

	
	// User District
	public District getDistrict() {
		return district;
	}
	public void setDistrict(District district) {
		this.district = district;
	}

	
	// User User Image Getter and Setter
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}

	
	 // User Something About You
	public String getSomething_about_you() {
		return something_about_you;
	}
	public void setSomething_about_you(String something_about_you) {
		this.something_about_you = something_about_you;
	}
	
}
