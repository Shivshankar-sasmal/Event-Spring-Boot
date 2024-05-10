// Datebase Model Package
package com.main.eventorr.web.entity;

// Common Imports
import java.time.LocalDateTime;
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



// Event Database Table
@Entity
@Table(name="Event")
public class Event {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long event_id;
	
	
	@Size(min = 3, max = 75, message = "Title must be between 3 - 75 characters")
	@Column(nullable = false, unique = false, length=25)
	private String title = "";
	
	
	@Size(min = 3, max = 400, message = "Content must be between 3 - 400 characters")
	@Column(nullable = false, unique = false, length=25)
	private String content = "";
	
	
	@Column(nullable = false)
	private LocalDateTime date_posted = LocalDateTime.now();
	
	
	@Autowired
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "User")
	private User user_author;		
	
	
	@Column(nullable = false)
	private Date event_date;

	
	@Column(nullable = false, unique = false, length = 100)
	private String event_poster_image = "default_event.png";
	
	
	@Autowired
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "District")
	private District district;	
	
	
	@Column(nullable = false, unique = false)
	private int max_seats = 0;
	
	
	@Size(min = 3, max = 30, message = "Event Type must be between 3 - 30 characters")
	@Column(nullable = false, unique = false, length=25)
	private String event_type = "";	
	
	
	@Column(nullable = true, unique = false )
	private String college_url = null;
	
	
    // Event Id	
	public long getEvent_id() {
		return event_id;
	}
	public void setEvent_id(long event_id) {
		this.event_id = event_id;
	}


    // Event Title
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

	
    // Event Date Posted Date Time Creation
	public LocalDateTime getDate_posted() {
		return date_posted;
	}
	public void setDate_posted(LocalDateTime date_posted) {
		this.date_posted = date_posted;
	}


    // Event User Author Who Created The Event 
	public User getUser_author() {
		return user_author;
	}
	public void setUser_author(User user_author) {
		this.user_author = user_author;
	}


    // Event Day Of The Event
	public Date getEvent_date() {
		return event_date;
	}
	public void setEvent_date(Date event_date) {
		this.event_date = event_date;
	}


    // Event Event Image	
	public String getEvent_poster_image() {
		return event_poster_image;
	}
	public void setEvent_poster_image(String event_poster_image) {
		this.event_poster_image = event_poster_image;
	}


    // Event District
	public District getDistrict() {
		return district;
	}
	public void setDistrict(District district) {
		this.district = district;
	}


    // Event Max Seats
	public int getMax_seats() {
		return max_seats;
	}
	public void setMax_seats(int max_seats) {
		this.max_seats = max_seats;
	}

	
    // Event Event Type
	public String getEvent_type() {
		return event_type;
	}
	public void setEvent_type(String event_type) {
		this.event_type = event_type;
	}

	
    // Event College Url
	public String getCollege_url() {
		return college_url;
	}
	public void setCollege_url(String college_url) {
		this.college_url = college_url;
	}


	@Override
	public String toString() {
		return "Event Id : "+event_id+"\t\tEvent Content : "+content;
	}
}
