$(document).ready(function(){
	$("#postBtn").click(function(){
		var content = $("#message").val();
		var title = $("#title").val();
		$("#message").val("");
		$("#title").val("");
		$.post("insertApost.php",{
			message:content,
			titlePost: title,
		});
		$("#Listpost").load("shownewpost.php",function(data){
				$('div.expandable p').expander();
				
		});
	});
	$('.postTitle').click(function(){
		var content = $(".postTitle").val();
		var title = $(".postcontent").val();
		$.post("detailpage.php",{
			Title:title,
			Content: content,
		});
	});
	$('div.expandable p').expander();
	
//
	$('.writeCmt').keydown(function(e) {
	  if (e.keyCode == 13) {
	    var content = $(this).val();
	    var postId = $(this).attr("id");
		$(this).val("");
		$.post("insertAcomment.php",{ message: content, id:postId });
		$("#Listpost").load("shownewpost.php",function(data){

			$('div.expandable p').expander(); 
		
		});
	  }
	});
});
