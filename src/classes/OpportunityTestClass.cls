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
@isTest (seeAllData=true)
private class OpportunityTestClass {
	static PriceBook2 objPBook_stndrd=[select id, name, isActive from Pricebook2 where IsStandard = true limit 1];
    static testMethod void test_getOpporDetails()
    {
    	Pagereference ref=Page.Oppor;
    	Test.setCurrentPage(ref);
    	test.startTest();
    		Opportunity objOpp=new Opportunity(Name='TestName',StageName='Closed Lost',CloseDate=Date.valueof('2012-12-12'));
    		insert objOpp;
    		OpporController objCont=new OpporController();
    		String Id=objOpp.Id;
    		objCont.SetMP(Id);
    		List<Opportunity> lstOppor=objCont.getOpporDetails();
    		system.assert(lstOppor.size()!=0);
    	test.stopTest();
    }
    static testMethod void test_getLink()
    {
    	test.startTest();
    		Pagereference ref=Page.Oppor;
    		Test.setCurrentPage(ref);
	    	OpporController objCont=new OpporController();
	    	Url url=system.URL.getSalesforceBaseUrl();
	 		system.assert(objCont.getLink().trim().equalsIgnoreCase(url.toExternalForm()));
 		test.stopTest();
    }
     static testMethod void test_do_something()
    {
    	test.startTest();
    		Pagereference ref=Page.Oppor;
    		Test.setCurrentPage(ref);
    		OpporController objCont=new OpporController();
    		objCont.doSomething();
 		test.stopTest();
    }
    static testMethod void test_getOpporData()
    {
    	test.startTest();
    		Pagereference ref=Page.Oppor;
    		Test.setCurrentPage(ref);
    		Opportunity objOpp=new Opportunity(Name='TestName',StageName='Closed Lost',CloseDate=Date.valueof('2012-12-12'));
    		insert objOpp;
    		OpporController objCont=new OpporController();
    		List<Opportunity> lstOppor=objCont.getOpporData();
    		system.assert(lstOppor.size()!=0);
 		test.stopTest();
    }
    static testMethod void test_getDetails()
    {
    	test.startTest();
    		Pagereference ref=Page.Oppor;
    		Test.setCurrentPage(ref);
    		Opportunity objOpp=new Opportunity(Name='TestName',StageName='Closed Lost',CloseDate=Date.valueof('2012-12-12'));
    		insert objOpp;
    		Product2 objProd=new Product2(Name='TestProduct',Description='TestDesciption',isActive = true);
    		insert objProd;
    		PricebookEntry objPBookEntry=new PricebookEntry(Product2ID=objProd.id,Pricebook2ID=objPBook_stndrd.id,UnitPrice=50,isActive=true);
    		insert objPBookEntry;
    		OpportunityLineItem obj_Opp_Line_Item=new OpportunityLineItem(OpportunityId=objOpp.Id,PricebookEntryId=objPBookEntry.Id,Quantity=10,TotalPrice=1250);
    		insert obj_Opp_Line_Item;
    		List<OpportunityLineItem> lstOppItem=new List<OpportunityLineItem>();
    		lstOppItem.add(obj_Opp_Line_Item);
    		OpporController objCont=new OpporController();
    		objCont.lstOpporLineItem=lstOppItem;
    		List<OpportunityLineItem> lst=objCont.getDetails();
    		system.assert(lst.size()!=0);
    	test.stopTest();
    }
    static testMethod void test_get_set_MP()
    {
    	test.startTest();
    		Pagereference ref=Page.Oppor;
    		Test.setCurrentPage(ref);
    		Opportunity objOpp=new Opportunity(Name='TestName',StageName='Closed Lost',CloseDate=Date.valueof('2012-12-12'));
    		insert objOpp;
    		OpporController objCont=new OpporController();
    		String Id=objOpp.Id;
    		objCont.SetMP(Id);
    		String mp=objCont.getMP();
    		system.assert(mp==Id);
    	test.stopTest();
    }
}