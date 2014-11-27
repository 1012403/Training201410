ko.custom = ko.custom || {}; // Create our own custom namespace

ko.custom.resettableObservable = function (value) {

    var observable = ko.observable(value), // The inner observable
        initialValue = value;
    
    observable.reset = function () { // Adding a reset method
        observable(initialValue);
    };

    observable.isInitialValue = function () { // Determine if it is inital value
        return observable() === initialValue;
    };    
    
    return observable;    
};

$(document).ready(function () {
    function Post(post_id, user_id, post_content, post_time, user_post, username1, username2, comments, url ) {
        var self = this;
        self.post_id = ko.custom.resettableObservable(post_id);
        self.user_id = ko.custom.resettableObservable(user_id);
        self.post_content = ko.custom.resettableObservable(post_content);
        self.post_time = ko.custom.resettableObservable(post_time);
        self.user_post = ko.custom.resettableObservable(user_post);
        self.username1 = ko.custom.resettableObservable(username1);
        self.username2 = ko.custom.resettableObservable(username2);
        self.comments = ko.observableArray(comments);
        var u = 'userpage/index/' + username2;
        self.url = ko.custom.resettableObservable(u);
    }
    function Comment(cmpost_id, comment_id, cmuser_id, comment_content, comment_time, username, url)
    {
        var self = this;
        self.post_id = ko.custom.resettableObservable(cmpost_id);
        self.comment_id = ko.custom.resettableObservable(comment_id);
        self.user_id = ko.custom.resettableObservable(cmuser_id);
        self.comment_content = ko.custom.resettableObservable(comment_content);
        self.comment_time = ko.custom.resettableObservable(comment_time);
        self.username = ko.custom.resettableObservable(username);
        var u = 'userpage/index/' + username;
        self.url = ko.custom.resettableObservable(u);
    }
    // Overall viewmodel for this screen, along with initial state
    function PostViewModel() {
        var self = this;
        var us_id;
        var us_name;
        //var user_name;
        // Editable data
        self.postSelected = ko.observable();
        self.CmSelected = ko.observable();
        self.posts = ko.observableArray([]);
        self.comment = ko.observable('');
        var burl = window.location.origin;
        $.ajax({
             type:"POST",
             url:burl + "/Project/index.php/home/get_user",
             async:false,
             success:function (data) {
                us_id = data;
             }
        });
        $.ajax({
             type:"POST",
             url:burl + "/Project/index.php/home/get_username",
             async:false,
             success:function (data) {
                us_name = data;
             }
        });
        /*$.ajax({
            url:"../post.php",
            type: "post",            
            success:function (data) {
                var postdata = JSON.parse(data);
                
                postdata.forEach( function (arrayItem)
                {
                    var newPost = new Post(arrayItem.post_id, arrayItem.usid1, arrayItem.post_content, 
                                arrayItem.post_time, arrayItem.usid2, arrayItem.usernane1, arrayItem.username2, []);
                    arrayItem.comments.forEach(function (arrayItem1)
                    {
                       var newComment = new Comment(arrayItem1.post_id, arrayItem1.comment_id, arrayItem1.user_id, 
                                                arrayItem1.comment, arrayItem1.comment_time, arrayItem1.username); 

                        newPost.comments.unshift(newComment);
                        
                    });
                    
                    //Push new post 
                    self.posts.push(newPost);
                });              
            }
        });*/
        
        self.filtPost = ko.computed( function() {
            var info = $('#info').attr('page');
            if(info != 'userpage')
            {
                $.ajax({
                    url:"../post.php",
                    type: "post", 
                    async:false,           
                    success:function (data) {
                        var postdata = JSON.parse(data);
                        
                        postdata.forEach( function (arrayItem)
                        {
                            var newPost = new Post(arrayItem.post_id, arrayItem.usid1, arrayItem.post_content, 
                                        arrayItem.post_time, arrayItem.usid2, arrayItem.usernane1, arrayItem.username2, []);
                            arrayItem.comments.forEach(function (arrayItem1)
                            {
                               var newComment = new Comment(arrayItem1.post_id, arrayItem1.comment_id, arrayItem1.user_id, 
                                                        arrayItem1.comment, arrayItem1.comment_time, arrayItem1.username); 

                                newPost.comments.unshift(newComment);
                                
                            });
                            
                            //Push new post 
                            self.posts.push(newPost);
                        });              
                    }
                });
            }
            else
            {   
                var usn = $('#username').attr('value');
                $.ajax({
                    url:burl  + '/Project/user.php',
                    type: "post",  
                    data: {mydata : JSON.stringify([usn])},         
                    success:function (data) {
                        var postdata = JSON.parse(data);
                        
                        postdata.forEach( function (arrayItem)
                        {
                            var newPost = new Post(arrayItem.post_id, arrayItem.usid1, arrayItem.post_content, 
                                        arrayItem.post_time, arrayItem.usid2, arrayItem.usernane1, arrayItem.username2, []);
                            arrayItem.comments.forEach(function (arrayItem1)
                            {
                               var newComment = new Comment(arrayItem1.post_id, arrayItem1.comment_id, arrayItem1.user_id, 
                                                        arrayItem1.comment, arrayItem1.comment_time, arrayItem1.username); 

                                newPost.comments.unshift(newComment);                                
                            });
                            
                            //Push new post 
                            self.posts.push(newPost);
                        });              
                    }
                });
            }
        });
        
        
        self.AddPost = function()
        {
            var username2 = $('#username').attr('value');
            var p_ct = $('#post-content').val();
            var user_id2;
            $.ajax({
                 type:"POST",
                 url:"../get_userid",
                 async:false, 
                 data: {mydata : JSON.stringify([username2])}, 
                 success:function (data) {
                    user_id2 = data;
                 }
            });
            $.ajax({
                 type:"POST",
                 url:burl  + '/Project/index.php/home/insert_post',
                 data: {mydata : JSON.stringify([us_id,p_ct,user_id2])}, 
                 success:function (data1) {
                    var now = new Date(); 
                    var newPost = new Post(data1, us_id, p_ct, now.getFullYear()+'-'+now.getMonth()+'-'+now.getDate()+' '+now.getHours()+':'+now.getMinutes()+':'+now.getSeconds(),
                                 user_id2, us_name, username2, []);
                    self.posts.unshift(newPost);
                 }
            });
            $('#post-content').val('');
        };
        self.AddComment = function(d,e)
        {            
            if(e.which == '13')
            {                
                var content = $(e.target).val();
                var postid = $(e.target).parent().attr('pid');
                var username = $('.username').attr('id');
                $(e.target).val('');
                var user_id = $('.post-area').attr('uid');
                $.ajax({
                     type:"POST",
                     url:"./home/insert_comment",
                     data: {mydata : JSON.stringify([postid,user_id,content])}, 
                     success:function (data1) {
                        var now = new Date(); 
                        var newComment = new Comment(postid, data1, user_id, content, now.getFullYear()+'-'+now.getMonth()+'-'+now.getDate()+' '+now.getHours()+':'+now.getMinutes()+':'+now.getSeconds(),
                                     username);
                        ko.utils.arrayForEach(self.posts(), function(arrayItem)
                        {
                            if(arrayItem.post_id() == postid)
                            {
                                arrayItem.comments.push(newComment);
                            }
                        });
                     }
                });
                return false;
            }
            return true;
        };

        self.DeletePost = function(d,e)
        {            
            var usn = $('#username').attr('value');
            if (d.username2() == usn && confirm("Bạn có muốn xóa bài viết này ?") == true) 
            {
                var post_id = d.post_id();
                self.posts.remove(d);
                $.ajax({
                     type:"POST",
                     url:"./home/delete_post",
                     data: {mydata : JSON.stringify([post_id])}
                });
            }
        };

        self.DeleteComment = function(d,e)
        {
            var usn = $('#username').attr('value');
            if (d.username() == usn && confirm("Bạn có muốn xóa bình luận này ?") == true) 
            {
                var comment_id = d.comment_id();
                var post_id = d.post_id();
                self.posts().forEach( function (arrayItem)
                {   
                    if(arrayItem.post_id() == post_id)
                    {
                        arrayItem.comments().forEach(function (arrayItem1)
                        {
                            if(arrayItem1.comment_id() == comment_id)
                            {
                                arrayItem.comments.remove(arrayItem1);
                            }
                        })
                    }                
                });

                $.ajax({
                     type:"POST",
                     url:"./home/delete_comment",
                     data: {mydata : JSON.stringify([comment_id])}
                });
            }
        }

         self.templateToUse = function(item) {
            return self.postSelected() === item ? "editTmpl" : "itemTmpl";
        };
        self.templateCmToUse = function(item) {
            return self.CmSelected() === item ? "editCmTmpl" : "itemCmTmpl";
        };

        self.EditPost = function(d,e)
        {
            var usn = $('#username').attr('value');
            if (d.username2() == usn)
            {
                self.postSelected(d);
            }            
        }
        self.EditComplete = function(d,e)
        {   
            if(e.which == '13')
            {
                var post_id = d.post_id(); 
                var post_content = d.post_content(); 
                var now = new Date(); 
                d.post_time(now.getFullYear()+'-'+now.getMonth()+'-'+now.getDate()+' '+now.getHours()+':'+now.getMinutes()+':'+now.getSeconds());             
                self.postSelected(null);
                $.ajax({
                     type:"POST",
                     url:"./home/update_post",
                     data: {mydata : JSON.stringify([post_id,post_content])}
                });
                return false;
            }
            return true;
        }
        self.Cancel = function(item) 
        {
            self.postSelected().post_content.reset();
            self.postSelected(null);
        }

        self.EditComment = function(d,e)
        {            
            var usn = $('#username').attr('value');
            if (d.username() == usn)
            {
                self.CmSelected(d);                
            }
        }
        self.EditCmComplete = function(d,e)
        {   
            if(e.which == '13')
            {
                var comment_id = d.comment_id(); 
                var comment_content = d.comment_content(); 
                var now = new Date(); 
                d.comment_time(now.getFullYear()+'-'+now.getMonth()+'-'+now.getDate()+' '+now.getHours()+':'+now.getMinutes()+':'+now.getSeconds());             
                self.CmSelected(null);
                $.ajax({
                     type:"POST",
                     url:"./home/update_comment",
                     data: {mydata : JSON.stringify([comment_id,comment_content])}
                });
                return false;
            }
            return true;
        }
        self.CancelCm = function(item) 
        {
            self.CmSelected().comment_content.reset();
            self.CmSelected(null);
        }
     };
    ko.applyBindings(new PostViewModel());
});


