package com.cona.sns.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cona.sns.comment.service.CommentService;

@RestController
public class CommentRestController {
	
	@Autowired
	private CommentService commentService;
	
	@PostMapping("/post/comment")
	public Map<String, String> comment(@RequestParam("postId") int postId
			,  @RequestParam("comment") String comment
			,  HttpSession session) {
				
				int userId = (Integer)session.getAttribute("userId");
				int count = commentService.addComment(userId, postId, comment);
				
				Map<String, String> resultMap = new HashMap<>();
				
				if(count == 1) {
					resultMap.put("result", "success");
				} else {
					resultMap.put("result", "fail");
				}
				
				return resultMap;
	}


	

}
