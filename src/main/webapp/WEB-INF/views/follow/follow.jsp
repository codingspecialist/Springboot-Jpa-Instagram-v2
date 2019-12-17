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
    
      <c:forEach var="follow" items="${follows}" varStatus="status">
	      <li class="explore__user">
	        
	        <div class="explore__content">
	          <img src="/upload/${follow.toUser.profileImage}" onerror="this.onerror=null; this.src='/images/avatar.jpg'"/>
	          <div class="explore__info">
	            <span class="explore__username">${follow.toUser.username}</span>
	          </div>
	        </div>
	        
	        <div id="follow_item_${status.count}">
		        <c:if test="${principal.user.id ne follow.toUser.id}">
			        <c:choose>
			        	<c:when test="${follow.followState eq true}">
			        		<button onClick="follow(false, ${follow.toUser.id}, ${status.count})" class="following_btn">팔로잉</button>		
			        	</c:when>
			        	<c:otherwise>
			        		<button onClick="follow(true, ${follow.toUser.id}, ${status.count})" class="follow_btn">팔로우</button>
			        	</c:otherwise>
			        </c:choose>
		        </c:if>
	        </div>
	        
	      </li>
      </c:forEach>
      
    </ul>
  </main>
  
  <%@ include file="../include/footer.jsp" %>
  <script src="/js/follow.js"></script>
</body>
</html>
