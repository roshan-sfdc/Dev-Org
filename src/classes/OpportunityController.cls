public with sharing class OpportunityController 
{
	public  List<Opportunity> getOpporData()
	{
		List<Opportunity> lstOppor=[select Name,StageName,Type from Opportunity];
		return lstOppor;
	}
	
	String p;
	List<OpportunityLineItem> lst=new List<OpportunityLineItem>();
	public String getMP()
	{
		return p;
	}
	public void setMP(String s)
	{
		p=s;
	}
	public Pagereference doSomething()
	{
		lst=[Select Quantity,PricebookEntryId,OpportunityId From OpportunityLineItem where OpportunityId=:p];
		//system.debug('555555555555555555555555'+p);
		//Pagereference ref=new Pagereference('/apex/aa');
		//ref.setRedirect(true);
		return null;
	}
	
	public List<OpportunityLineItem> getDetails()
	{
		//lst=[Select Quantity,PricebookEntryId,OpportunityId From OpportunityLineItem where OpportunityId=:ApexPages.currentPage().getParameters().get('cid')];
		return lst;
	}
	
}