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
		mockWireBox = getMockBox().createEmptyMock("coldbox.system.ioc.injector").$("getInstance",todo);
		model.$property( propertyName="wirebox", mock=mockWireBox ); 


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

			it( "should get an todo object", function(){
				var todoObject = model.get( 1 );
                expect( todoObject.getId() ).toBeOfType( "Numeric" );
			});

			xit( "should save a todo", function(){
                expect( false ).toBeTrue();
			});

			xit( "should delete a todo", function(){
                expect( false ).toBeTrue();
			});

		});

	}

}
