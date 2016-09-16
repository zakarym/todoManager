/*******************************************************************************
*	Integration Test as BDD (CF10+ or Railo 4.1 Plus)
*
*	Extends the integration class: coldbox.system.testing.BaseTestCase
*
*	so you can test your ColdBox application headlessly. The 'appMapping' points by default to 
*	the '/root' mapping created in the test folder Application.cfc.  Please note that this 
*	Application.cfc must mimic the real one in your root, including ORM settings if needed.
*
*	The 'execute()' method is used to execute a ColdBox event, with the following arguments
*	* event : the name of the event
*	* private : if the event is private or not
*	* prePostExempt : if the event needs to be exempt of pre post interceptors
*	* eventArguments : The struct of args to pass to the event
*	* renderResults : Render back the results of the event
*******************************************************************************/
component extends="coldbox.system.testing.BaseTestCase" appMapping="/"{
	
	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();
		// do your own stuff here
	}

	function afterAll(){
		// do your own stuff here
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/
	
	function run(){

		describe( "todo Suite", function(){

			beforeEach(function( currentSpec ){
				// Setup as a new ColdBox request for this suite, VERY IMPORTANT. ELSE EVERYTHING LOOKS LIKE THE SAME REQUEST.
				setup();
			});

			aroundEach(function(struct spec, struct suite){
				// execute the spec
				transaction {
					arguments.spec.body();

					transaction action="rollback";	
				}
			});

			it( "can show all todos", function(){
				var event = execute( event="todo.index", renderResults=true );
				// expectations go here.
				expect( event.getPrivateValue( name="todolist" ) ).toBeArray();
				expect( event.getRenderedContent() ).toInclude( "Incomplete" );
			});

			it( "it can render output as JSON", function(){
				getRequestContext().setValue( "format", "json" );
				var event = execute( event="todo.index", renderResults=true );
				expect( event.getPrivateValue( name="todolist" ) ).toBeArray();
				//debug( event.getRenderedContent() );
				var data = event.getRenderedContent();
				expect( isJSON(data) ).toBeTrue();
			});

			it( "status", function(){
				var event = execute( event="todo.status", renderResults=true );
				// expectations go here.
				expect( false ).toBeTrue();
			});

			it( "delete", function(){
				queryExecute("
						INSERT INTO todo 
						(title,description)
						VALUES
						('Test Todo','Test Description')
					",
					{},
					{datasource="todo",result = "result"});
				var id = result.generatedkey;
				getRequestContext().setValue( "id", id);

				var event = execute( event="todo.delete", renderResults=true );

				var emptyResult = queryExecute("
						SELECT * from todo
						WHERE id = #id#
					",
					{},
					{datasource="todo"});

				var rc = event.getCollection();
				// expectations go here.
				expect( rc ).toHaveKey("setNextEvent_event");
				expect( rc.setNextEvent_event ).toBe("todo/index");
				expect( emptyResult ).toBeEmpty;
			});

			it( "editor", function(){
				var event = execute( event="todo.editor", renderResults=true );
				// expectations go here.
				expect( event.getRenderedContent() ).toInclude( "submit" );
			});

			it( "save", function(){
				//var event = execute( event="todo.save", renderResults=true );
				// expectations go here.
				expect( false ).toBeTrue();
			});

			it( "view", function(){
				var event = execute( event="todo.view", renderResults=true );
				// expectations go here.
				expect( false ).toBeTrue();
			});

		
		});

	}

}
