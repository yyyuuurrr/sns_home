package com.cona.sns.comment.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentRepository {

	public int insertComment(@Param("comment") String comment);
	
}
