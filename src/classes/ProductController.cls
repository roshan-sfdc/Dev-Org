public with sharing class ProductController 
{
	String Prod_type='notype';
	
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
	public Pagereference page_Add_Products()
	{
		Pagereference ref=new Pagereference('/apex/AddNewProduct');
		ref.setRedirect(true);
		return ref;
	}
}