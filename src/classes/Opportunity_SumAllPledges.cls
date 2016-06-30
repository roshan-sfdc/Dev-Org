public with sharing class Opportunity_SumAllPledges 
{
	public void onAfterUpdate(List<Opportunity> lstOppor)
	{
		Double total=0.0;
		set<id> idSet=new set<id>();
		set<id> parentOpporIdSet=new set<id>();
		map<id,Opportunity> parentOpporMap=new map<id,Opportunity>();
		
		for(Opportunity obj:lstOppor)
		{
			if(obj.Parent_Opportunity__c!=null)
			{
				idSet.add(obj.id);
				parentOpporIdSet.add(obj.Parent_Opportunity__c);
				system.debug('11111111parentOpporIdSet--->>>'+parentOpporIdSet);
			}
		}
		
		List<Opportunity> lstParentOppor;
		if(!parentOpporIdSet.isEmpty())
		{
			lstParentOppor=[select id,Amount,All_Pledges__c from Opportunity where id IN:parentOpporIdSet];
			parentOpporMap=new map<id,Opportunity>(lstParentOppor);
			system.debug('222222222parentOpporMap-->>'+parentOpporMap);
		}
		Opportunity opp1,opp2;
		List<Opportunity> childOppors;
		List<Opportunity> lstOpporToUpdate;
		if(!parentOpporIdSet.isEmpty())
		{
			for(Opportunity obj:lstOppor)
				{
					if(!parentOpporIdSet.isEmpty() && !parentOpporMap.isEmpty() && parentOpporMap.containsKey(obj.Parent_Opportunity__c))
					{
						opp1=parentOpporMap.get(obj.Parent_Opportunity__c);
						system.debug('33333333333333opp1-->'+opp1);
						childOppors=[select id,Amount from Opportunity where Parent_Opportunity__c=:opp1.id];
						system.debug('44444444444childOppors'+childOppors);
					}
				}
		}
		
		if(!parentOpporIdSet.isEmpty())
		{
			for(Opportunity obj:childOppors)
			{
				total=total+obj.Amount;
				system.debug('5555555555total'+total);
			}
		}
		
		if(!parentOpporIdSet.isEmpty())
		{
			opp2=new Opportunity(id=opp1.id,All_Pledges__c=total);
			system.debug('66666666666 opp2'+opp2);
			update opp2;
		}
	}
}