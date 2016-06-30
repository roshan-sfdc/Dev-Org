public class AccountDataController 
{
   public AccountDataController(){}
   
   public List<Account> lstAccnt{
   
   	get{
   		  if(lstAccnt!=null)
   		  {
   		    return lstAccnt;
   		  }
   		  else
   		  {
   		  lstAccnt=[select Name,Phone,Email__c from Account LIMIT 10];
   		  return  lstAccnt;
   		  }
   	   }
   	   set;
   }
}