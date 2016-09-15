/**
* I am a new Model Object
*/
component accessors="true"{
	
    // Properties
    property name="id" type="string";
	property name="title" type="string";
	property name="description" type="string";
	property name="isdone" type="string";
	property name="status" type="string";
	property name="createdate" type="string";
	property name="completiondate" type="string";
	property name="duedate" type="string";
	

    /**
     * Constructor
     */
	todo function init(){
		variables.title="";
		variables.description="";
		variables.isdone = 0;
		variables.status = 0;
		variables.duedate = DateAdd('d',10,now());
		variables.completiondate = "";
		variables.createdate = "";

		return this;
	}
	

}
