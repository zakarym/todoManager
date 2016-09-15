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
	function save(required todo){
		var queryObj = new query();
		queryObj.setDatasource("todo");
		queryObj.setName("qUpdateTodo");
		queryObj.addParam(name="title",value="#arguments.todo.getTitle()#",cfsqltype="varchar");
		queryObj.addParam(name="description",value="#arguments.todo.getDescription()#",cfsqltype="varchar");
		queryObj.addParam(name="isdone",value="#arguments.todo.getIsdone()#",cfsqltype="bit");
		queryObj.addParam(name="status",value="#arguments.todo.getStatus()#",cfsqltype="integer");
		queryObj.addParam(name="completiondate",value="#arguments.todo.getCompletiondate()#",cfsqltype="date", null="#iif(len(arguments.todo.getCompletiondate()), DE("No"), DE("Yes"))#");
		queryObj.addParam(name="duedate",value="#arguments.todo.getDuedate()#",cfsqltype="date", null="#iif(len(arguments.todo.getDuedate()), DE("No"), DE("Yes"))#");

		if(! isNull( arguments.todo.getId() )) {
			queryObj.addParam(name="id",value="#arguments.todo.getId()#",cfsqltype="integer");

			var result = queryObj.execute(sql="
				UPDATE todo
				SET title = :title,
					description = :description,
					isdone = :isdone,
					status = :status,
					createdate = getDate(),
					completiondate = :completiondate,
					duedate = :duedate
				WHERE id = :id
			");

			return arguments.todo.getId();
		} else {
			var result = queryObj.execute(sql="
					SET nocount ON
					INSERT INTO todo 
					(title,description,isdone,status,createdate,completiondate,duedate)
					VALUES
					(:title,:description,:isdone,:status,getDate(),:completiondate,:duedate)
					SELECT SCOPE_IDENTITY() as id
					SET nocount OFF
				");

			return result.getResult().id[1];
		}
	}

	/**
	* delete
	*/
	function delete(required numeric id){
		var queryObj = new query();
		queryObj.setDatasource("todo");
		queryObj.setName("qDeleteTodo");
		queryObj.addParam(name="id",value="#arguments.id#",cfsqltype="integer");
		
		var result = queryObj.execute(sql="
				DELETE
				FROM todo 
				WHERE id = :id
			");

		return true;
	}

	/**
	* get
	*/
	function get(required numeric id){
		var queryObj = new query();
		queryObj.setDatasource("todo");
		queryObj.setName("qGetTodo");
		queryObj.addParam(name="id",value="#arguments.id#",cfsqltype="integer");
		var result = queryObj.execute(sql="
				SELECT id,title,description,isdone,status,createdate,completiondate,duedate 
				FROM todo 
				WHERE id = :id
			");
		var qGetTodo = result.getResult();
		
		if(qGetTodo.recordcount) {
			var oTodo = populator.populateFromQuery( 
				target = wirebox.getInstance( "todo" ),
				qry = qGetTodo
			);

			return oTodo;
		} else {
			throw(message = "There is no Todo record with id:#arguments.id#");
		}
		
	}


}
