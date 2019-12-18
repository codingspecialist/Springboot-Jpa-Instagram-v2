// 모달창
$(".like_popup").click(function (){
	load_like_notification();
});

$(".like_popup_close button").click(function (){
	$("#modal .like_popup_items").empty();
	$("#modal").removeClass("active");	
});

async function load_like_notification(){
	console.log("load_like_notification");
	let response = await fetch("/like/notification");
	let likesList = await response.json();
	
	likesList.forEach(function(likes){
		let like_box = make_like_box(likes);
		$("#modal .like_popup_items").append(like_box);
	});
	
	$("#modal").addClass("active");
}

function make_like_box(likes){
	console.log("make_like_box");
	let like_box = `<div class="like_popup_item"> `;
	like_box += `<img src="/upload/${likes.user.profileImage}" onerror="this.onerror=null; this.src='/images/avatar.jpg'" />`;
	like_box += `<p><a href="/user/${likes.user.id}">`;
	like_box += `${likes.user.username}님이 ${likes.image.caption} 사진을 좋아합니다.`;
	like_box += `</a></p></div>`;
	
	return like_box;
}