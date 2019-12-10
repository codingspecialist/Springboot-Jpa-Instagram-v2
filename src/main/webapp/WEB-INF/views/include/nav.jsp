<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navigation">
	<a href="feed.html"> <img src="/images/logo.png" />
	</a> <input type="text" placeholder="Search">
	<div class="navigation__links">
		<a href="explore.html" class="navigation__link"> 
			<i class="fa fa-compass"></i>
		</a> 
		<a href="#" class="navigation__link follow_popup"> 
			<i class="fa fa-heart-o"></i>
		</a> 
		<a href="profile.html" class="navigation__link"> 
			<i class="fa fa-user-o"></i>
		</a>
	</div>
</nav>

<!-- Modal 시작 -->
<div id="modal">
  <div id="follow_popup_list">
    <div class="follow_popup_item"> 
      <img src="/images/avatar.jpg" alt="코스사진">
      <p><a href="#">코스</a></p>
      <button class="following_btn">팔로잉</button>	
    </div>

    <div class="follow_popup_item"> 
      <img src="/images/avatar.jpg" alt="코스사진">
      <p><a href="#">코스</a></p>
      <button class="follower_btn">팔로워</button>	
    </div>

    <div class="follow_popup_close">
      <button type="button">닫기</button>
    </div>
  </div>
</div>
<!-- Modal 끝 --> 