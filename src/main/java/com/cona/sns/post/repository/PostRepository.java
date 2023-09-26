package com.cona.sns.post.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PostRepository {

	public int insertPost(
			@Param("snsUserId") int snsUserId
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	
}
