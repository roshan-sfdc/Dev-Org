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
/*
  TestConditions
  1.
  2.
  3.
*/
private class SearchPageTestClass {
	
		
	
    static testMethod void do_Search_Test()
    {
    	PageReference pageRef=Page.SalesForceSearchPage;
        Test.setCurrentPageReference(pageRef);
        
		List<Account> lstAccount=new List<Account>();
		List<Contact> lstContact=new List<Contact>();
		List<Lead> lstLead=new List<Lead>();
		List<Opportunity> lstOppor=new List<Opportunity>();
		for(Integer i=0;i<10;i++)
		{
			Account objAcc=new Account(Name='Test'+i);
			Contact objCon=new Contact(LastName='TestName');
			Lead objLead=new Lead(LastName='Test'+i,Company='TestCompany',Status='Open - Not Contacted');
			Opportunity objOppor=new Opportunity(Name='Test'+i,CloseDate=Date.today(),StageName='Qualification');
			lstAccount.add(objAcc);
			lstContact.add(objCon);
			lstLead.add(objLead);
			lstOppor.add(objOppor);
		}
			test.startTest();
				insert lstAccount;
				insert lstContact;
				insert lstLead;
				insert lstOppor;
			test.stopTest(); 
			List<Account> lstAccount2=new List<Account>();
			List<Contact> lstContact2=new List<Contact>();
			List<Lead> lstLead2=new List<Lead>();
			List<Opportunity> lstOppor2=new List<Opportunity>();
			SalesForceSearchController objCont=new SalesForceSearchController();
			objCont.setSearchText('Test');
			objCont.getSearchText();
			objCont.doSearch();
			lstAccount2=objCont.getResultsAccount();
			lstContact2=objCont.getResultsContact();
			lstLead2=objCont.getResultsLead();
			lstOppor2=objCont.getResultsOpportunity();
			
			system.assert(lstAccount2.size()!=NULL);
			system.assert(lstContact2.size()!=NULL);
			system.assert(lstLead2.size()!=NULL);
			system.assert(lstOppor2.size()!=NULL);
			
			Url url=system.URL.getSalesforceBaseUrl();
			system.assert(objCont.getLink().trim().equalsIgnoreCase(url.toExternalForm()));
     }
     
     static testMethod void test_special_chars()
     {
     		PageReference pageRef=Page.SalesForceSearchPage;
        	Test.setCurrentPageReference(pageRef);
     		SalesForceSearchController objCont=new SalesForceSearchController();
     		objCont.setSearchText('#$$%%^&');
     		system.assert(objCont.check_special_chars());
     }
     
     static testMethod void test_blankspaces()
     { 
     	PageReference pageRef=Page.SalesForceSearchPage;
        Test.setCurrentPageReference(pageRef);
     	List<Account> lstAccount=new List<Account>();
		List<Contact> lstContact=new List<Contact>();
		List<Lead> lstLead=new List<Lead>();
		List<Opportunity> lstOppor=new List<Opportunity>();
     	for(Integer i=0;i<10;i++)
		{
			Account objAcc=new Account(Name='Test'+i);
			Contact objCon=new Contact(LastName='TestName');
			Lead objLead=new Lead(LastName='Test'+i,Company='TestCompany',Status='Open - Not Contacted');
			Opportunity objOppor=new Opportunity(Name='Test'+i,CloseDate=Date.today(),StageName='Qualification');
			lstAccount.add(objAcc);
			lstContact.add(objCon);
			lstLead.add(objLead);
			lstOppor.add(objOppor);
		}
			test.startTest();
				insert lstAccount;
				insert lstContact;
				insert lstLead;
				insert lstOppor;
			test.stopTest(); 
			List<Account> lstAccount2=new List<Account>();
			List<Contact> lstContact2=new List<Contact>();
			List<Lead> lstLead2=new List<Lead>();
			List<Opportunity> lstOppor2=new List<Opportunity>();
			SalesForceSearchController objCont=new SalesForceSearchController();
     		objCont.setSearchText('');
     		objCont.getSearchText();
			objCont.doSearch();
			lstAccount2=objCont.getResultsAccount();
			lstContact2=objCont.getResultsContact();
			lstLead2=objCont.getResultsLead();
			lstOppor2=objCont.getResultsOpportunity();
			system.assert(lstAccount2.size()==0);
			system.assert(lstContact2.size()==0);
			system.assert(lstLead2.size()==0);
			system.assert(lstOppor2.size()==0);
     }

				
}