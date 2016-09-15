/**
* The base model test case will use the 'model' annotation as the instantiation path
* and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
* responsibility to update the model annotation instantiation path and init your model.
*/
component extends="coldbox.system.testing.BaseModelTest" model="models.TodoDAO"{
	
	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		// setup the model
		super.setup();		
		
		// init the model object
		model.init();
	}

	function afterAll(){
	}

	/*********************************** BDD SUITES ***********************************/
	
	function run(){

		describe( "TodoDAO Suite", function(){
			
			xit( "should list", function(){
                expect( false ).toBeTrue();
			});

			xit( "should save", function(){
                expect( false ).toBeTrue();
			});

			xit( "should delete", function(){
                expect( false ).toBeTrue();
			});

			xit( "should get", function(){
                expect( false ).toBeTrue();
			});


		});

	}

}
