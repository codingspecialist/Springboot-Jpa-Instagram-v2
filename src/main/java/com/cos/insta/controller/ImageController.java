package com.cos.insta.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cos.insta.model.Image;
import com.cos.insta.model.Likes;
import com.cos.insta.model.Tag;
import com.cos.insta.model.User;
import com.cos.insta.repository.ImageRepository;
import com.cos.insta.repository.LikesRepository;
import com.cos.insta.repository.TagRepository;
import com.cos.insta.service.MyUserDetail;
import com.cos.insta.util.Utils;

@Controller
public class ImageController {

	@Value("${file.path}")
	private String fileRealPath;

	@Autowired
	private ImageRepository mImageRepository;

	@Autowired
	private TagRepository mTagRepository;

	@Autowired
	private LikesRepository mLikesRepository;

	@GetMapping("/image/explore")
	public String imageExplore(Model model,
			@PageableDefault(size = 9, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {

		// 알고리즘 ( 내 주변에서 좋아요가 가장 많은 순으로 해보는 것 추천)
		Page<Image> pImages = mImageRepository.findAll(pageable);
		List<Image> images = pImages.getContent();

		// 4번 likeCount
		for (Image item : images) {
			int likeCount = mLikesRepository.countByImageId(item.getId());
			item.setLikeCount(likeCount);
		}

		model.addAttribute("images", images);
		return "image/explore";
	}

// 수정 좋아요 카운트 증가
	@PostMapping("/image/like/{id}")
	public @ResponseBody String imageLike(@PathVariable int id, @AuthenticationPrincipal MyUserDetail userDetail) {

		Likes oldLike = mLikesRepository.findByUserIdAndImageId(userDetail.getUser().getId(), id);

		Optional<Image> oImage = mImageRepository.findById(id);
		Image image = oImage.get();

		try {
			if (oldLike == null) { // 좋아요 안한 상태 (추가)
				Likes newLike = Likes.builder().image(image).user(userDetail.getUser()).build();

				mLikesRepository.save(newLike);
				// 좋아요 카운트 증가(리턴 값 수정)
				return "like";
			} else { // 좋아요 한 상태 (삭제)
				mLikesRepository.delete(oldLike);
				// 좋아요 카운트 증가(리턴 값 수정)
				return "unLike";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "fail";
	}

	// http://localhost:8080/image/feed/scroll?page=1..2..3..4
	@GetMapping("/image/feed/scroll")
	public @ResponseBody List<Image> imageFeedScroll(@AuthenticationPrincipal MyUserDetail userDetail,
			@PageableDefault(size = 3, sort = "id", direction = Sort.Direction.DESC) Pageable pageable, Model model) {

		Page<Image> pageImages = mImageRepository.findImage(userDetail.getUser().getId(), pageable);
		List<Image> images = pageImages.getContent();

		for (Image image : images) {
			Likes like = mLikesRepository.findByUserIdAndImageId(userDetail.getUser().getId(), image.getId());
			if (like != null) {
				image.setHeart(true);
			}

			// 추가
			int likeCount = mLikesRepository.countByImageId(image.getId());
			image.setLikeCount(likeCount);
		}

		return images;
	}

	@GetMapping({ "/", "/image/feed" })
	public String imageFeed(@AuthenticationPrincipal MyUserDetail userDetail,
			@PageableDefault(size = 3, sort = "id", direction = Sort.Direction.DESC) Pageable pageable, Model model) {
		// log.info("username : " + userDetail.getUsername());

		// 내가 팔로우한 친구들의 사진
		Page<Image> pageImages = mImageRepository.findImage(userDetail.getUser().getId(), pageable);

		List<Image> images = pageImages.getContent();

		for (Image image : images) {
			Likes like = mLikesRepository.findByUserIdAndImageId(userDetail.getUser().getId(), image.getId());
			if (like != null) {
				image.setHeart(true);
			}
		}

		// 4번 likeCount
		for (Image item : images) {
			int likeCount = mLikesRepository.countByImageId(item.getId());
			item.setLikeCount(likeCount);
		}

		model.addAttribute("images", images);

		return "image/feed";
	}

	@GetMapping("/image/upload")
	public String imageUpload() {
		return "image/image_upload";
	}

	@PostMapping("/image/uploadProc")
	public String imageUploadProc(@AuthenticationPrincipal MyUserDetail userDetail,
			@RequestParam("file") MultipartFile file, @RequestParam("caption") String caption,
			@RequestParam("location") String location, @RequestParam("tags") String tags) throws IOException {

		// 이미지 업로드 수행
		UUID uuid = UUID.randomUUID();
		String uuidFilename = uuid + "_" + file.getOriginalFilename();
		Path filePath = Paths.get(fileRealPath + uuidFilename);
		Files.write(filePath, file.getBytes());

		User principal = userDetail.getUser();

		Image image = new Image();
		image.setCaption(caption);
		image.setLocation(location);
		image.setUser(principal);
		image.setPostImage(uuidFilename);

		mImageRepository.save(image);

		List<String> tagList = Utils.tagParser(tags);

		for (String tag : tagList) {
			Tag t = new Tag();
			t.setName(tag);
			t.setImage(image);
			mTagRepository.save(t);
			image.getTags().add(t);
		}
		return "redirect:/";
	}

}
