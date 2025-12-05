package com.codegnan.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.codegnan.service.ImageService;

@RestController
@RequestMapping("/api/describe")
@CrossOrigin
public class ImageController {
	private final ImageService ims;

	public ImageController(ImageService ims) {
		super();
		this.ims = ims;
	}
	@PostMapping("/file")
	public ResponseEntity<?>summarizeFile(@RequestParam("file")MultipartFile file){
		try {
			
			String desc=ims.description(file);
			return ResponseEntity.ok(desc);
		}catch(Exception e) {
			return ResponseEntity.internalServerError().body("Error: "+e.getMessage());
		}
	}

}
