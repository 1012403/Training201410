$(document).ready(function){
	$("#userForm").submit(function(e) {
		removeFeedback();
		var errors = validateForm();
		if (errors == "") {
				alert("Success");
			return true;
		} else { 
			alert("Fail");
			provideFeedback(errors);
			e.preventDefault();
			return false;
		}

	});

	function validateForm(){
		var errorFields = new Array();
		if ($('#lname').val() == ""){
			errorFields.push('lname');
		}
		if ($('#fname').val() == ""){
			errorFields.push('fname');

		}

		if ($('#email').val() == ""){
			errorFields.push('email');
		}

		if ($('#password1').val() == ""){
			errorFields.push('password1');
		}

		if ($('#password2').val() != $('#password1').val()){
			errorFields.push('password2');
		}
		return errorFields;
	}

	function provideFeedback(incomingErrors){
		for (var i= 0; i < incomingErrors.length; ++i){
			$("#" + incomingErrors[i]).addClass("errorClass");
			$("#" + incomingErrors[i] + "Error").removeClass("errorFeedback");
		}
		$("#errorDiv").html("Error encountered");

	}

	function removeFeedback(){
		$("#errorDiv").html("");
		$('input').each(function(){
			$(this).removeClass("errorClass");
		});
		$('.errorSpan').each(function(){
			%(this).addClass("errorFeedback");
		});
	}
}