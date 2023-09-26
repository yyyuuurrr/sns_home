package com.cona.sns.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.cona.sns.post.service.PostService;

@RestController
public class PostRestcontroller {
	
	
	@Autowired
	private PostService postService;
	
	@PostMapping("/create")
	public Map<String, String> createPost(
			@RequestParam("content") String content
			, @RequestParam("imagefile" )MultipartFile file
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = postService.addPost(0, content, file);
				
		Map<String, String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
			
		}else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}

}