public with sharing class AccountTriggerHandler
{
   public AccountTriggerHandler()
   {
   	
   }
   
   public void onAfterInsert(Map<Id,Account> mapNew)
   {
   	  system.debug('%%%%%%%%%%%%%%mapNew'+mapNew);
   }
   
   public void onAfterUpdate(Map<Id,Account> mapOld,Map<Id,Account> mapNew)
   {
   	  system.debug('%%%%%%%%%%%%%%mapOld'+mapOld);
   	  
   	  system.debug('%%%%%%%%%%%%%%mapNew'+mapNew);
   }
}