package com.cona.sns.post.dto;

import java.util.List;

import com.cona.sns.comment.dto.CommentDetail;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class PostDetail {

	private int id;
	private int userId;
	private String loginId;
	private String content;
	private String imagePath;
	private int likeCount;
	private boolean isLike;
	private List<CommentDetail> commentList; 

	

	
	
}
