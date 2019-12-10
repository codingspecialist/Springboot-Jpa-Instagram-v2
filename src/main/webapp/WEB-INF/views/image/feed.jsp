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
<link rel="stylesheet" href="/css/modal.css">
</head>
<body>

	<%@ include file="../include/nav.jsp"%>

	<main id="feed">
		<div class="photo u-default-box">
			<header class="photo__header">
				<img src="/images/avatar.jpg" /> <span class="photo__username">serranoarevalo</span>
			</header>
			<img src="/images/feedPhoto.jpg" />
			<div class="photo__info">
				<div class="photo__actions">
					<span class="photo__action"> <i class="fa fa-heart-o heart"></i>
					</span> <span class="photo__action"> <i class="fa fa-comment-o"></i>
					</span>
				</div>
				<span class="photo__likes">5,103 likes</span>
				<ul class="photo__comments">
					<li class="photo__comment"><span class="photo__comment-author">serranoarevalo</span> i
						love this!</li>
					<li class="photo__comment"><span class="photo__comment-author">serranoarevalo</span> i
						don't love this!</li>
				</ul>
				<span class="photo__date">1 hour ago</span>
				<div class="photo__add-comment-container">
					<textarea placeholder="Add a comment..."></textarea>
					<i class="fa fa-ellipsis-h"></i>
				</div>
			</div>
		</div>
		<div class="photo u-default-box">
			<header class="photo__header">
				<img src="/images/avatar.jpg" /> <span class="photo__username">serranoarevalo</span>
			</header>
			<img src="/images/feedPhoto.jpg" />
			<div class="photo__info">
				<div class="photo__actions">
					<span class="photo__action"> <i class="fa fa-heart-o heart"></i>
					</span> <span class="photo__action"> <i class="fa fa-comment-o"></i>
					</span>
				</div>
				<span class="photo__likes">5,103 likes</span>
				<ul class="photo__comments">
					<li class="photo__comment"><span class="photo__comment-author">serranoarevalo</span> i
						love this!</li>
					<li class="photo__comment"><span class="photo__comment-author">serranoarevalo</span> i
						don't love this!</li>
				</ul>
				<span class="photo__date">1 hour ago</span>
				<div class="photo__add-comment-container">
					<textarea placeholder="Add a comment..."></textarea>
					<i class="fa fa-ellipsis-h"></i>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>
