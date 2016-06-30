/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class LeadManipulationTest {
	
	/*
	  Test Conditions
	  1.Lead creation is successfull
	  2.Lead creation fails
	  3.Lead Deletion is successfull
	  4.Lead Deletion fails
	  5.Lead updation is successfull
	  6.Lead updation fails
	*/
  //declaring a final string variable	
	public static final string SUCCESS='success';

//test method for  Test Condition 1
    static testMethod void doCreateTest() 
    {
        RestRequest req=new RestRequest();
        RestResponse res=new RestResponse();
        Url url=system.URL.getSalesforceBaseUrl();
		req.requestURI=url+'/services/apexrest/Lead';
		req.httpMethod='POST';
		test.startTest();
		//adding parameters to the req object
			req.addParameter('firstname','TestFirstName');
			req.addParameter('lastname','TestLastName');
			req.addParameter('email','test@test.com');
			req.addParameter('phone','111111');    
			RestContext.request=req;
			RestContext.response=res;
		//creating an object of inner class	
			LeadManipulatorClass.ReponseParameters obj=LeadManipulatorClass.doCreate();
	    //checking assertions for the three parameters which are to be sent by the Service		
			system.assert(obj.isSuccess); 
			system.assert(obj.lead!=NULL);
			system.assert(obj.status.trim().equalsIgnoreCase(SUCCESS));
		test.stopTest();
    }
    //test method for  Test Condition 2
     static testMethod void doCreateTestFail() 
    {
        RestRequest req=new RestRequest();
        RestResponse res=new RestResponse();
		Url url=system.URL.getSalesforceBaseUrl();
		req.requestURI=url+'/services/apexrest/Lead';
		req.httpMethod='POST';
		test.startTest();
		//adding parameters to the req object
			req.addParameter('firstname','TestFirstName');
			req.addParameter('lastname','TestLastName');
			req.addParameter('email','test');
			req.addParameter('phone','111111');    
			RestContext.request=req;
			RestContext.response=res;
		//creating an object of inner class	
			LeadManipulatorClass.ReponseParameters obj=LeadManipulatorClass.doCreate();
			system.assert(!obj.isSuccess); 
			system.assert(obj.lead=='');
			system.assert(obj.status=='Could not create a new Lead');
		test.stopTest();
    }
   //test method for  Test Condition 3
    static testMethod void doDeleteTest()
    {
    	RestRequest req=new RestRequest();
    	RestResponse res=new RestResponse();
    	Url url=system.URL.getSalesforceBaseUrl();
		req.requestURI=url+'/services/apexrest/Lead';
    	req.httpMethod='DELETE';
    	test.startTest();   
    	    Lead objLead=new Lead(FirstName='TestFirstName',LastName='TestLastName',Email='test@test.com',Phone='111111',Company='ABC',Status='ClosedConverted');
    	    insert objLead;
    	 //adding parameters to the req object   
    	    req.addParameter('firstname','TestFirstName');
			req.addParameter('lastname','TestLastName');
			req.addParameter('email','test@test.com');
			req.addParameter('phone','111111'); 
			RestContext.request=req;
			RestContext.response=res;
		//creating an object of inner class
			LeadManipulatorClass.ReponseParameters obj=LeadManipulatorClass.doDelete();
		//checking assertions for the three parameters which are to be sent by the Service	
			system.assert(obj.isSuccess); 
			system.assert(obj.lead!=NULL);
			system.assert(obj.status.trim().equalsIgnoreCase(SUCCESS));
		test.stopTest();	
    }   
    //test method for  Test Condition 4
    static testMethod void doDeleteTestFail()
    {
    	RestRequest req=new RestRequest();
    	RestResponse res=new RestResponse();
    	Url url=system.URL.getSalesforceBaseUrl();
		req.requestURI=url+'/services/apexrest/Lead';
    	req.httpMethod='DELETE';
    	test.startTest();  
    	    Lead objLead=new Lead(FirstName='TestFirstName',LastName='TestLastName',Email='kk@kk.com',Phone='111111',Company='ABC',Status='ClosedConverted');
    	    insert objLead;
    	  //adding parameters to the req object   
    	    req.addParameter('firstname','TestFirstName');
			req.addParameter('lastname','TestLastName');
			req.addParameter('email','test@test.com');
			req.addParameter('phone','111111'); 
			RestContext.request=req;
			RestContext.response=res;
		//creating an object of inner class	
			LeadManipulatorClass.ReponseParameters obj=LeadManipulatorClass.doDelete();
		//checking assertions for the three parameters which are to be sent by the Service		
			system.assert(!obj.isSuccess); 
			system.assert(obj.lead=='');
			system.assert(obj.status=='Could not delete the Lead');
		test.stopTest();	
    }   
   //test method for  Test Condition 5 
    static testMethod void doUpdateTest()
    {
    	RestRequest req=new RestRequest();
    	RestResponse res=new RestResponse();
    	Url url=system.URL.getSalesforceBaseUrl();
		req.requestURI=url+'/services/apexrest/Lead';
    	req.httpMethod='PATCH';
    	test.startTest();
    		Lead objLead=new Lead(FirstName='TestFirstName',LastName='TestLastName',Email='test@test.com',Phone='111111',Company='ABC',Status='ClosedConverted');
    		insert 	objLead;
    	//adding parameters to the req object 	
    	    req.addParameter('firstname','TestFirstName');
			req.addParameter('lastname','TestLastName');
			req.addParameter('email','gg@gg.com');
			req.addParameter('phone','2222222'); 
			RestContext.request=req;
			RestContext.response=res;
		//creating an object of inner class	
			LeadManipulatorClass.ReponseParameters obj=LeadManipulatorClass.doUpdate();
	    //checking assertions for the three parameters which are to be sent by the Service		
			system.assert(obj.isSuccess); 
			system.assert(obj.lead!=NULL);
			system.assert(obj.status.trim().equalsIgnoreCase(SUCCESS));	
    	test.stopTest();
    }
    //test method for  Test Condition 5 
    static testMethod void doUpdateTestFail()
    {
    	RestRequest req=new RestRequest();
    	RestResponse res=new RestResponse();
    	Url url=system.URL.getSalesforceBaseUrl();
		req.requestURI=url+'/services/apexrest/Lead';
    	req.httpMethod='PATCH';
    	test.startTest();
    		Lead objLead=new Lead(FirstName='TestFirstName',LastName='TestLastName',Email='test@test.com',Phone='111111',Company='ABC',Status='ClosedConverted');
    		insert 	objLead;
    	//adding parameters to the req object 	
    	    req.addParameter('firstname','TestFirstName');
			req.addParameter('lastname','TestLastName');
			req.addParameter('email','gggg');
			req.addParameter('phone','2222222'); 
			RestContext.request=req;
			RestContext.response=res;
		//creating an object of inner class	
			LeadManipulatorClass.ReponseParameters obj=LeadManipulatorClass.doUpdate();
	    //checking assertions for the three parameters which are to be sent by the Service		
			system.assert(!obj.isSuccess); 
			system.assert(obj.lead=='');
			system.assert(obj.status=='Could not update the Lead');	
    	test.stopTest();
    }
}