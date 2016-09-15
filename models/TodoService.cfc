/**
* I am a new Model Object
*/
component singleton accessors="true"{
	
    // Properties
    property name="populator" inject="wirebox:populator";
    property name="wirebox" inject="wirebox";
    property name="todoDAO" inject="TodoDAO";

    /**
     * Constructor
     */
	TodoService function init(){
		
		return this;
	}
	
	/**
	* list
	*/
	function list(boolean isDone=false){
		var qTodoList = todoDAO.list(arguments.isDone);
		var arResult = [];
		for (var row in qTodoList) {
			arResult.append( 
				populator.populateFromStruct( 
					target = wirebox.getInstance( "todo" ),
					memento = row
				)
			);
		}

		return arResult;
	}

	/**
	* save
	*/
	function save(required todo){

		return todoDAO.save(
			arguments.todo.getId(),
			arguments.todo.getTitle(),
			arguments.todo.getDescription(),
			arguments.todo.getIsdone(),
			arguments.todo.getStatus(),
			arguments.todo.getCompletiondate(),
			arguments.todo.getDuedate()
		)
	}

	/**
	* delete
	*/
	function delete(required numeric id){
		var qTodoDelete = todoDAO.delete(arguments.id);

		return true;
	}

	/**
	* get
	*/
	function get(required numeric id){
		var qGetTodo = todoDAO.get(arguments.id);
		
		//if(qGetTodo.recordcount) {
			var oTodo = populator.populateFromQuery( 
				target = wirebox.getInstance( "todo" ),
				qry = qGetTodo
			);

			return oTodo;
		//} else {
		//	throw(message = "There is no Todo record with id:#arguments.id#");
		//}
		
	}


}
