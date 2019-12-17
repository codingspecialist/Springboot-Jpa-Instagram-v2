async function onFeedLoad(imageId){
	let msg = await like(imageId);
	if(msg === "ok"){
		$("#"+imageId).toggleClass("heart-clicked fa-heart fa-heart-o");	
	}else{
		alert(msg);
	}
}


async function like(imageId){
	let response = await fetch(`/image/like/${imageId}`, {
		method: "POST"
	});
	let msg = await response.text();	
	return msg;
}





