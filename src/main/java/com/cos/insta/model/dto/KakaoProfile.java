package com.cos.insta.model.dto;

import lombok.Data;

@Data
public class KakaoProfile {
	private String id;
	private Properties properties;
	private KakaoAccount kakao_account;
	
	@Data
	class Properties {
		private String nickname;
		private String profile_image;
		private String thumbnail_image;
	}
	
	@Data
	class KakaoAccount {
		private boolean profile_needs_agreement;
		private Profile profile;
		
		@Data
		class Profile {
			private String nickname;
			private String thumbnail_image_url;
			private String profile_image_url;
		}
	}
}
