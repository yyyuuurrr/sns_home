package com.cona.sns.post.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cona.sns.common.FileManager;
import com.cona.sns.post.domain.Post;
import com.cona.sns.post.dto.PostDetail;
import com.cona.sns.post.repository.PostRepository;
import com.cona.sns.user.domain.User;
import com.cona.sns.user.service.UserService;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private UserService userService;
	private int userId;
	
	
	public int addPost(int userId, String content, MultipartFile file) {
		
		String imagePath = FileManager.saveFile(userId, file);
		
		return postRepository.insertPost(userId, content, imagePath);				
	}
	
	
	public List<PostDetail> getPostList() {	
		
		List<Post> postList = postRepository.selectPostList();		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post:postList) {
			int userId = post.getUserId();
			
			User user = userService.getUserById(userId);
			user.getLoginId();
			
			PostDetail postDetail = PostDetail.builder()
									.id(post.getId())
									.userId(userId)
									.content(post.getContent())
									.imagePath(post.getImagePath())
									.build();
			
			postDetailList.add(postDetail);
			
		}
		
		return postDetailList;		
		
	}

}
