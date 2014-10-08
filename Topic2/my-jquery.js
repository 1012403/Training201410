$(document).ready(function(){
		$("#searchId").on("click",function(){
			$("#searchId").attr('value','');
		});
		$("#searchId").on("blur",function(){
			$("#searchId").attr('value','Nhập từ khóa');
		});	
		$(".image5").click(function(){	
			hs.expand(this);
			return false;
		});

		$("form.contact").submit(function(event){
			if ($("#fullname").val() == ""){
				$("#fullnameRequire").attr("visibility","visible");
				alert("fail");
			}
			else
			{
				alert("Ok");
			}
			return false;
		})
});