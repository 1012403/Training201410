$(document).ready(function(){

	/*Define your own observable @@ */
	ko.protectedObservable = function(initialValue) {
    //private variables
    var _temp = initialValue;
    var _actual = ko.observable(initialValue);

    var result = ko.dependentObservable({
        read: _actual,
        write: function(newValue) {
            _temp = newValue;
        }
    }).extend({ notify: "always" }); //needed in KO 3.0+ for reset, as computeds no longer notify when value is the same
    
    //commit the temporary value to our observable, if it is different
    result.commit = function() {
        if (_temp !== _actual()) {
            _actual(_temp);
        }
    };

    //notify subscribers to update their value with the original
    result.reset = function() {
        _actual.valueHasMutated();
        _temp = _actual();
    };

    return result;
	};

	
	//Create a new observable item
	function ToDoItem(task){
		var self = this;
		self.Activity = ko.protectedObservable(task.Activity);
		self.Date = ko.protectedObservable(task.Date.toLocaleDateString());
		self.From = ko.protectedObservable(task.From);
		self.To = ko.protectedObservable(task.To);
		self.Status = ko.protectedObservable(task.Status);
		self.Note = ko.protectedObservable(task.Note);
		

	}

	function ToDoViewModel(){
		var self = this;

		var myTasks = [
		{Activity:"Coding",Date: new Date(2014,9,14),From:9, To:10, Status:'To-do', Note:'note'},
		{Activity:"Washing",Date: new Date(2014,9,3),From:12, To:15, Status:'Doing', Note:'note'},
		{Activity:"School",Date: new Date(2014,9,15),From:7, To:17, Status:'Done', Note:'note'},
		{Activity:"Sleep",Date: new Date(2014,9,16),From:1, To:7, Status:'To-do', Note:'note'},
		{Activity:"Assignment",Date: new Date(2014,9,16),From:8, To:12, Status:'To-do', Note:'note'},
		
		];

			this.isAddnew = false;

		//Add to list
		this.todos = ko.observableArray([
			new ToDoItem(myTasks[0]),
			new ToDoItem(myTasks[1]),
			new ToDoItem(myTasks[2]),
			new ToDoItem(myTasks[3]),
			new ToDoItem(myTasks[4])]);
		this.selectedItem = ko.observable();

		//add new Task
		this.addList = function(){
			if (!self.selectedItem()){
					var object = {
					Activity:"",Date: new Date(),From:0, To:0, Status:'', Note:''
				};
				var newItem = new ToDoItem(object);
	      		self.todos.push(newItem);
	       		self.selectedItem(newItem);	
	       		self.isAddnew = true;
			}
			
		}
	
		//Change to Edit format 
		this.editList = function(task) {
       		 self.selectedItem(task);
    	};

    	//Remove a task
    	this.removeList = function(task) { 
			if (confirm("Do you want to delete this task?") == true){
				self.todos.remove(task); 
				self.selectedItem(null);
			}
				
		}

		//Save task changes
		this.saveList = function() {
	        self.selectedItem().Activity.commit();
	        self.selectedItem().Date.commit();
	        self.selectedItem().From.commit();
	        self.selectedItem().To.commit();
	        self.selectedItem().Status.commit();
	        self.selectedItem().Note.commit();
	        self.selectedItem(null);
   	    };

   	    //Discharge change
   	    this.cancleList = function() {
   	    	  if (self.isAddnew == true){
	        	self.todos.remove(self.selectedItem());
	        	self.isAddnew = false; 
	        }
	        else{
	        	self.selectedItem().Activity.reset();
	        self.selectedItem().From.reset();
	        self.selectedItem().To.reset();
	        self.selectedItem().Status.reset();
	        self.selectedItem().Note.reset();	
	        }
	        
	      
	        self.selectedItem(null);
	        
   		 };

   		//Change the view template base on the selected item
    	this.templateToUse = function(item) {
        	return self.selectedItem() === item ? "editTmpl" : "itemTmpl";
   		};


   		//Search box implementation
   		this.query = ko.observable("");
   		this.filterResult = ko.computed(function(){
   			var value = this.query().toLowerCase();
   			if (value == ""){
   				return this.todos();
   			}else{
   				return ko.utils.arrayFilter(this.todos(),function(item){
   						if (item.Activity().toLowerCase().indexOf(value) >= 0){
   							  return item.Activity().toLowerCase().indexOf(value) >= 0;		
   						}
   						else if (item.Status().toLowerCase().indexOf(value) >= 0){
   							return item.Status().toLowerCase().indexOf(value) >= 0;
   						}
   						else{
   							return item.Date().toLowerCase().indexOf(value) >= 0;	
   						}
   					
   				});
   			}
   		},this);

   		//List today works implementation
 	  	this.ListToday = ko.computed(function(){
   			var day = new Date().toLocaleDateString();
   			return ko.utils.arrayFilter(this.todos(),function(item){
   							return item.Date().toLowerCase().indexOf(day) >= 0;	
   				});
   		},this);
   	}

	ko.applyBindings(new ToDoViewModel());
});

