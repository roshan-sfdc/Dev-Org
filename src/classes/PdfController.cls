public with sharing class PdfController 
{
	ID id;
	
	
	
	public  PdfController(ApexPages.StandardController controller)
	{
		id=controller.getRecord().Id;
		List<sObject> lst1=new List<sObject>();
		lst1=[select PricebookEntryId from QuoteLineItem where QuoteId=:id];
		system.debug('222222222222222222222'+lst1);
		List<sObject> lst2=new List<sObject>();
		lst2=[select Product2Id from PricebookEntry where Id IN:lst1];
		system.debug('333333333333333333333'+lst2);
		List<Product2> lst3=new List<Product2>();
		lst3=[select Name from Product2 where Id IN:lst2];
		system.debug('44444444444444444444444'+lst3);
	}
	public List<Quote> getQuotes()
	{
		List<Quote> lstquote=[select opportunityId,status,Pricebook2Id,QuoteNumber from Quote where Id=:id];
		system.debug('111111111111111111111'+lstquote);
		return lstquote;
	}
}