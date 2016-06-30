public with sharing class SalesForceSearchController 
{
    string searchtext;
    List<Lead>lstLead=new List<Lead>();
    List<Account>lstAccount=new List<Account>();
    List<Contact>lstContact=new  List<Contact>();
    List<Opportunity>lstOppur=new  List<Opportunity>();
    
    
    
    public void setSearchText(String s)
    {
        searchtext=s;
    }
    public String getSearchText()
    {
        return searchtext;
    }
    
   public boolean check_special_chars()
   {
   		List<String> spl=new List<String>{'!','@','#','$','%','^','&','(',')','+','-','_'};
   		boolean flag=false;
   		for(String s:spl)
   			{
   				if(searchtext.contains(s))
   				{
   				   flag=true;
   				}
   		    }
   		  return flag;  
   }
    public PageReference doSearch()
    { 
    	string partialsearch=searchtext+'*';
    	
	 	if(searchtext=='')
	 	{
	 		ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Please enter a text'));
	 		return null;
	 	}
	 	else
	 	if( check_special_chars())
	 	{
	 		ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Special characters not allowed'));
	 		return null;
	 	}
	 	else
	 	{
	        List <List<sObject>> ll=[FIND: partialsearch IN Name FIELDS RETURNING Lead(Id,Name,Email,Phone),Account(Id,Name,Email__c,Phone),Opportunity(Name,Id,Type),Contact(Id,Name,Email,FirstName,LastName)];
	        lstLead=(List<Lead>)ll.get(0);
	        lstAccount=(List<Account>)ll.get(1);
	        lstOppur=(List<Opportunity>)ll.get(2);
	        lstContact=(List<Contact>)ll.get(3);
	        return null;
	 	}
    }
    public List<Lead> getResultsLead()
    {
         return lstLead;
    }
    public List<Account> getResultsAccount()
    {
        return lstAccount;
    }
    public List<Opportunity> getResultsOpportunity()
    {
        return lstOppur;
    }
    
    public List<Contact> getResultsContact()
    {
        return lstContact;
    }
    public String getLink()
    {    	
    	 String url=system.URL.getSalesforceBaseUrl().toExternalForm();
    	 return url;
    }
}