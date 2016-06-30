public with sharing class AccountDuplicateTriggerHandler
{
	
	public AccountDuplicateTriggerHandler(){}
	

    public void onAfterInsertAndUpdate(List<Account> lstAccnt)
    {
	
	        Set<String>fullNameSet=new Set<String>();
	        
	        Set<String>phoneSet=new Set<String>();
	        
	        Set<String>emailSet=new Set<String>();
	        
	        Map<String,String>namePhoneMap=new Map<String,String>();
	        
	        Map<String,String>nameEmailMap=new Map<String,String>();
	        
	        Map<String,String>emailPhoneMap=new Map<String,String>();
	        
	        for(Account acc:lstAccnt)
	        {
	        	fullNameSet.add(acc.Full_Name__c);
	        	
	        	phoneSet.add(acc.Phone);
	        	
	        	emailSet.add(acc.Email__c);
	        }
	        
	        for(Account accObj:[select Full_Name__c,Phone,Email__c,Id from Account where ParentId=NULL and  ((Full_Name__C IN:fullNameSet and Phone IN:phoneSet) or(Phone IN:phoneSet and Email__c IN:emailSet) or (Full_Name__C IN:fullNameSet and Email__c IN:emailSet ))])
	        {
	        	
	        	  namePhoneMap.put(accObj.Full_Name__c+accObj.Phone,accObj.Id);
	        	  
	        	  nameEmailMap.put(accObj.Full_Name__c+accObj.Email__c,accObj.Id);
	        	  
	        	  emailPhoneMap.put(accObj.Email__c+accObj.Phone,accObj.Id);
	      	}
	         
	        for(Account accObj1:lstAccnt)
	        {
	        	if(namePhoneMap.containsKey(accObj1.Full_Name__c+accObj1.Phone))
	        	{
	        		accObj1.ParentId=namePhoneMap.get(accObj1.Full_Name__c+accObj1.Phone);
	        	}
	        	
	        	else 
	        	if(nameEmailMap.containsKey(accObj1.Full_Name__c+accObj1.Email__c))
	        	{
	        		accObj1.ParentId=nameEmailMap.get(accObj1.Full_Name__c+accObj1.Email__c);
	        	}
	        	
	        	else
	        	if(emailPhoneMap.containsKey(accObj1.Email__c+accObj1.Phone))
	        	{
	        		accObj1.ParentId=emailPhoneMap.get(accObj1.Email__c+accObj1.Phone);
	        	}
	        	else
	        	accObj1.ParentId=NULL;
	        	
	        } 
	        
	        
    }
}