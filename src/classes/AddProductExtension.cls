public with sharing class AddProductExtension 
{
/*	public List<Product2> Prod1{get;set;}
	
	//public List<Product2> prod2{get;set;}
	
	public AddProductExtension(ApexPages.StandardController controller)
	{
		
	}
	
	public void addMore()
	{
		Prod1.add(new Product2());
	}
	
	public Pagereference home_page()
	{
		Pagereference ref=new Pagereference('/apex/ProductPage');
		ref.setRedirect(true);
		return ref;
	}
*/

    private  final Product2 products{get;set;}
    
    public List<Product2> products1{get;set;}
    
    public AddProductExtension(ApexPages.StandardController controller)
	{
		this.products = (Product2)controller.getRecord();
  		products1=new List<Product2>();
 		 products1.add(new Product2());
	}
    
    public void addRow()
    {
    	products1.add(new Product2());
    }	
}