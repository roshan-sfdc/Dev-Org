public with sharing class FirstTaskTriggerClass
{
  public FirstTaskTriggerClass()
  {
  	
  }
  
  public void onAfterInsert(List<Account> lstNew)
   {
   	  List<Contact> lstContact= new List<Contact>();
   	  
   	  for(Account objAcc:lstNew)
   	  {
   	  	Contact objCon=new Contact();
   	  	
   	  	objCon.LastName=objAcc.Name;
   	  	
   	  	objCon.AccountID=objAcc.Id;
   	  	
   	  	lstContact.add(objCon);
   	  }
   	  
   	  if(lstContact !=null && lstContact.size()>0)
   	  insert lstContact;
   }
}