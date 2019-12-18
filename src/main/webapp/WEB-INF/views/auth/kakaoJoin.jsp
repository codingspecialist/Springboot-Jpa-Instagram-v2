<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Costagram</title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="shortcut icon" href="/images/favicon.ico">
<link rel="stylesheet" href="/css/styles.css">
<link rel="stylesheet" href="/css/image-upload.css">
</head>
<body>

	<%@ include file="../include/nav.jsp" %>

	<div class="container">
		<div class="box">
			<div class="bigbox">
				<div>
					<img src="/images/loginLogo.png" alt="x" class="image">
				</div>
				<br />

				<div class="text">
					<hr class="hr" />
					추가 인증 필요
					<hr class="hr" />
				</div>
				<!-- 섬네일은 아래 주소 참고 -->
				<!-- https://medium.com/@asadise/create-thumbnail-for-an-image-in-spring-framework-49776c873ea1 -->
				<form action="/auth/kakao/joinProc" method="post">
					<table class="table">
						<tr>
							<td><input type="text" name="username" placeholder="Username"></td>
						</tr>
						<tr>
							<td><input type="email" name="email" placeholder="Email"></td>
						</tr>
					</table>
					<input type="submit" value="가입완료">
				</form>

			</div>
			<div class="smallbox">
				<div class=text>
					<a href="javascript:window.history.back()" class="under1">뒤로가기</a>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp" %>

</body>
</html>