//now.getFullYear()+'-'+now.getMonth()+'-'+now.getDate()+' '+now.getHours()+'-'+now.getMinutes()+'-'+now.getSeconds()

/*
$.ajax({
            url:"../post.php",
            type: "post",            
            success:function (data) {
                var postdata = JSON.parse(data);
                
                postdata.forEach( function (arrayItem)
                {
                    var newPost = new Post(arrayItem.post_id, arrayItem.usid1, arrayItem.post_content, 
                                arrayItem.post_time, arrayItem.usid2, arrayItem.usn1, arrayItem.usn2, []);
                    $.ajax({
                        url:"../comment.php",
                        type: "post",   
                        async: false,         
                        success:function (data1) {                            
                            var cmdata = JSON.parse(data1);
                            cmdata.forEach( function (arrayItem1)
                            {
                                if(arrayItem1.post_id == arrayItem.post_id) {
                                    var newComment = new Comment(arrayItem1.post_id, arrayItem1.comment_id, arrayItem1.user_id, 
                                                arrayItem1.comment, arrayItem1.comment_time, arrayItem1.username); 
                                    newPost.comments.push(newComment);
                                }
                            }); 
                        }
                    });
                    //Push new post 
                    self.posts.push(newPost);
                });                
            }
        });
     }
*/