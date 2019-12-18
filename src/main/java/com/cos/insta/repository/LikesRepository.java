package com.cos.insta.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cos.insta.model.Likes;

public interface LikesRepository extends JpaRepository<Likes, Integer>{
	// 내가 좋아요 한 이미지 찾기 위해!!
	Likes findByUserIdAndImageId(int userId, int imageId);
	
	// 이미지 좋아요 카운트
	int countByImageId(int imageId);
}
