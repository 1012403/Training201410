$(document).ready(function(){

	function Post(data){
		this.Content = ko.observable(data.Content || "");
		this.Email = ko.observable(data.Email || "");
		this.PostID = ko.observable(data.PostID || "");
		this.PostTitle = ko.observable(data.PostTitle || "");
		this.UserID = ko.observable(data.UserID || "");
		this.Comments = ko.observable(data.Comments || []);
		this.searchText = ko.observable(data.searchText || "");
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
					index = data['Index'];
				},"json");
				index = Number(index) + 1;

				var post = {PostID:index,PostTitle:title,Content:message, Email:email, UserID: GivenID, searchText: text};
				console.log(post);
				self.ListPost.push(post);
			
	  	}
	  	
	  	this.dellPost = function(post){
	  		if (confirm("Do you want to delete this post?") == true){
				self.ListPost.remove(post); 
				$.post(window.urlDell, {PostID: post['PostID']});
			}
	  	}

	  	this.startEdit = function(task){
	  		self.selectedItem(task);
	  	}

	  	this.templateToUse = function(item){
	  		return self.selectedItem() === item ? "editTmpl": "viewTmpl";
	  	}
	  	

	  	this.finishEdit = function(){
	  		var item = self.selectedItem();
	  		$.post(window.urlEdit,{PostID: item['PostID'], PostTitle: item['PostTitle'], Content: item['Content']});
	  		self.selectedItem(null);
	  	}

	  	this.emailClick = function(task){
	  		var item = task;
	  		window.location.href = window.baseurl + task['UserID'];
	  	}

	  	this.viewDetail = function(item){
	  		window.location.href = window.viewUrl + task['PostID'];
	  	}
	  	
	  	
	  	this.showCmt = function(item){
	  		$.post(window.showCmtUrl,{PostID: item['PostID']},function(data){
	  			item.Comments(JSON.parse(data));
	  		});
	  	}
	  
	  	this.searchKeyboardCmd = function (data, event) { 
	  		if (event.keyCode == 13) 
	  		{
	  			var content = this.searchText();
  				console.log(content);
	  			this.searchText("");
	  			
	  			return true;	
	  		}
	  		return true;
	  	
	  	};

	  
	}


	
	

	ko.applyBindings(new PostModel());


	
});