package com.cos.insta.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Data;

@Data
@Entity
public class Image{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String location; //사진 찍은 위치 (로마)
	private String caption; // 사진 설명
	private String postImage; //포스팅 사진 경로+이름
	
	@ManyToOne
	@JoinColumn(name="userId")
	@JsonIgnoreProperties({"password", "images"})
	private User user;
	
	// (1) Like List
	@OneToMany(mappedBy = "image")
	private List<Likes> likes = new ArrayList<>();
	
	// (2) Tag List
	//@OneToMany(mappedBy = "image", cascade = CascadeType.PERSIST)
	@OneToMany(mappedBy = "image")
	@JsonManagedReference
	private List<Tag> tags = new ArrayList<>();
	
	@Transient // DB에 영향을 미치지 않는다.
	private int likeCount;
	
	@Transient
	private boolean heart;
	
	@CreationTimestamp
	private Timestamp createDate;
	@CreationTimestamp
	private Timestamp updateDate;

	
}







