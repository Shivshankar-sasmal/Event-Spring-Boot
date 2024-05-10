// Current User Package
package com.main.eventorr.web.login_current_user;

// User Database Model Accessor
import com.main.eventorr.web.entity.User;

// Spring Boot Import
import org.springframework.beans.factory.annotation.Autowired;


// Current User Class Accessor
public class Current_user {
	
	@Autowired
	public static User user = null;
	
	
	public static boolean is_null() {
				
		if (user == null || user.getIsActive()==0) {
			return true;
		}
		else {
			return false;
		}
	}
	
}
