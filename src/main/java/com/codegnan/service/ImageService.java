package com.codegnan.service;

import java.io.IOException;

import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.content.Media;
import org.springframework.stereotype.Service;
import org.springframework.util.MimeType;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ImageService {
	
	private final ChatClient chatClient;

	public ImageService(ChatClient.Builder builder) {
		super();
		this.chatClient = builder.build();
	}
	
	public String description(MultipartFile file) {

	    StringBuilder prompt = new StringBuilder();
	    prompt.append("Describe the following image. ");
	    prompt.append("Keep only important information. Provide a clean, structured summary.\n");

	    return chatClient.prompt()
	            .system("You are an expert visual content analyst.")
	            .user(u -> {
	                u.text(prompt.toString());
	                try {
						u.media(
						        Media.builder()
						                .mimeType(MimeType.valueOf(file.getContentType()))
						                .data(file.getBytes())
						                .build()
						);
					} catch (IOException e) {
						
						e.printStackTrace();
					}
	            })  
	            .call()
	            .content();
	}
}
