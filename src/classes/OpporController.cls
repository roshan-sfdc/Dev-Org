public with sharing class OpporController 
{
	public OpporController(){}
	public OpporController(ApexPages.StandardController controller){}
	public  List<Opportunity> getOpporData()
	{
		List<Opportunity> lstOppor=[select Name,StageName,Type from Opportunity];
		return lstOppor;
	}
	String p;
	public String getMP()
	{
		return p;
	}
	public void SetMP(String s)
	{
		p=s;
	}
	List<Id> lstQuoteId=new List<Id>();
	List<Quote> lst=new List<Quote>();
	List<Opportunity> lstOppor=new List<Opportunity>(); 
	public List<OpportunityLineItem>lstOpporLineItem=new List<OpportunityLineItem>();
	List<Quote> lstQuote=new List<Quote>();
	public Pagereference doSomething()
	{
		lst=[select Id from Quote where OpportunityId=:p];
		for(Quote obj:lst)
		{
			lstQuoteId.add(obj.Id);
		} 
		lstOpporLineItem=[select PricebookEntryId,Quantity,PricebookEntry.Product2.Name from OpportunityLineItem where OpportunityId=:p];
		lstQuote=[Select QuoteNumber, Name From Quote where Id In:lstQuoteId and OpportunityId=:p];
		return null;
	}
	public List<OpportunityLineItem> getDetails()
	{
		return lstOpporLineItem;
	}
	public List<Opportunity> getOpporDetails()
	{
		lstOppor=[Select o.Type, o.StageName, o.Probability, o.Name, o.ExpectedRevenue, o.CloseDate, o.Amount From Opportunity o where o.Id=:p];
		return lstOppor;
	}
	public List<Quote> getQuoteDetails()
	{
		return lstQuote;
	}
	
	public String getLink()
	{
		String Url=System.URL.getSalesforceBaseUrl().toExternalForm();
		return Url;
	}
	
}