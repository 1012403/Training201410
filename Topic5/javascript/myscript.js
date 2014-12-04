$(document).ready(function(){

	function Post(data){
		var self = this;
		this.Content = ko.observable(data.Content || "");
		this.Email = ko.observable(data.Email || "");
		this.PostID = ko.observable(data.PostID || "");
		this.PostTitle = ko.observable(data.PostTitle || "");
		this.PostUser = ko.observable(data.PostUser || "");
		this.GivenUser = ko.observable(data.GivenUser || "");
		this.View = ko.observable(data.View || "");
		this.Comments = ko.observableArray(data.Comments || []);
		this.CmtContent = ko.observable(data.CmtContent || "");
		this.selectCmt = ko.observable();
		this.delCmt = function(item){
			if (item['UserID'] == window.IdAdmin || item['PostUser'] == window.IdAdmin){
				if (confirm("Do you want to delete this comment?") == true){
					$.post(window.dellCmt,{Data: item['CmtID']});
			  		self.Comments.remove(item);
	  			}	
			}
			
	  	}
	  	this.editCmt = function(item){
	  		if (item['PostUser'] == window.IdAdmin){
	  			self.selectCmt(item);	
	  		}
	  		
	  	}
	  
	  	this.templateComment = function(item){

	  		return self.selectCmt() === item ? "editCmtTmpl": "viewCmtTmpl";
	  	}
	  	this.CmtEditEnter = function (data, event) { 
	  		if (event.keyCode == 13) 
	  		{
	  		
  			
  				 $.post(window.editCmt,{Data: data['Content'], ID: data['CmtID']});
  			
  				self.selectCmt(null);
	  		
	  		}
	  		return true;
	  	
	  	};
	}

	function Comment(data){
		this.Content = ko.observable(data.Content || "");
		this.PostID = ko.observable(data.PostID || "");
		this.UserID = ko.observable(data.UserID || "");
		this.PostUser = ko.observable(data.PostUser || "");
		this.CmtID = ko.observable(data.CmtID || "");
		
	}

	function PostModel() {
		var self = this;		

	  	self.ListPost = ko.observableArray([]);
		ko.utils.arrayForEach(window.dataSource.ListPost, function(p){
	
			var newPost = new Post(p);
			self.ListPost.push(newPost);
		});

	  	this.selectedItem = ko.observable();
	  	this.addPost = function(){
	  			var message = $('#message').val();
				$('#message').val("");
				var title = $('#title').val();
				$('#title').val("");
				var index = "";
				var PostedID = window.IdAdmin;
				var GivenID = window.UserID;
				var email = "";
				var text = "";
				$.post(window.urlInsert,{PostTitle:title,Content: message, PostUser: PostedID, GivenUser: GivenID},function(data){
					
				
					email = data['Email'];
					index = data["Index"];
					index = Number(index);
				
					var item = {PostID:index,PostTitle:title,Content:message, Email:email,View:0, PostUser: PostedID, GivenUser: GivenID, CmtContent: text};
					var newPost = new Post(item);
					console.log(item);
					self.ListPost.push(newPost);
					
				},"json");

			
	  	}
	  	
	  	this.dellPost = function(post){
	  		if (post.PostUser() == window.IdAdmin || post.GivenUser() == window.IdAdmin){
	  				if (confirm("Do you want to delete this post?") == true){
						self.ListPost.remove(post); 
						$.post(window.urlDell, {PostID: post['PostID']});
					}
	  		}
	  		
	  	}

	  	this.startEdit = function(post){
	  		
	  		 if (post.PostUser() == window.IdAdmin){
	  		 	console.log("Sucess edit");
	  			self.selectedItem(post);
	  		}
	  		
	  	}

	  	this.templateToUse = function(item){

	  		return self.selectedItem() === item ? "editTmpl": "viewTmpl";
	  	}
	  	

	  	this.finishEdit = function(post){
	  		var item = self.selectedItem();

	  		$.post(window.urlEdit,{PostID: item['PostID'], PostTitle: item['PostTitle'], Content: item['Content']});
	  		self.selectedItem(null);
	  	}

	  	this.emailClick = function(post){
	  		var item = post;
	  		window.location.href = window.baseurl + item.GivenUser();
	  	}
	  

	  	this.viewDetail = function(post){

	  		$.post(window.increaseView,{PostID: post['PostID']},function(data){

	  				window.location.href = window.viewUrl + post.PostID();
	  		});
	  	
	  	}
	  	
	  	
	  	this.showCmt = function(item){
	  		$.post(window.showCmtUrl,{PostID: item['PostID']},function(data){
	  			item.Comments(JSON.parse(data));
	  		});
	  	}
	  
	  	this.CmtEvent = function (data, event) { 
	  		if (event.keyCode == 13) 
	  		{
	  			var content = this.CmtContent();
  				var postID = data.PostID();
  				var userID =  window.UserID;	
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

	  
	}

	ko.applyBindings(new PostModel());


	
});