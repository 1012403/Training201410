$(document).ready(function(){

	function Comment(data){
		this.Content = ko.observable(data.Content || "");
		this.PostID = ko.observable(data.PostID || "");
		this.UserID = ko.observable(data.UserID || "");
		this.PostUser = ko.observable(data.PostUser || "");
		this.CmtID = ko.observable(data.CmtID || "");
		
	}

	function CommentModel() {
		var self = this;		
		this.CmtContent = ko.observable("");
		this.selectCmt = ko.observable();

	  	self.Comments = ko.observableArray([]);
		ko.utils.arrayForEach(window.dataSource.ListComment, function(p){
			var newCmt = new Comment(p);
			self.Comments.push(newCmt);
		});

	  
	  	this.CmtEvent = function (data, event) { 
	  		if (event.keyCode == 13) 
	  		{
	  			var content = this.CmtContent();
  				var postID = window.PostID;
  				var userID =  window.GivenUser;	
  				var postUser = window.IdAdmin;
  				

  				var item = {
  					Content : content,
  					PostID :postID,
  					UserID : userID,
  					PostUser: postUser,
  				};
  				
  				$.post(window.insertCmt,{Data: item});
  				var newCmt = new Comment(item);
  				data.Comments.push(newCmt);
  				this.CmtContent('');
	  		
	  		}
	  		return true;
	  	
	  	};

	  	this.delCmt = function(item){
			if (item.UserID() == window.IdAdmin || item.PostUser() == window.IdAdmin){
				if (confirm("Do you want to delete this comment?") == true){
					$.post(window.dellCmt,{Data: item.CmtID()});
			  		self.Comments.remove(item);
	  			}	
			}
			
	  	}
	  	this.editCmt = function(item){
	  		if (item.PostUser() == window.IdAdmin){
	  			self.selectCmt(item);	
	  		}
	  		
	  	}
	  
	  	this.templateComment = function(item){

	  		return self.selectCmt() === item ? "editCmtTmpl": "viewCmtTmpl";
	  	}

	  	this.CmtEditEnter = function (data, event) { 
	  		if (event.keyCode == 13) 
	  		{
	  		
  			
  				 $.post(window.editCmt,{Data: data.Content(), ID: data.CmtID()});
  			
  				self.selectCmt(null);
	  		
	  		}
	  		return true;
	  	
	  	};
		
	  
	}


	
	

	ko.applyBindings(new CommentModel());


	
});