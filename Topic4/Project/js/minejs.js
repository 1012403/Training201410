$(document).ready(function() {

	
	$("#poston").click(function(e) {
		var url,data2;

		var content = $('#post-content').val();
		$('#post-content').val('');
		var username = $('#username').text();
		url = "shownewpost.php";
		data2 = { "content" : content,"username" : username};
		
		$.post(url,data2,function(data) {
			$(data).insertAfter(".post-area");

			$('.comment').keypress(function(e){
				var keycode = (e.keyCode ? e.keyCode : e.which);
				if(keycode == '13'){
				  	var url,data2;
					var content = $(this).val();
					var postid = $(this).attr("postvalue");
					$(this).val('');
					var username = $('#username').text();
					var abs = this;
					url = "shownewcomment.php";
					data2 = { "content" : content, "username" : username, "post_id" : postid};
					$.post(url,data2,function(data) {
						$(data).insertBefore(abs);
					});
				}
			});
			/*$('.new-post').keypress(function(e){
				var keycode = (e.keyCode ? e.keyCode : e.which);
				if(keycode == '13'){
				  	var url,data2;
					var content = $(this).val();
					var postid = $(this).attr("postvalue");
					$(this).val('');
					var username = $('#username').text();
					var abs = this;
					url = "shownewcomment.php";
					data2 = { "content" : content, "username" : username, "post_id" : postid};
					$.post(url,data2,function(data) {
						$(data).insertBefore(abs);
					});
				}
			});
			$('.new-post').off("keypress");*/
		});
	});
	$('.comment').keypress(function(e){
		var keycode = (e.keyCode ? e.keyCode : e.which);
		if(keycode == '13'){
		  	var url,data2;
			var content = $(this).val();
			var postid = $(this).attr("postvalue");
			$(this).val('');
			var username = $('#username').text();
			var abs = this;
			url = "shownewcomment.php";
			data2 = { "content" : content, "username" : username, "post_id" : postid};
			$.post(url,data2,function(data) {
				$(data).insertBefore(abs);
			});
		}
	});

});




	