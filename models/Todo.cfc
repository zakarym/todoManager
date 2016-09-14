/**
* I am a new Model Object
*/
component accessors="true"{
	
    // Properties
    property name="id" type="string";	property name="title" type="string";	property name="description" type="string";	property name="isdone" type="string";	property name="status" type="string";	property name="createdate" type="string";	property name="completeDate" type="string";	property name="duedate" type="string";	

    /**
     * Constructor
     */
	todo function init(){
		
		return this;
	}
	

}
