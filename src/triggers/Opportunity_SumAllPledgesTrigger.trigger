trigger Opportunity_SumAllPledgesTrigger on Opportunity (after update) 
{
    Opportunity_SumAllPledges obj=new Opportunity_SumAllPledges();
    
    if(trigger.isAfter && trigger.isUpdate)
    {
        obj.onAfterUpdate(trigger.new);
    }
}