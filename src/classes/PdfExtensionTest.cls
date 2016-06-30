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
@isTest(seeAllData=true)
private class PdfExtensionTest {

    static testMethod void test_pdf() 
    {
    	Pagereference ref=Page.PdfPage;
    	Test.setCurrentPage(ref);
    	PriceBook2 objPBook_stndrd=[select id, name, isActive from Pricebook2 where IsStandard = true limit 1];
    	test.startTest();
    		Opportunity objOpp=new Opportunity(Name='TestName',StageName='Closed Lost',CloseDate=Date.valueof('2012-12-12'));
    		insert objOpp;
    		PriceBook2 objPBook=new PriceBook2(Name='TestPriceBook',Description='Test Pricebook Entry', isActive=true);
    		insert objPBook;
    		Quote objQuote=new Quote(name='TestQuote',OpportunityId=objOpp.Id,Pricebook2Id=objPBook_stndrd.id);
    		insert objQuote;
    		Product2 objProd=new Product2(Name='TestProduct',Description='TestDesciption',isActive = true);
    		insert objProd;
    		PricebookEntry objPBookEntry=new PricebookEntry(Product2ID=objProd.id,Pricebook2ID=objPBook_stndrd.id,UnitPrice=50,isActive=true);
    		insert objPBookEntry;
    		QuoteLineItem objQtLineItem=new QuoteLineItem(QuoteId=objQuote.Id,Quantity=2,UnitPrice=100000,PricebookEntryId=objPBookEntry.Id);
    		List<QuoteLineItem> lstQtLineItem=new List<QuoteLineItem>();
    		lstQtLineItem.add(objQtLineItem);
    		insert lstQtLineItem;
    		ApexPages.StandardController cont=new ApexPages.StandardController(objQuote);
    		PdfControllerExtension objExt=new PdfControllerExtension(cont);
    		ref.getParameters().put('Id',objQuote.Id);
    		system.assert(objQtLineItem.QuoteId==objQuote.Id);
    	
    		PdfControllerExtension objExt1=new PdfControllerExtension();
    		List<QuoteLineItem> lstItem=objExt.getQuoteLineItemss();
    		system.assert(lstItem.size()!=0);
    	test.stopTest();    
    }
}