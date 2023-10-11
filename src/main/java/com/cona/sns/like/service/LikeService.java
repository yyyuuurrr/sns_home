package com.cona.sns.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cona.sns.like.repository.LikeRepository;

@Service
public class LikeService {
	
	@Autowired
	private LikeRepository likeRepository; 
		
	
	public int addLike(int postId, int userId) {
		
		return likeRepository.insertLike(postId, userId);
	}

	
	public int countLike(int postId) {
	
		return likeRepository.selectCountLike(postId);
	}
	
	
	public boolean isLike(int postId, int userId) {
		
		int count = likeRepository.selectCountLikeByUserId(postId, userId);
		
		if(count == 0) {
			return false;
		}else {
			return true;
		}
		 
		// return count != 0;		
	}
	
	
}
