package com.cos.insta.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cos.insta.model.Likes;
import com.cos.insta.model.User;
import com.cos.insta.repository.LikesRepository;
import com.cos.insta.service.MyUserDetail;

@RestController
public class LikesController {
	
	@Autowired
	private LikesRepository mLikesRepository;
	
	@GetMapping("/like/notification")
	public List<Likes> likeNotification(
			@AuthenticationPrincipal MyUserDetail userDetail
			){
		
		User principal = userDetail.getUser();
		List<Likes> likesList = mLikesRepository.findLikeNotification(principal.getId());
		return likesList;
	}
}
