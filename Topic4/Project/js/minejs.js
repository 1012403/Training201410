$(document).ready(function() {
	$("#poston").click(function(e) {
		var url,data2;
		var content = $('#post-content').val();
		$('#post-content').val('');
		var username = $('#username').text();
		url = "shownewpost.php?t=" + Math.random();
		data2 = { "content" : content,"username" : username};
		$.post(url,data2,function(data) {
			$(data).insertAfter(".post-area");
		});
	});
	$('.form-control').keypress(function(event){
		var keycode = (event.keyCode ? event.keyCode : event.which);
		if(keycode == '13'){
		  	var url,data2;
			var content = $('#post-content').val();
			$('#post-content').val('');
			var username = $('#username').text();
			url = "shownewpost.php?t=" + Math.random();
			data2 = { "content" : content,"username" : username};
			$.post(url,data2,function(data) {
			$(data).insertAfter(".post-area");
			});
		}
	});
});


	