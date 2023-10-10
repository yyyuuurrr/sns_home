package com.cona.sns.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cona.sns.comment.service.CommentService;

@RestController
@RequestMapping("/post")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	
	public int comment(@RequstParam("postId")int postId) {
		
	}

}
