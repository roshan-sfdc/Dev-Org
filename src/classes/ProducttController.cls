public with sharing class ProducttController 
{
	String Prod_type='dd';
	//public String ptype{get;set;}/
	
	public String getptype()
	{
		return Prod_type;
	}
	public void setptype(String ptype)
	{
		Prod_type=ptype;
	}
	
	public List<Product2> getsearch()
	{
		List<Product2> lstProd=[select Id,Name,Company__c,Description  from Product2 where Product_Type__c=:Prod_type ];
		return lstProd;
	}
	public String getLink()
	{
		String url=system.URL.getSalesforceBaseUrl().toExternalForm();
		return url;
	}
}