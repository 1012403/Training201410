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
    function ActivityTodo(activity, date, from, to, status, notes) {
        var self = this;
        self.activity = ko.custom.resettableObservable(activity);
        self.date = ko.custom.resettableObservable(date);
        self.from = ko.custom.resettableObservable(from);
        self.to = ko.custom.resettableObservable(to);
        self.status = ko.custom.resettableObservable(status);
        self.notes = ko.custom.resettableObservable(notes);
    }

    // Overall viewmodel for this screen, along with initial state
    function ActivityViewModel() {
        var self = this;

        self.taskSelected = ko.observable();
        self.adding = ko.observable(false);
        self.editing = ko.observable(false);
        self.filter = ko.observable("");
        // Editable data
        self.task = ko.observableArray([
            new ActivityTodo("Study English","1/1/2014","8","10","To-do","xxx"),
            new ActivityTodo("Chat","18/10/2014","8","10","Doing","ccc")
        ]);
        
        self.filterTask = ko.computed( function() {
            var filt = self.filter().toLowerCase();
            if(filt == "")
            {
                return self.task();
            }
            else
            {
                return ko.utils.arrayFilter(self.task(), function(Task) {
                    var temp = Task.activity().toLowerCase();
                    return ((Task.activity().toLowerCase().indexOf(filt) !== -1) || (Task.date().toLowerCase().indexOf(filt) !== -1) || (Task.status().toLowerCase().indexOf(filt) !== -1));//ko.utils.stringStartsWith(temp,filt);
                });
            }
        }, self);

        self.total = ko.computed( function() {
            return 'Total (' + (self.task().length).toString() + ')';
        });
        self.templateToUse = function(item) {
            return self.taskSelected() === item ? "editTmpl" : "itemTmpl";
        };

        self.ListToday = ko.computed( function() {
            return ko.utils.arrayFilter(self.task(), function(Task) {
                var d = new Date();
                var m = Task.date().split("/");
                return m[0] == d.getDate().toString() && m[1] == (d.getMonth()+1).toString() && m[2] == d.getFullYear().toString();  //
            })
        }, self);

        self.addAct = function() {
            var newbie = new ActivityTodo('','','','','','');
            self.task.push(newbie);
            self.taskSelected(newbie);
            self.adding(true);
        }
        self.removeAct = function(Act){
            if (confirm("Delete this task ?") == true) {
                self.task.remove(Act);
                self.taskSelected(null);
            }        
        }
        self.edit = function(item) {
            self.taskSelected(item);
            self.adding(true);
            self.editing(true);
        }
        self.save = function(item) {
            self.taskSelected(null)
            self.adding(false);
        }
        self.cancel = function(item) { //http://www.keepinguptodate.com/2013/08/resettable-observable-with-knockout/
            self.taskSelected().activity.reset();
            self.taskSelected().date.reset();
            self.taskSelected().from.reset();
            self.taskSelected().to.reset();
            self.taskSelected().status.reset();
            self.taskSelected().notes.reset();
            if(self.adding() && !(self.editing()))
            {
                self.task.remove(self.taskSelected());
            }                
            self.taskSelected(null);
            self.adding(false);
            self.editing(false);
        };
    }

    ko.applyBindings(new ActivityViewModel());
});