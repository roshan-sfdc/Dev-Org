public with sharing class AddController 
 {
  	 public List<Product2> lstProd =new List<Product2>();
  	 public List<Product2> getData()
  	 {
  	 	return lstProd;
  	 }
  	 public void setData(Product2 obj)
  	 {
  		lstProd.add(obj);	
  	 }
  	 
	 public AddController()
	  {
	      lstProd = new List<Product2>();
	      lstProd.add(new Product2(Name=''));
	  }
	
	 public void addrow()
	  {
	      lstProd.add(new Product2(Name=''));
	  }
	
	 public Pagereference save()
	  {
	      insert lstProd;
	      Pagereference ref=new Pagereference('/apex/ProductPage');
	      ref.setRedirect(true);
	      return ref;
	  }
}