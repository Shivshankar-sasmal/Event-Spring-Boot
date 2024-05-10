// Database Model Package
package com.main.eventorr.web.entity;

// Common Imports
import java.util.Date;

// Database Model Imports
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;

// Spring Boot Imports
import org.springframework.beans.factory.annotation.Autowired;



// Event Participate Database Table
@Entity
@Table(name="Event_Participate")
public class Event_Participate {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long participate_id;
	
	
	@Size(min = 10, max = 10, message = "Enter Your Mobile Number Without Country Code")
	@Column(nullable = false, unique = false, length=25)
	private String phone_number = "";
	
	
	@Column(nullable = false)
	private Date form_date = new Date();

	
	@Size(min = 4, max = 70, message = "Enter Full Name College")
	@Column(nullable = false, unique = false, length=25)
	private String college = "";
	
	
	@Autowired
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "User")
	private User user;		
	
	
	@Autowired
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Event")
	private Event event;

	
    // Participate Id	
	public long getParticipate_id() {
		return participate_id;
	}
	public void setParticipate_id(long participate_id) {
		this.participate_id = participate_id;
	}
	

    // Participate Phone Number
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	
	
    // Participate Form Date Creation Date And Time
	public Date getForm_date() {
		return form_date;
	}
	public void setForm_date(Date form_date) {
		this.form_date = form_date;
	}

	
    // Participate College Name
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}

	
    // Participate User
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	
    // Participate Event
	public Event getEvent() {
		return event;
	}
	public void setEvent(Event event) {
		this.event = event;
	}	
	
}
