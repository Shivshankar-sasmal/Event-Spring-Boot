// Login Forms Package
package com.main.eventorr.web.register_login_controller.forms;

// Database Model Validation Import
import javax.validation.constraints.Size;



public class Login_Form {
	
	@Size(min = 3, max = 20, message = "Username must contain 3 - 20 characters")
	private String username;
	
	
	private String password;

	
	// User Username
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	
	// User Password
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
