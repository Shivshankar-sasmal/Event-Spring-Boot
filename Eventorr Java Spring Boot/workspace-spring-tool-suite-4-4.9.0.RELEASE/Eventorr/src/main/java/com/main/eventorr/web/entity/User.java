// Database Model Package
package com.main.eventorr.web.entity;

// Common Imports
import java.time.LocalDateTime;

// Database Model Imports
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

// Spring Boot Import
import org.springframework.beans.factory.annotation.Autowired;



// User Database Table
@Entity
@Table(name="Users")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long user_id;
	
	
	@Size(min = 3, max = 20, message = "Username must be between 3 - 20 characters")
	@Column(nullable = false, unique = true, length=25)
	private String username = "";
	
	
	@Column(nullable = false, unique = false, length = 50)
	private String full_name = "";
	
	
	@Autowired
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "District")
	private District district;		
	
	
	@Column(nullable = false, unique = true, length = 50)
	private String email = "";
	
	
	@Column(nullable = false, unique = false, length = 200)
	private String something_about_you = "Let's Create A Better Future With Eventorr Organization !";
	
	
	@Column(nullable = false, unique = false, length = 80)
	private String image = "default.jpg";
	
	@Column(nullable = false, unique = false, length = 80)
	private String password = "";
	
	
	@Column(nullable = false, unique = false)
	private int is_active = 0;
	
	
	@Column(nullable = false, unique = false)
	private int is_superuser = 0;
	
	
	@Column(nullable = false)
	private LocalDateTime registered_date = LocalDateTime.now();

	
    // User Id
	public long getUser_Id() {
		return user_id;
	}
	public void setUser_Id(long user_id) {
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
	public String getFull_Name() {
		return full_name;
	}
	public void setFull_Name(String full_name) {
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
	public String getSomething_About_You() {
		return something_about_you;
	}
	public void setSomething_About_You(String something_about_you) {
		this.something_about_you = something_about_you;
	}
	
	
    // User District
	public District getDistrict() {
		return district;
	}
	public void setDistrict(District district) {
		this.district = district;
	}
	

    // User Image
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
    // User Password
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
    // User Is Active
	public int getIsActive() {
		return is_active;
	}
	public void setIsActive(int is_active) {
		this.is_active = is_active;
	}
	
	
    // User Is Super User
	public int getIsSuperuser() {
		return is_superuser;
	}
	public void setIsSuperuser(int is_superuser) {
		this.is_superuser = is_superuser;
	}
	
	
    // User Auto Date Time Creation
	public LocalDateTime getDate() {
		return registered_date;
	}
	
	
	@Override
	public String toString() {
		return "Username : "+username+"\t\tFull Name : "+full_name;
	}
}
