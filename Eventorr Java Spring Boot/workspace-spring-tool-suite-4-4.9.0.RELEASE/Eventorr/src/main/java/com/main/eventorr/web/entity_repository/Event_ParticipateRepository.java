// Database Model Repository Package
package com.main.eventorr.web.entity_repository;

// Common Imports
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

// Database Model Imports
import com.main.eventorr.web.entity.Event;
import com.main.eventorr.web.entity.Event_Participate;
import com.main.eventorr.web.entity.User;

// Main Repository Import
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



public interface Event_ParticipateRepository extends JpaRepository<Event_Participate, Long>{	
	@Query("SELECT event_participate FROM Event_Participate event_participate WHERE event_participate.event.title LIKE %?1% OR event_participate.event.user_author.username LIKE %?1% OR event_participate.event.user_author.full_name LIKE %?1% OR event_participate.user.username LIKE %?1% OR event_participate.phone_number LIKE %?1% OR event_participate.user.full_name LIKE %?1% ORDER BY event_participate.user.username ASC")	
	HashSet<Event_Participate> findBySearchAdminEvent_Participate(String search_event_participate);
	
	ArrayList<Event_Participate> findByEvent(Event event);	
	
	ArrayList<Event_Participate> findByUser(User user);	
		
	List<Event_Participate> findByEventOrderByUserAsc(Event event);
	
	boolean existsByUserAndEvent(User user, Event event);
}
