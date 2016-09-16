/**
* I am a new handler
*/
component{

	property name="messagebox" inject="messagebox@cbmessagebox";
	property name="todoService" inject="todoService";
	
	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";		
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};
	
	/**
	IMPLICIT FUNCTIONS: Uncomment to use
	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/
		
	/**
    * index  
    */
    function index( event, rc, prc ){
		rc.todoResultSet = todoService.get(0);
    	prc.todolist = todoService.list();
		event.setView( "todo/index" );
	}	

	/**
    * status  
    */
    function status( event, rc, prc ){
		event.setView( "todo/status" );
	}	

	/**
    * delete  
    */
    function delete( event, rc, prc ){
		event.paramValue( "id", 0);
		if(isNumeric(rc.id)){
			todoService.delete(rc.id);
		}
		setNextEvent( "todo/index" );
	}	

	/**
    * editor  
    */
    function editor( event, rc, prc ){
		if(not structKeyExists(rc,"id")){
			rc.id=0;
		}
		rc.todoResultSet = todoService.get(rc.id);
		event.setView( "todo/editor" );
	}	

	/**
    * save  
    */
    function save( event, rc, prc ){
		var oTodo = getInstance("todo");
		event.paramValue( "isdone", 0);
		populateModel(model=oTodo,momento=rc);
		todoService.save(oTodo);
		messagebox.warn( "Todo saved successfully" );
		setNextEvent( "todo/index" );
	}	

	/**
    * view  
    */
    function view( event, rc, prc ){
		event.setView( "todo/view" );
	}	


	
}
