package com.cos.insta.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;

import com.cos.insta.model.User;
import com.cos.insta.model.dto.KakaoProfile;
import com.cos.insta.model.dto.OAuth2Token;
import com.cos.insta.repository.UserRepository;
import com.cos.insta.service.MyUserDetailService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class OAuth2Controller {

	private String clientId = "700c5a8c5d56aa7cfe80a6d641875583";
	private String redirectUri = "http://localhost:8080/auth/kakao/callback";
	
	@Autowired
	private UserRepository mUserRepository;
	
	@Autowired
	private MyUserDetailService mMyUserDetailService;
	
	@GetMapping("/auth/kakao/login")
	public String kakaoLogin() {
		
		StringBuffer sb = new StringBuffer();
		sb.append("https://kauth.kakao.com/oauth/authorize?");
		sb.append("client_id="+clientId+"&");
		sb.append("redirect_uri="+redirectUri+"&");
		sb.append("response_type=code");
		
		return "redirect:"+sb.toString();
	}
	
	
	@PostMapping("/auth/kakao/joinProc")
	public String kakaoJoinProc(User user, HttpSession session) {
		// name, email, provider, providerId
		String providerId = 
				(String) session.getAttribute("providerId");
		
		user.setProvider("kakao");
		user.setProviderId(providerId);
		
		mUserRepository.save(user);
		
		UserDetails userDetail = 
				mMyUserDetailService.loadUserByUsername(user.getUsername());
	    
		Authentication authentication = 
	    		new UsernamePasswordAuthenticationToken(userDetail, userDetail.getPassword(), userDetail.getAuthorities());
	    
		SecurityContext securityContext = SecurityContextHolder.getContext();
		securityContext.setAuthentication(authentication);
		session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
		
		return "redirect:/";
	}
	
	
	// accessToken 역할 = 카카오에 정보를 받기 위한 key (10분 ~ 1시간)
	// refreshToken -> accessToken 을 받을 수 있음. (10일 ~ 30일)
	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(
			String code,
			HttpSession session) {
		
		// 토큰 받기 
		// HttpUrlConnection, Retrofit2, okHttp, RestTemplate
		RestTemplate rt = new RestTemplate();
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8"); //전부다 String형일 때. RestTemplate 때문에 생략가능

		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		 
		parameters.add("grant_type", "authorization_code");
		parameters.add("client_id", clientId);
		parameters.add("redirect_uri", redirectUri);
		parameters.add("code",code);
		 
		HttpEntity<MultiValueMap<String, String>> request = 
				new HttpEntity<>(parameters, headers);

		ResponseEntity response = rt.exchange(
				"https://kauth.kakao.com/oauth/token", 
				HttpMethod.POST, 
				request, 
				String.class
		);
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		OAuth2Token oToken = null;
		try {
			oToken = objectMapper.readValue(response.getBody().toString(), OAuth2Token.class);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		// 로그인시 마다 확인가능 (앱 연결해제 때 필요)
		System.out.println("access_token : "+oToken.getAccess_token());
		
		// 회원 프로필 조회 끝 (인증)
		RestTemplate rt2 = new RestTemplate();
		
		HttpHeaders headers2 = new HttpHeaders();
		headers.add("Authorization", "Bearer "+oToken.getAccess_token()); //전부다 String형일 때. RestTemplate 때문에 생략가능
		headers.add("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8"); //전부다 String형일 때. RestTemplate 때문에 생략가능

		HttpEntity request2 = 
				new HttpEntity(headers);

		ResponseEntity response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me", 
				HttpMethod.POST, 
				request2, 
				String.class
		);
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;
		try {
			kakaoProfile = 
					objectMapper2
					.readValue(
							response2.getBody().toString(), 
							KakaoProfile.class);
		} catch (Exception e) {
			e.printStackTrace();
		} 

		System.out.println(kakaoProfile.getId());
		
		// 가입자, 비가입자 확인 처리
		User user = 
				mUserRepository
				.findByProviderAndProviderId("kakao", kakaoProfile.getId());
		
		if(user == null) {
			System.out.println("미 가입자 입니다.");
			// 회원가입 창으로 넘어가서 email, name -> 로그인 처리
			session.setAttribute("providerId", kakaoProfile.getId());
			return "auth/kakaoJoin";
		} else {
			System.out.println("가입된 유저입니다. 로그인 처리합니다.");
			// 로그인 처리
			// 3. 해당 아이디로 로그인을 위해 강제 세션 부여
			UserDetails userDetail = 
					mMyUserDetailService.loadUserByUsername(user.getUsername());
		    
			Authentication authentication = 
		    		new UsernamePasswordAuthenticationToken(userDetail, userDetail.getPassword(), userDetail.getAuthorities());
		    
			SecurityContext securityContext = SecurityContextHolder.getContext();
			securityContext.setAuthentication(authentication);
			session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
			return "redirect:/";
		}
		
	}
}
