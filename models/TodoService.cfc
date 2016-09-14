/**
* I am a new Model Object
*/
component singleton accessors="true"{
	
    // Properties
    property name="populator" inject="wirebox:populator";
    property name="wirebox" inject="wirebox";

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
		var queryObj = new query();
		queryObj.setDatasource("todo");
		queryObj.setName("qTodoList");
		queryObj.addParam(name="isDone",value="#arguments.isDone#",cfsqltype="bit");
		var result = queryObj.execute(sql="
				SELECT id,title,description,isdone,status,createdate,completiondate,duedate 
				FROM todo 
				WHERE isdone = :isDone
			");
		var qTodoList = result.getResult();
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
	function save(){
		
	}

	/**
	* delete
	*/
	function delete(){
		
	}

	/**
	* get
	*/
	function get(required numeric id){
		var queryObj = new query();
		queryObj.setDatasource("todo");
		queryObj.setName("qTodoList");
		queryObj.addParam(name="id",value="#arguments.id#",cfsqltype="integer");
		var result = queryObj.execute(sql="
				SELECT id,title,description,isdone,status,createdate,completiondate,duedate 
				FROM todo 
				WHERE id = :id
			");
		var qTodo = result.getResult();
		
		var oTodo = populator.populateFromStruct( 
			target = wirebox.getInstance( "todo" ),
			memento = qTodo
		);

		return oTodo;
		
	}


}
