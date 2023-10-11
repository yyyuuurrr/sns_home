package com.cona.sns.comment.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cona.sns.comment.domain.comment;
import com.cona.sns.comment.dto.CommentDetail;
import com.cona.sns.comment.repository.CommentRepository;
import com.cona.sns.user.domain.User;
import com.cona.sns.user.service.UserService;

@Service
public class CommentService {
	
	@Autowired
	private CommentRepository commentRepository;
	
	@Autowired
	private UserService userService;
	
	
	public int addComment(int userId, int postId, String comment) {
		
		return commentRepository.insertComment(userId, postId, comment);
	}
	
	public List<CommentDetail> getCommentList(int postId) {
		
		List<comment> commentList = commentRepository.selectCommentList(postId);
		
		List<CommentDetail> commentDetailList = new ArrayList<>();
		for(comment comment:commentList) {
			
			int userId = comment.getUserId();			
			User user = userService.getUserById(userId);
			
			CommentDetail commentDetail = CommentDetail.builder()
													.id(comment.getId())
													.userId(comment.getUserId())
													.comment(comment.getComment())
													.loginId(user.getLoginId())
													.build();
			
			
			commentDetailList.add(commentDetail);
		}
			
		return commentDetailList;
		
	}

}
