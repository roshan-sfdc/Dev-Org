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
 /*
 	Test Cases
 	1.Test for getDats() and setData methods
 	2.Test for addRow() method
 	3.Test for save() method
 	
 */
@isTest
private class AddControllerTest {

    static testMethod void test_getdata_setdata() 
    {
    	 test.startTest();
    	 	Pagereference ref=Page.AddNewProduct;
 			Test.setCurrentPage(ref);
 			AddController objCont=new AddController();
 			Product2 obj=new Product2(Name='TestName',Company__c='TestCom',Description='TestDescription',Product_Type__c='TestType');
 			objCont.setData(obj);
 			List<Product2> lstProd=objCont.getData();
 			system.assert(lstProd.size()>0);
    	 test.stopTest();  
    }
     static testMethod void test_AddRow() 
    {
    	 test.startTest();
    	 	Pagereference ref=Page.AddNewProduct;
 			Test.setCurrentPage(ref);
 			AddController objCont=new AddController();
 			Integer before_add=objCont.lstProd.size();
 			objCont.addrow();
 			system.assert(objCont.lstProd.size()==(before_add+1));
    	 test.stopTest();  
    }
     static testMethod void test_save() 
    {
    	 test.startTest();
    	 	Pagereference ref=Page.AddNewProduct;
 			Test.setCurrentPage(ref);
 			AddController objCont=new AddController();
 			Product2 obj=new Product2(Name='TestName',Company__c='TestCom',Description='TestDescription',Product_Type__c='TestType');
 			List<Product2> lstProd=new List<Product2>();
 			lstProd.add(obj);
 			objCont.lstProd=lstProd;
 			objCont.save();
		 test.stopTest();  
    }
    
}