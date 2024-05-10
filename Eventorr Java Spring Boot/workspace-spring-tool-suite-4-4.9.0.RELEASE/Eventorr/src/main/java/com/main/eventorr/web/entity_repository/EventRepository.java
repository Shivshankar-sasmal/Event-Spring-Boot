// Event Repository Package
package com.main.eventorr.web.entity_repository;

// Common Imports
import java.util.Date;
import java.util.HashSet;
import java.util.List;

// Spring Boot Imports
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

// Database Model
import com.main.eventorr.web.entity.Event;
import com.main.eventorr.web.entity.User;



public interface EventRepository extends JpaRepository<Event, Long> {
	@Query("SELECT event FROM Event event WHERE event.user_author = ?1")
	List<Event> findAllByUser_Author(User user);
	
	@Query("SELECT event FROM Event event WHERE event.event_date >= ?1 ORDER BY event.event_date")
	List<Event> findAllByEventGreaterThanToday(Date date);
	
	@Query("SELECT event FROM Event event WHERE event.event_id >= ?1")	
	List<Event> findByEvent_Id(long event_id);
	
	@Query("SELECT event FROM Event event WHERE event.title LIKE %?1% OR event.content LIKE %?1% OR event.event_type LIKE %?1% OR event.district.district LIKE %?1% ORDER BY event.event_date ASC")	
	HashSet<Event> findBySearch(String search);
	
	@Query("SELECT event FROM Event event WHERE event.title LIKE %?1% OR event.content LIKE %?1% OR event.event_type LIKE %?1% OR event.district.district LIKE %?1% OR event.user_author.username LIKE %?1% OR event.college_url LIKE %?1% ORDER BY event.event_date ASC")	
	HashSet<Event> findBySearchAdminEvent(String search);
}
