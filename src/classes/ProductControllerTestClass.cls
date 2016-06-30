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
 	1.Test for getSearch() method
 	2.Test for page_Add_Products() method
 	
 */
@isTest
private class ProductControllerTestClass {

    static testMethod void search_Test()
    {
    	//Use the PageReference Apex class to instantiate a page
 		
 		test.startTest();
 			Pagereference ref=Page.ProductPage;
 			Test.setCurrentPage(ref);
 		//creating an object of ProductController
 			ProductController objCont=new ProductController();
 			List<Product2> lstProd=new List<Product2>();
 		//creating 10 records of Product2	
 			for(Integer i=0;i<9;i++)
 			{
 				Product2 objProd=new Product2(Name='TestName_Hardware',Company__c='TestCom'+i,Description='TestDesciption'+i,Product_Type__c='Hardware');
 				lstProd.add(objProd);
 			}
 			insert lstProd;
 			List<Product2> lstProd2=new List<Product2>();
 		//creating 10 records of Product2	
 			for(Integer i=0;i<9;i++)
 			{
 				Product2 objProd=new Product2(Name='TestName_Hardware',Company__c='TestCom'+i,Description='TestDesciption'+i,Product_Type__c='Software');
 				lstProd.add(objProd);
 			}
 			insert lstProd2;
 		//setting ProductType to Hardware	
 			objCont.setptype('Hardware');
 			String ptype=objCont.getptype();
 			system.assert(ptype.trim().equalsIgnoreCase('Hardware'));
 		//creating a list of type Product2	
 			List<Product2> lstProd3=new List<Product2>();
 		//calling getSearch() method of ProductController
 			lstProd3=objCont.getsearch();
 			for(Integer i=0;i<lstProd.size();i++)
 			{
 				system.assert(lstProd3.get(0).Name=='TestName_Hardware');
 			}
 			Url url=system.URL.getSalesforceBaseUrl();
 			system.assert(objCont.getLink().trim().equalsIgnoreCase(url.toExternalForm()));
 		test.stopTest();
    }	
    public static void test_page_Add_Product()
    {
    	test.startTest();
	    	ProductController objCont=new ProductController();
	    	objCont.page_Add_Products();
    	test.stopTest();
    }
    public static void test_getLink()
    {
    	test.startTest();
	    	ProductController objCont=new ProductController();
	    	Url url=system.URL.getSalesforceBaseUrl();
	 		system.assert(objCont.getLink().trim().equalsIgnoreCase(url.toExternalForm()));
 		test.stopTest();
    }
 			
    
}