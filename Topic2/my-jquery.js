$(document).ready(function(){
		//Create a number range [1..100]
		var numRand1 = Math.floor(Math.random()*11);
		var numRand2 = Math.floor(Math.random()*11);
		$("#num1").val(numRand1);
		$("#num2").val(numRand2);

		function validationForm(){
			var errorField = new Array();
			if ($("#fullname").val() == ""){
				errorField.push("fullname");
			}
			if ($("#company").val() == ""){
				errorField.push("company");
			}
			if ($("#email").val() == ""){
				errorField.push("email");
			}
			if ($("#message").val() == ""){
				errorField.push("message");
			}

			var numRand3 = $("#num3").val();
			if ((numRand1+numRand2) != numRand3){
				errorField.push("number");
			}

			return errorField;

		}
		function provideFeedback(incomingErrors){
			for (var i=0; i< incomingErrors.length; ++i){
				$("#" + incomingErrors[i] + "Feedback").removeClass("errorFeedback");
			}
		}
		function removeFeedback(){
			$('.errorSpan').each(function(){
				$(this).addClass("errorFeedback");
			});
		}

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
		
			removeFeedback();
			var errors = validationForm();
			if (errors == ""){
				
				var userobject = {
					"name": $("#fullname").val(),
					"company": $("#company").val(),
					"email": $("#email").val(),
					"message" : $("#message").val(),

				};
				alert(JSON.stringify(userobject, null, 4));
				return true;
			}
			else{
				provideFeedback(errors);
				event.preventDefault();
				return false;
			}
			
		});
		
		
});