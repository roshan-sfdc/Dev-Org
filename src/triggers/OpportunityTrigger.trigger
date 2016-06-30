trigger OpportunityTrigger on Opportunity (before update) 
{
    Opportunity_SumPaidPledges obj=new Opportunity_SumPaidPledges();
    
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        obj.onAfterUpdate(trigger.new);
    }
}