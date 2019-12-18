let page = 0;

$(window).scroll(function() {
	/*버그 수정 (근사치 계산)*/
    let checkNum = ($(window).scrollTop()) - ($(document).height() - $(window).height());
	if (checkNum < 1 && checkNum > -1) {
    	console.log('hi');
        page++;
        load_feed_box(); // 박스 3개씩 로드
    }
});

function make_feed_box(image){
    let feed_box = `<div class="photo u-default-box">`;
	feed_box += `<header class="photo__header">`;	
	feed_box += `<img src="/upload/${image.user.profileImage}" onerror="this.onerror=null; this.src='/images/avatar.jpg'"/>`;
	feed_box += `<div class="photo_user_info">`;
	feed_box += `<span class="photo__username">${image.user.username}</span>`;
	feed_box += `<span class="photo__location">${image.location}</span></div></header>`;
	feed_box += `<div class="photo_post_image">`;
	feed_box += `<img src="/upload/${image.postImage}" /></div>`;
	feed_box += `<div class="photo__info"><div class="photo__actions"><span class="photo__action">`;
	
	if(image.heart == true){
		feed_box += `<i onclick="onFeedLoad(${image.id})" id="${image.id}" class="fa fa-heart heart heart-clicked"></i>`;
	}else{
		feed_box += `<i onclick="onFeedLoad(${image.id})" id="${image.id}" class="fa fa-heart-o heart"></i>`;
	}
		
	feed_box += `</span> <span class="photo__action">`;
	feed_box += `<i class="fa fa-comment-o"></i></span></div>`;
	
	// 수정 좋아요 카운트 증가
	feed_box += `<span class="photo__likes" id="photo_likes_count_${image.id}">${image.likeCount}</span><span class="photo__likes"> likes</span><div class="photo_caption">`;
	feed_box += `<span class="photo__username">${image.user.username} </span>`;
	feed_box += `${image.caption}</div><div class="photo_tag">`;
    
	image.tags.forEach(function(tag){
		feed_box += `#${tag.name} `;
	});
	
	feed_box +=`</div>`;
	feed_box += `<ul class="photo__comments"><li class="photo__comment">`;
	feed_box += `<span class="photo__comment-author">serranoarevalo</span>`;
	feed_box += `i love this!</li><li class="photo__comment">`;
	feed_box += `<span class="photo__comment-author">serranoarevalo</span>`;
	feed_box += `i don't love this!</li></ul><span class="photo__date">${image.createDate}</span>`;
	feed_box += `<div class="photo__add-comment-container">`;
	feed_box += `<textarea placeholder="Add a comment..."></textarea>`;
    feed_box += `<i class="fa fa-ellipsis-h"></i></div></div></div >`;
    
    return feed_box;
}

async function load_feed_box(){
	// fetch 로 다운로드
	let response = await fetch(`/image/feed/scroll?page=${page}`);
	let images = await response.json();
	
	console.log(images);
	
	// 3번 실행 필요
	images.forEach(function(image){
		let feed_box = make_feed_box(image);
	    $("#feed").append(feed_box);
	});
}














