// About Package 
package com.main.eventorr.web.about_controller;

// Imports
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


// About Url Interface Controler
@Controller
public class About_Controller {
	
	@RequestMapping("/about")
	public String about(HttpServletRequest request) {	
		request.setAttribute("title", "About");
		return "/about_view/about";
	}
	
}


