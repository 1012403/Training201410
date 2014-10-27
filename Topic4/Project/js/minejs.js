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

	// $(".loadMore").click(function(e) {
	// 	var url,data2;
	// 	var postid = $(this).attr("postvalue");
	// 	url = "showallcomments.php";
	// 	data2 = { "post_id" : postid};
	// 	var abs = this;
	// 	$(data).insertBefore(abs);
	// });
	//$('.list-comments li:lt(5)').show();
   /* $('.loadMore').click(function () {
        $('.list-comments li:lt(10)').show();

    });*/

    $('.posts').each(function(index){
		$('.posts').find('ul').attr('id', 'listCmt_' + index);
		/*$('#listCmt_' + index + 'li:lt(5)').show();
		$('#listCmt_'+ index).find('.loadMore').attr('id', 'loadMore_' + index);
		$('#loadMore_' + index).click(function(){
			$('#listCmt_'+ index + ' li').css('display','block');
		});*/
	});		
    // $('#showLess').click(function () {
    //     $('#myList li').not(':lt(3)').hide();
    // });



    // size_li = $("#myList li").size();
    // x=3;
    // $('#myList li:lt('+x+')').show();
    // $('#loadMore').click(function () {
    //     x= (x+5 <= size_li) ? x+5 : size_li;
    //     $('.list-comments li:lt(3)').show();
    // });


});




	