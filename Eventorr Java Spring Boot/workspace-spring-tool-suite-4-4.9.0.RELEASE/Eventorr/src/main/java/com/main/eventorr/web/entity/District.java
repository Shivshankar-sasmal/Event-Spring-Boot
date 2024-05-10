// Database Model Package
package com.main.eventorr.web.entity;

// Database Model Imports
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



// District Database Table
@Entity
@Table(name="Districts")
public class District {	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long district_id;
	
	
	@Column(nullable = false, unique = true, length = 50)
	private String district;

	
	//District Identity
	public long getDistrict_Id() {
		return district_id;
	}
	public void setDistrict_Id(long district_id) {
		this.district_id = district_id;
	}
	
	
	//District Name	
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	
	
	@Override
	public String toString() {
		return district.toString();
	}
}
