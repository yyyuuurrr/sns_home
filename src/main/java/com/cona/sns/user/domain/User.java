package com.cona.sns.user.domain;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor  
@AllArgsConstructor
@Builder(toBuilder = true)
@Getter
@Table(name = "user")
@Entity
public class User {
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="loginId")
	private String loginId;
	private String password;
	private String name;
	private String email;
	
	@UpdateTimestamp  
	@Column(name="createdAt", updatable = false)
	private Date createdAt;
	
	@UpdateTimestamp  
	@Column(name="updatedAt")
	private Date updatedAt;

}
