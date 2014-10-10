$(document).ready(function(){


		$('#contact_form').validate({
	    rules: {
	       name: {
	        required: true,
	       required: true
	      },
		  
		 username: { 
	        required: true
	      },
		 company: { 
	        required: true
	      },
		  
	      email: {
	        required: true,
	        email: true
	      },
		  
		  message: { 
			minlength: 50,
			maxlength: 200,
	        required: true
	      },
		  
		  agree: "required"
		  
	    },
			highlight: function(element) {
				$(element).closest('.control-group').removeClass('success').addClass('error');
			},
			success: function(element) {
				element
				.text('OK!').addClass('valid')
				.closest('.control-group').removeClass('error').addClass('success');
			}
	  });

}); // end document.ready