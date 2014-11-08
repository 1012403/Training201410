$(document).ready(function(){

	function CommentModel() {
		var self = this;
		
		console.log(window.dataSource.ListCmt);
	  	this.ListCmt = ko.observableArray(window.dataSource.ListComment);
	  	
	  	
	}

	ko.applyBindings(new CommenttModel());
});