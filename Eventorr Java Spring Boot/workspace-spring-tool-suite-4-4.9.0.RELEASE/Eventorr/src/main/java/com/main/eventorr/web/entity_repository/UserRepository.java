// Database Model Repository Package
package com.main.eventorr.web.entity_repository;


// Common Imports
import java.util.List;
import java.util.HashSet;

//Database Model Imports
import com.main.eventorr.web.entity.District;
import com.main.eventorr.web.entity.User;

// Main Repository Import
import org.springframework.data.jpa.repository.JpaRepository;

// Query Creation Import
import org.springframework.data.jpa.repository.Query;



public interface UserRepository extends JpaRepository<User, Long> {
	@Query("SELECT user FROM User user WHERE user.is_superuser = 1")
	List<User> findAllIs_Superuser();
	
	@Query("SELECT user FROM User user WHERE user.username LIKE %?1% OR user.full_name LIKE %?1% OR user.email LIKE %?1% OR user.something_about_you LIKE %?1% OR user.district.district LIKE %?1%  ORDER BY user.full_name")	
	HashSet<User> findBySearchAdminUser(String search_user);
	
	List<User> findByDistrict(District district);
	
	User findById(long user_id);
	
	User findByEmail(String email);
	
	User findByUsername(String username);
		
	User findByUsernameAndPassword(String username, String password);
	
	User findByUsernameAndEmail(String username, String email);
	
	boolean existsByEmail(String email);
	
	boolean existsByUsername(String username);
}

