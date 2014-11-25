$(document).ready(function(){
	

	$("#postBtn").click(function(){
		var content = $("#message").val();
		var title = $("#title").val();
		$("#message").val("");
		$("#title").val("");
		$.post("insertApost.php",{message:content,titlePost: title,},function(data){
			$(data).insertAfter(".PostStatus");
			$('.writeCmt').keydown(function(e){
				if (e.keyCode == 13){
					var content = $(this).val();
					var postId = $(this).attr("id");
					$(this).val("");
					var currentInput = this;
					$.post("insertAcomment.php",{message: content, id:postId},function(data){
						$(data).insertBefore(currentInput);
					});
				}
			});
		});
	
	});
	$('div.expandable p').expander();	
	$('.writeCmt').keydown(function(e){
				if (e.keyCode == 13){
					var content = $(this).val();
					var postId = $(this).attr("id");
					$(this).val("");
					var currentInput = this;
					$.post("insertAcomment.php",{message: content, id:postId},function(data){
						$(data).insertBefore(currentInput);
					});
				}
	});

	
	

});