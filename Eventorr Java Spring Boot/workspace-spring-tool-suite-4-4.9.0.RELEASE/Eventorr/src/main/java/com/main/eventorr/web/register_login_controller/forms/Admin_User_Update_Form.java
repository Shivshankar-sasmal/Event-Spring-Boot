// Database Model Forms Package
package com.main.eventorr.web.register_login_controller.forms;

// Database Model Validation Imports
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import com.main.eventorr.web.entity.District;




public class Admin_User_Update_Form {

	private long user_id;

	
	@Size(min = 3, max = 20, message = "Username must be between 3 - 20 characters")
	private String username;
	
	
	@Size(min = 3, max = 45, message = "Full Name must contain your first and last name")
	private String full_name;
	
	
	private String email;
	
	
	private String something_about_you;
	
	
	private District district;
	
	
	private String password;
	
	
	private MultipartFile image_file;
	
	
	private int is_active = 0;
	
	
	private int is_superuser = 0;
	
	
	// User User Id
	public long getUser_id() {
		return user_id;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	
	
	// User Username
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
	// User Full Name
	public String getFull_name() {
		return full_name;
	}
	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}
	
	
	// User Email
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	// User Something About You
	public String getSomething_about_you() {
		return something_about_you;
	}
	public void setSomething_about_you(String something_about_you) {
		this.something_about_you = something_about_you;
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
	
	
	// Multipart User Image Getter and Setter
	public MultipartFile getImage_file() {
		return image_file;
	}
	public void setImage_file(MultipartFile image_file) {
		this.image_file = image_file;
	}
	
	
	// User Is Active
	public int getIs_active() {
		return is_active;
	}
	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}
	
	
	// User Is SuperUser
	public int getIs_superuser() {
		return is_superuser;
	}
	public void setIs_superuser(int is_superuser) {
		this.is_superuser = is_superuser;
	}
}
