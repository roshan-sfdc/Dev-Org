trigger AccountDuplicateTrigger on Account (before insert, before update)
{
  AccountDuplicateTriggerHandler handler=new AccountDuplicateTriggerHandler(); 
  
  if(Trigger.isBefore && Trigger.isInsert)
  {
  	handler.onAfterInsertAndUpdate(trigger.new);
  }
  
  if(Trigger.isBefore && Trigger.isUpdate)
  {
  	handler.onAfterInsertAndUpdate(trigger.new);
  }
}