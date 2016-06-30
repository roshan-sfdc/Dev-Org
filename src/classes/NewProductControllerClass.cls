public with sharing class NewProductControllerClass 
 {
  public List<Product2> productObj {get; set;}
    
     public NewProductControllerClass()
      {
          productObj = new List<Product2>();
          productObj.add(new Product2());
      }
    
     public void addrow()
      {
          productObj.add(new Product2());
      }
    
     public PageReference save()
      {
          insert productObj;
          PageReference home = new PageReference('/01t/o');
          home.setRedirect(true);
          return home;
      }
    
    
         public void removeRow()
       {
          Integer i = productObj.size();
           productObj.remove(i-1);
         }
       
       
    


}