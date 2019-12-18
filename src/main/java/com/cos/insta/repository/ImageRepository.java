package com.cos.insta.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.insta.model.Image;

public interface ImageRepository extends JpaRepository<Image, Integer>{

	@Query
	(
			value = "select * from image where userId in (select toUserId from follow where fromUserId = ?1) or userId = ?1", nativeQuery = true		
	)
	Page<Image> findImage(int userId, Pageable pageable);
	
	/* 태그 검색 해볼 사람 해보기
	 * select * from image where id in (
			select imageId from tag where name = '연기자'
		);
	 */
}
