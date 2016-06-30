public with sharing class AddProductController 
{
	
	public String ProdName{get;set;}
	
	public String company{get;set;}
	
	public String description{get;set;}

	public String code{get;set;}
	
	public String ptype{get;set;}
	
	Integer i=10;
	
	public void doInsert()
	{
		Product2 obj=new Product2(Name=ProdName,ProductCode=code,Company__c=company,Product_Type__c=ptype,description=description);
		insert obj;
	}
	public Pagereference homePage()
	{
		Pagereference ref=new Pagereference('/apex/ProductPage');
		ref.setRedirect(true);
		return ref;
	}
	public Pagereference checkInserted()
	{
		List<Product2> lstProd=[select Id,Name from Product2 where Name=:ProdName and ProductCode=:code and Company__c=:company and Product_Type__c=:ptype and description=:description];
		if(lstProd.size()==0)
		{
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Could not insert '));
			return null;
		}
		return null;
	}
	
	
}