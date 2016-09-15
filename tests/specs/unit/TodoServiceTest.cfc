/**
* The base model test case will use the 'model' annotation as the instantiation path
* and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
* responsibility to update the model annotation instantiation path and init your model.
*/
component extends="coldbox.system.testing.BaseModelTest" model="root.models.TodoService"{
	
	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		// setup the model
		super.setup();		
		
		// init the model object
		model.init();

		//create a mock
		todo = getMockBox().prepareMock( createObject("component","root.models.Todo") );
		mockWireBox.$("getInstance",todo);
		model.$property( propertyName="wirebox", mock=mockWireBox ); 

		model.$property( propertyName="datasource", mock={ name="todo" } );

		objectPopulator = getMockBox().createMock("coldbox.system.core.dynamic.BeanPopulator");
		model.$property( propertyName="populator", mock=objectPopulator ); 
	}

	function afterAll(){
	}

	/*********************************** BDD SUITES ***********************************/
	
	function run(){

		describe( "TodoService Suite", function(){

			it( "should be an array of todos", function(){
				var todos = model.list();
                expect( todos ).toBeArray();
			});

			it( "should get a todo object", function(){
				var oTodo = model.get( 1 );
                expect( oTodo.getId() ).toBeTypeOf( "Numeric" );
			});

			it( "should add a new todo object", function(){
				transaction{
					var oTodo = getMockBox().prepareMock( createObject("component","root.models.Todo") );

					oTodo.$( "getId" )
						.$( "getTitle", "Test Todo" )
						.$( "getDescription", "This is a test todo" )
						.$( "getIsdone", 0 )
						.$( "getStatus", 1 )
						.$( "getCompletiondate" )
						.$( "getDuedate" );

					var oTodo = model.save( oTodo );
                	expect( oTodo ).toBeTypeOf( "Numeric" );	
					transactionRollback();				
				}
			});

			it( "should delete an existing todo object", function(){
				transaction{
					var oTodo = getMockBox().prepareMock( createObject("component","root.models.Todo") );

					oTodo.$( "getId" )
						.$( "getTitle", "Test Todo" )
						.$( "getDescription", "This is a test todo" )
						.$( "getIsdone", 0 )
						.$( "getStatus", 0 )
						.$( "getCompletiondate" )
						.$( "getDuedate" );

					var oTodo = model.save( oTodo );
					var oTodo = model.delete( oTodo );
                	expect( oTodo ).toBeTrue();	
					transactionRollback();				
				}
			});


			it( "should modify an existing todo object", function(){
				transaction{
					var oTodo = getMockBox().prepareMock( createObject("component","root.models.Todo") );

					oTodo.$( "getId" )
						.$( "getTitle", "Test Todo" )
						.$( "getDescription", "This is a test todo" )
						.$( "getIsdone", 0 )
						.$( "getStatus", 0 )
						.$( "getCompletiondate" )
						.$( "getDuedate" );

					var oTodoId = model.save( oTodo );

					oTodo.$( "getId", oTodoId )
						.$( "getTitle", "Updated Test Todo" )
						.$( "getDescription", "This is an updated test todo" )
						.$( "getIsdone", 1 )
						.$( "getStatus", 1 )
						.$( "getCompletiondate", "2016-09-17" )
						.$( "getDuedate", "2016-09-17" );

					var oTodo = model.save( oTodo );
                	expect( oTodo ).toBeTypeOf( "Numeric" );

					transactionRollback();				
				}
			});

		});

	}

}
