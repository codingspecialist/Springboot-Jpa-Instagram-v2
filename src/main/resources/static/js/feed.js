let page = 0;

$(window).scroll(function() {
	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		page++;
		load_image();
    }
});

function make_photo_box(image){
	let photo_box = `<div class="photo u-default-box">`;
	photo_box += `<header class="photo__header">`;	
	photo_box += `<img src="/images/avatar.jpg" />`;
	photo_box += `<div class="photo_user_info">`;
	photo_box += `<span class="photo__username">${image.user.username}</span>`;
	photo_box += `<span class="photo__location">${image.location}</span></div></header>`;
	photo_box += `<div class="photo_post_image">`;
	photo_box += `<img src="/upload/${image.postImage}" /></div>`;
	photo_box += `<div class="photo__info"><div class="photo__actions"><span class="photo__action">`;
	photo_box += `<i class="fa fa-heart-o heart"></i></span> <span class="photo__action">`;
	photo_box += `<i class="fa fa-comment-o"></i></span></div>`;
	photo_box += `<span class="photo__likes">5,103 likes</span><div class="photo_caption">`;
	photo_box += `<span class="photo__username">${image.user.username} </span>`;
	photo_box += `${image.caption}</div><div class="photo_tag">`;
	image.tags.forEach(function(tag){
		photo_box += `${tag.name} `;
	});
	photo_box +=`</div>`;
	photo_box += `<ul class="photo__comments"><li class="photo__comment">`;
	photo_box += `<span class="photo__comment-author">serranoarevalo</span>`;
	photo_box += `i love this!</li><li class="photo__comment">`;
	photo_box += `<span class="photo__comment-author">serranoarevalo</span>`;
	photo_box += `i don't love this!</li></ul><span class="photo__date">${image.createDate}</span>`;
	photo_box += `<div class="photo__add-comment-container">`;
	photo_box += `<textarea placeholder="Add a comment..."></textarea>`;
	photo_box += `<i class="fa fa-ellipsis-h"></i></div></div></div >`;
	
	return photo_box;
}

async function load_image(){
	let response = await fetch(`/image/feed/scroll?page=${page}`);
	let images= await response.json();
	
	console.log(images);
	
	images.forEach(function(image){
		let photo_box = make_photo_box(image);
		$("#feed").append(photo_box);
	});
}