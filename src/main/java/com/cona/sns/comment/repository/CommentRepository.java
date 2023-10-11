package com.cona.sns.comment.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.cona.sns.comment.domain.comment;

@Repository
public interface CommentRepository {

	public int insertComment(@Param("userId") int userId
			, @Param("postId") int postId
			, @Param("comment") String comment);
	
	
	public List<comment> selectCommentList(@Param("postId")int postId);
	
	
}
