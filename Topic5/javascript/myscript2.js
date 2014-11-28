$(document).ready(function(){

	function Comment(data){
		this.Content = ko.observable(data.Content || "");
		this.PostID = ko.observable(data.PostID || "");
		this.CmtContent = ko.observable(data.Content || "");
		
	}

	function CommentModel() {
		var self = this;		

	  	self.Comments = ko.observableArray([]);
		ko.utils.arrayForEach(window.dataSource.ListComment, function(p){
			console.log(p);
			var newCmt = new Comment(p);
			self.Comments.push(newCmt);
		});

	  
	  	this.CmtEvent = function (data, event) { 
	  		if (event.keyCode == 13) 
	  		{
	  			//var content = this.CmtContent();
  				var postID = data.PostID();
  				var userID =  window.IdAdmin;	
  				

  				var item = {
  					Content : content,
  					PostID :postID,
  					UserID : userID,
  				};
  				
  				$.post(window.insertCmt,{Data: item});
  				var newCmt = new Comment(item);
  				data.Comments.push(newCmt);
  				//this.CmtContent('');
	  		
	  		}
	  		return true;
	  	
	  	};
		
	  
	}


	
	

	ko.applyBindings(new CommentModel());


	
});