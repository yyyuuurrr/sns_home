package com.cona.sns.post.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cona.sns.common.FileManager;
import com.cona.sns.post.repository.PostRepository;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	
	public int addPost(int snsUserId, String content, MultipartFile file) {
		
		String imagePath = FileManager.saveFile(snsUserId, file);
		
		return postRepository.insertPost(snsUserId, content, imagePath);
		
		
		
	}
	

}
