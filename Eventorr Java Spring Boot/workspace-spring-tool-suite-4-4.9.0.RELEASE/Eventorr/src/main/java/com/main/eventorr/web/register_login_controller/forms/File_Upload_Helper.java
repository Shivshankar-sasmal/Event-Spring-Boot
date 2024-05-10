// Image File Uploader Package;
package com.main.eventorr.web.register_login_controller.forms;

// Common Imports
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

// Spring Boot Multipart Imports
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;




// Main Multipart Controller
@Component
public class File_Upload_Helper {
	
	
	public boolean uploadFile(MultipartFile file, String username) throws IOException {
		final String upload = new ClassPathResource("static/media/user_image").getFile().getAbsolutePath();
		boolean value = false;
		
		try {
			Files.copy(file.getInputStream(), Paths.get(upload+File.separator+username.hashCode()+"."+file.getContentType().split("/")[1]), StandardCopyOption.REPLACE_EXISTING);
			value = true;
		}
		catch(Exception error) {
			error.printStackTrace();
		}
		
		return value;
	}
	
	
	public boolean uploadFileEvent(MultipartFile file, String username) throws IOException {
		final String upload = new ClassPathResource("static/media/event_image").getFile().getAbsolutePath();
		boolean value = false;
		
		try {
			Files.copy(file.getInputStream(), Paths.get(upload+File.separator+username.hashCode()+"."+file.getContentType().split("/")[1]), StandardCopyOption.REPLACE_EXISTING);
			value = true;
		}
		catch(Exception error) {
			error.printStackTrace();
		}
		
		return value;
	}
	
	
}
