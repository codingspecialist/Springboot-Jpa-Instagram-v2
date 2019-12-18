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
				<form id="frm_profile_img" action="/user/profileUpload" method="post" enctype="multipart/form-data">
					<input type="file" name="profileImage" style="display: none;" />
				</form>
				<img src="/upload/${user.profileImage}" onerror="this.onerror=null; this.src='/images/avatar.jpg'" id="profile_image" style="cursor: pointer" />
			</div>
			
			<div class="profile__info">
				<div class="profile__title">
					<h1>${user.username}</h1>

					<c:if test="${principal.user.id ne user.id}">
						<div id="follow_check">
							
								<c:choose>
									<c:when test="${followCheck eq  1}">
										<button onClick="follow(false, ${user.id})" class="profile_edit_btn">팔로잉</button>
									</c:when>
									<c:otherwise>
										<button onClick="follow(true, ${user.id})" class="profile_follow_btn">팔로우</button>
									</c:otherwise>
								</c:choose>
							
						</div>
					</c:if>
					
					<c:if test="${principal.user.id eq user.id}">
						<a href="/image/upload">
							<button class="profile_follow_btn">사진등록</button>
						</a>
						<a href="/user/edit">
							<button class="profile_edit_btn">회원수정</button>
						</a> <i class="fa fa-cog fa-lg"></i>
					</c:if>	
				</div>
				
				<ul class="profile__stats">
					<li class="profile__stat"><span class="profile__stat-number">${imageCount}</span> 게시물</li>
					<li class="profile__stat"><span class="profile__stat-number">${followerCount} </span><a href="/follow/follower/${user.id}">팔로워</a></li>
					<li class="profile__stat"><span class="profile__stat-number">${followCount} </span><a href="/follow/follow/${user.id}">팔로우</a></li>
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
				
				<!-- 유저가 업로드한 Feed 사진 -->
				<c:forEach var="image" items="${user.images}">
					<div class="profile__photo">
						<a href="image-detail.html"> <img src="/upload/${image.postImage}"></a>
						<div class="profile__photo-overlay">
							<span class="profile__photo-stat"> <i class="fa fa-heart"></i> ${image.likeCount}</span> 
							<span class="profile__photo-stat"> <i class="fa fa-comment"></i> 22</span>
						</div>
					</div>									
				</c:forEach>
				
		</div>
	</main>

	<div class="profile__overlay">
		<i class="fa fa-times"></i>
		<div class="profile__overlay-container">
			<!-- 패스워드 변경 직접 구현 -->
			<a href="/auth/password" class="profile__overlay-link">Change password</a> 
			<a href="/logout" class="profile__overlay-link" id="logout">Logout</a> 
			<a href="#" class="profile__overlay-link" id="cancel">Cancel</a>
		</div>
	</div>

	
	<%@ include file="../include/footer.jsp"%>
	<script src="/js/profile.js"></script>
	
	<script>
		let userId = ${user.id};
		let principalId = ${principal.user.id}

		$(function() {
			//이미지 클릭시 업로드창 실행
			$('#profile_image').click(function() {
				if(userId === principalId){
					$("input[name='profileImage']").click();
				}
			})
			//업로드 파일체인지가 됬을경우 실행되는 이벤트  form태그에 fileProfile은 hidden으로 넣어줌
			$("input[name='profileImage']").change(function(e) {
				$("#frm_profile_img").submit();
			})
		})
	</script>
</body>

</html>