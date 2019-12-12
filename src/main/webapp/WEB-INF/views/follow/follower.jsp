<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <%@ include file="../include/nav.jsp" %>
  
  <main id="explore">
  
    <ul class="explore__users u-default-box">
    
      <c:forEach var="follower" items="${followers}">
	      <li class="explore__user">
	        <div class="explore__content">
	          <img src="/images/avatar.jpg" />
	          <div class="explore__info">
	            <span class="explore__username">${follower.fromUser.username}</span>
	          </div>
	        </div>
	        <c:if test="${principal.user.id ne follower.fromUser.id}">
		        <c:choose>
		        	<c:when test="${follower.followState eq true}">
		        		<button onClick="follow(false, ${follower.fromUser.id})" class="following_btn ">팔로잉</button>		
		        	</c:when>
		        	<c:otherwise>
		        		<button onClick="follow(true, ${follower.fromUser.id})" class="follow_btn ">팔로우</button>
		        	</c:otherwise>
		        </c:choose>
	        </c:if>
	      </li>
      </c:forEach>
      
    </ul>
  </main>
  
  <%@ include file="../include/footer.jsp" %>
</body>
</html>
