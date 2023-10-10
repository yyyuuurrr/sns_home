package com.cona.sns.post.dto;

import javax.persistence.Column;

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
	

	
	
}
