package com.cona.sns.comment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cona.sns.comment.repository.CommentRepository;

@Service
public class CommentService {
	
	@Autowired
	private CommentRepository commentRepository;
	
	
	public int addComment(String comment) {
		
		return commentRepository.insertComment(comment);
	}
	

}
