<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Costagram</title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="shortcut icon" href="/images/favicon.ico">
<link rel="stylesheet" href="/css/styles.css">
</head>

<body>

	<%@ include file="../include/nav.jsp"%>
	<main id="profile">
		<header class="profile__header">
			<div class="avatar__container">
				<form id="frm_profile_img" action="/user/profileUpload" method="post">
					<input type="file" name="profileImage" style="display: none;" />
				</form>
				<img src="/images/avatar.jpg" id="profile_image" style="cursor: pointer" />
			</div>
			<div class="profile__info">
				<div class="profile__title">
					<h1>${user.username}</h1>
					<div id="follow_check">
						<c:if test="${principal.user.id ne user.id}">
							<c:choose>
								<c:when test="${followCheck eq  1}">
									<button onClick="follow(false, ${user.id})" class="profile_edit_btn">팔로잉</button>
								</c:when>
								<c:otherwise>
									<button onClick="follow(true, ${user.id})" class="profile_follow_btn">팔로우</button>
								</c:otherwise>
							</c:choose>
						</c:if>
					</div>
					<c:if test="${principal.user.id eq user.id}">
						<a href="/image/upload">
							<button class="profile_follow_btn">사진 업로드</button>
						</a>
						<a href="/user/edit/${principal.user.id}">
							<button class="profile_edit_btn">Edit Profile</button>
						</a> <i class="fa fa-cog fa-lg"></i>
					</c:if>
				</div>
				<ul class="profile__stats">
					<li class="profile__stat"><span class="profile__stat-number">313</span> 게시물</li>
					<li class="profile__stat"><span class="profile__stat-number">4,444 </span><a href="/follow/follower/${user.id}">팔로워</a></li>
					<li class="profile__stat"><span class="profile__stat-number">44 </span><a href="/follow/follow/${user.id}">팔로우</a></li>
				</ul>
				<div class="profile__bio">
					<p class="profile__fullname">${user.name }</p>					
					<p>${user.bio }</p> 
					<p><a href="${user.website}" class="profile__link">
						${user.website}</a></p>
				</div>
			</div>
		</header>
		<div class="profile__photo-grid">
			<div class="profile__photo-row">
				<div class="profile__photo">
					<a href="image-detail.html"> <img src="/images/feedPhoto.jpg">
						<div class="profile__photo-overlay">
							<span class="profile__photo-stat"> <i class="fa fa-heart"></i> 504
							</span> <span class="profile__photo-stat"> <i class="fa fa-comment"></i> 22
							</span>
						</div>
					</a>
				</div>
				<div class="profile__photo">
					<a href="image-detail.html"> <img src="/images/feedPhoto.jpg">
						<div class="profile__photo-overlay">
							<span class="profile__photo-stat"> <i class="fa fa-heart"></i> 504
							</span> <span class="profile__photo-stat"> <i class="fa fa-comment"></i> 22
							</span>
						</div>
					</a>
				</div>
				<div class="profile__photo">
					<a href="image-detail.html"> <img src="/images/feedPhoto.jpg">
						<div class="profile__photo-overlay">
							<span class="profile__photo-stat"> <i class="fa fa-heart"></i> 504
							</span> <span class="profile__photo-stat"> <i class="fa fa-comment"></i> 22
							</span>
						</div>
					</a>
				</div>
			</div>
			<div class="profile__photo-row">
				<div class="profile__photo">
					<a href="image-detail.html"> <img src="/images/feedPhoto.jpg">
						<div class="profile__photo-overlay">
							<span class="profile__photo-stat"> <i class="fa fa-heart"></i> 504
							</span> <span class="profile__photo-stat"> <i class="fa fa-comment"></i> 22
							</span>
						</div>
					</a>
				</div>
				<div class="profile__photo">
					<a href="image-detail.html"> <img src="/images/feedPhoto.jpg">
						<div class="profile__photo-overlay">
							<span class="profile__photo-stat"> <i class="fa fa-heart"></i> 504
							</span> <span class="profile__photo-stat"> <i class="fa fa-comment"></i> 22
							</span>
						</div>
					</a>
				</div>
				<div class="profile__photo">
					<a href="image-detail.html"> <img src="/images/feedPhoto.jpg">
						<div class="profile__photo-overlay">
							<span class="profile__photo-stat"> <i class="fa fa-heart"></i> 504
							</span> <span class="profile__photo-stat"> <i class="fa fa-comment"></i> 22
							</span>
						</div>
					</a>
				</div>
			</div>
			<div class="profile__photo-row">
				<div class="profile__photo">
					<a href="image-detail.html"> <img src="/images/feedPhoto.jpg">
						<div class="profile__photo-overlay">
							<span class="profile__photo-stat"> <i class="fa fa-heart"></i> 504
							</span> <span class="profile__photo-stat"> <i class="fa fa-comment"></i> 22
							</span>
						</div>
					</a>
				</div>
				<div class="profile__photo">
					<a href="image-detail.html"> <img src="/images/feedPhoto.jpg">
						<div class="profile__photo-overlay">
							<span class="profile__photo-stat"> <i class="fa fa-heart"></i> 504
							</span> <span class="profile__photo-stat"> <i class="fa fa-comment"></i> 22
							</span>
						</div>
					</a>
				</div>
				<div class="profile__photo">
					<a href="image-detail.html"> <img src="/images/feedPhoto.jpg">
						<div class="profile__photo-overlay">
							<span class="profile__photo-stat"> <i class="fa fa-heart"></i> 504
							</span> <span class="profile__photo-stat"> <i class="fa fa-comment"></i> 22
							</span>
						</div>
					</a>
				</div>
			</div>
		</div>
	</main>

	<div class="profile__overlay">
		<i class="fa fa-times"></i>
		<div class="profile__overlay-container">
			<a href="#" class="profile__overlay-link">Change password</a> <a href="#"
				class="profile__overlay-link">Authorize Apps</a> <a href="#" class="profile__overlay-link">Notifications</a>
			<a href="#" class="profile__overlay-link" id="logout">Log Out</a> <a href="#"
				class="profile__overlay-link" id="cancel">Cancel</a>
		</div>
	</div>

	
	<%@ include file="../include/footer.jsp"%>
	<script src="/js/profile.js"></script>
	
	<script>
		$(function() {
			//이미지 클릭시 업로드창 실행
			$('#profile_image').click(function() {
				$("input[name='profileImage']").click();
			})
			//업로드 파일체인지가 됬을경우 실행되는 이벤트  form태그에 fileProfile은 hidden으로 넣어줌
			$("input[name='profileImage']").change(function(e) {
				$("#frm_profile_img").submit();
			})
		})
	</script>
</body>

</html>