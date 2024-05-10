// Database Model Forms Package
package com.main.eventorr.web.register_login_controller.forms;

// Database Model Validation Import
import javax.validation.constraints.Size;

import com.main.eventorr.web.entity.District;



public class Register_Form {
	
	@Size(min = 3, max = 45, message = "Full Name must contain your first and last name")
	private String full_name;

	
	@Size(min = 3, max = 20, message = "Username must contain 3 - 20 characters")
	private String username;

	
	private String email;

	
	private District district;
	
	
	@Size(min = 3, max = 80, message = "Password must contain 3 - 80 characters")
	private String password;
	
	
	// User Full Name
	public String getFull_name() {
		return full_name;
	}
	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}
	
	
	// User Username
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
	// User Email
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	// User District
	public District getDistrict() {
		return district;
	}
	public void setDistrict(District district) {
		this.district = district;
	}
	
	
	// User Password
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
