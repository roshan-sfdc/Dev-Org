trigger FirstTaskTrigger on Account (after insert) 
{
    FirstTaskTriggerClass objHandler=new FirstTaskTriggerClass();
    
    if(trigger.isAfter && trigger.isInsert)
    {
   
    	objHandler.onAfterInsert(trigger.new);
    }
}