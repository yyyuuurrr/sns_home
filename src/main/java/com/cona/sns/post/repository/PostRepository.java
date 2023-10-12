package com.cona.sns.post.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.cona.sns.post.domain.Post;

@Repository
public interface PostRepository {

	public int insertPost(
			@Param("userId") int userId
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	public List<Post> selectPostList();
	
	public int deletePost(@Param("postId") int postId);
	
	public int selectPost(@Param("id") int id);
	
}
