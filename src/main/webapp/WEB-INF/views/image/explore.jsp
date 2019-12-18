<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Costagram</title>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
  <link rel="shortcut icon" href="/images/favicon.ico">
  <link rel="stylesheet" href="/css/styles.css">
</head>

<body>
  
  <%@ include file="../include/nav.jsp" %>
  
  <main id="profile">
    <div class="profile__photo-grid">
    	<!-- 유저가 업로드한 Feed 사진 -->
		<c:forEach var="image" items="${images}">
			<div class="profile__photo">
				<a href="/user/${image.user.id}"> <img src="/upload/${image.postImage}">	
					<div class="profile__photo-overlay">
						<span class="profile__photo-stat"> <i class="fa fa-heart"></i> ${image.likeCount}</span> 
						<span class="profile__photo-stat"> <i class="fa fa-comment"></i> 22</span>
					</div>
				</a>
			</div>									
		</c:forEach>

    </div>
  </main>
  
  <div class="profile__overlay">
    <i class="fa fa-times"></i>
    <div class="profile__overlay-container">
      <a href="#" class="profile__overlay-link">Change password</a>
      <a href="#" class="profile__overlay-link">Authorize Apps</a>
      <a href="#" class="profile__overlay-link">Notifications</a>
      <a href="#" class="profile__overlay-link" id="logout">Log Out</a>
      <a href="#" class="profile__overlay-link" id="cancel">Cancel</a>
    </div>
  </div>

  <%@ include file="../include/footer.jsp" %>

  <script>
      $(function() {
        //이미지 클릭시 업로드창 실행
        $('#profile_image').click(function() {
            $("input[name='profileImage']").click();
        })
        //업로드 파일체인지가 됬을경우 실행되는 이벤트  form태그에 fileProfile은 hidden으로 넣어줌
        $("input[name='profileImage']").change(function(e){
            $("#frm_profile_img").submit();
        })
      })
    </script>
</body>

</html>