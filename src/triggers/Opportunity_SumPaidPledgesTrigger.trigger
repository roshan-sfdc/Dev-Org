trigger Opportunity_SumPaidPledgesTrigger on Opportunity (after update) 
{
    Opportunity_SumPaidPledges obj=new Opportunity_SumPaidPledges();
    
    if(Trigger.isAfter && Trigger.isUpdate)
    {
    /*
        for(Opportunity oppor:trigger.new)
        {
            if(oppor.StageName=='Payment Received')
            {
                obj.onAfterUpdate(trigger.new);
            }
        }
    */
        obj.onAfterUpdate(trigger.new);
    }
}