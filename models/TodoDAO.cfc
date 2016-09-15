/**
* I am a new Model Object
*/
component singleton accessors="true"{
	
    // Properties
    property name="datasource" inject="coldbox:datasource:todo";

    /**
     * Constructor
     */
	TodoDAO function init(){
		
		return this;
	}
	
	/**
	* list
	*/
	function list(boolean isDone=false){
		var queryObj = new query();
		queryObj.setDatasource(datasource.name);
		queryObj.setName("qTodoList");
		queryObj.addParam(name="isDone",value="#arguments.isDone#",cfsqltype="bit");
		var result = queryObj.execute(sql="
				SELECT id,title,description,isdone,status,createdate,completiondate,duedate 
				FROM todo 
				WHERE isdone = :isDone
			");

		return result.getResult();
	}

	function save(
			id,
			required title, 
			required description, 
			required isdone, 
			required status, 
			required completiondate, 
			required duedate){
		var queryObj = new query();
		queryObj.setDatasource(datasource.name);
		queryObj.setName("qUpdateTodo");
		queryObj.addParam(name="title",value="#arguments.title#",cfsqltype="varchar");
		queryObj.addParam(name="description",value="#arguments.todo.description#",cfsqltype="varchar");
		queryObj.addParam(name="isdone",value="#arguments.isdone#",cfsqltype="bit");
		queryObj.addParam(name="status",value="#arguments.status#",cfsqltype="integer");
		queryObj.addParam(name="completiondate",value="#arguments.completiondate#",cfsqltype="date", null="#iif(len(arguments.completiondate), "No", "Yes")#");
		queryObj.addParam(name="duedate",value="#arguments.duedate#",cfsqltype="date", null="#iif(len(arguments.duedate), "No", "Yes")#");

		if(! isNull( arguments.id() )) {
			queryObj.addParam(name="id",value="#arguments.id#",cfsqltype="integer");

			var result = queryObj.execute(sql="
				UPDATE todo
				SET title = :title,
					description = :description,
					isdone = :isdone,
					status = :status,
					completiondate = :completiondate,
					duedate = :duedate
				WHERE id = :id
			");

			return arguments.id;
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
		queryObj.setDatasource(datasource.name);
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
		queryObj.setDatasource(datasource.name);
		queryObj.setName("qGetTodo");
		queryObj.addParam(name="id",value="#arguments.id#",cfsqltype="integer");
		var result = queryObj.execute(sql="
				SELECT id,title,description,isdone,status,createdate,completiondate,duedate 
				FROM todo 
				WHERE id = :id
			");
		return result.getResult();
		
	}


}
