package com.cona.sns.comment.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class CommentDetail {
	
	
	private int id;
	private int userId;
	private String comment;
	private String loginId;

}
