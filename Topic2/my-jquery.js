$(document).ready(function(){
		//Create a number range [1..100]
		var numRand1 = Math.floor(Math.random()*101);
		var numRand2 = Math.floor(Math.random()*101);
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
			else if (validateEmail() == false){
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


		function validateEmail() {
		    var x = $("#email").val();
		    var atpos = x.indexOf("@");
		    var dotpos = x.lastIndexOf(".");
		    if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=x.length) {
		       $("#emailFeedback").html("Check email format");
		        return false;
		    }
		    else{
		    	$("#emailFeedback").html("Email is required");
		    	return true;	
		    }
		    
		}
		function provideFeedback(incomingErrors){
			for (var i=0; i< incomingErrors.length; ++i){
				$("#" + incomingErrors[i] + "Feedback").removeClass("errorFeedback");
				$("#" + incomingErrors[i] + "OKFeedback").addClass("okFeedback");
			}
		}
		function removeFeedback(){
			$('.errorSpan').each(function(){
			$(this).addClass("errorFeedback");
				//$(this).html("Valid");
			
			});
			$('.okSpan').each(function(){
				$(this).removeClass("okFeedback");
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

		$("#ContactRef").click(function(){
			
			window.location.href= "#formContact";
			return false;

		});

		$("#num3").keyup(function () { 
   			if (this.value != this.value.replace(/[^0-9\.]/g, '')) {
       			this.value = this.value.replace(/[^0-9\.]/g, '');
  			  }
		});
		
		
		
});