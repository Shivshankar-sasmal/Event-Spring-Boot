// Database Model Forms Package
package com.main.eventorr.web.register_login_controller.forms;

// Database Model Validation Imports
import javax.validation.constraints.Size;



public class Admin_District_Update_Form {
	
	private long district_id;
	
	
	@Size(min = 3, max = 30, message = "Distric must be between 3 - 30 characters")
	private String district;

	
	// District Id
	public long getDistrict_id() {
		return district_id;
	}
	public void setDistrict_id(long district_id) {
		this.district_id = district_id;
	}

	
	// District District Name
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	
}
