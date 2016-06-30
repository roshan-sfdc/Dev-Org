public with sharing class Opportunity_SumPaidPledges 
{
	public void onAfterUpdate(List<Opportunity> lstOppor)
	{
		set<id> idSet=new set<id>();
		set<id> parentOpporId_Set=new set<id>();
		Map<id,Opportunity> ParentOpportunity_Map;
		List<Opportunity> lstParent_Oppor;
		Double total=0.0;
		
		for(Opportunity obj:lstoppor)
		{
			if(obj.Parent_Opportunity__c!=null && obj.StageName=='Payment Received')
			{
				idSet.add(obj.id);
				parentOpporId_Set.add(obj.Parent_Opportunity__c);
			}
		}
		system.debug('parentOpporId_Set------>>>'+parentOpporId_Set);
		if(!parentOpporId_Set.isEmpty())
		{
			lstParent_Oppor=[select id,Amount,Paid_Pledges__c from Opportunity where id IN:parentOpporId_Set];
			ParentOpportunity_Map=new Map<id,Opportunity>(lstParent_Oppor);
		}
		
		system.debug('lstParent_Oppor------>>>'+lstParent_Oppor);
		List<Opportunity> lstOppor_to_update=new List<Opportunity>();
		List<Opportunity> lstOppor_to_update2=new List<Opportunity>();
		set<Opportunity> set_Oppor_to_update=new set<Opportunity>();
		map<id,Opportunity> map_Oppor_to_update=new map<id,Opportunity>();
		Opportunity opp,opp2;
		if(!parentOpporId_Set.isEmpty())
		{
		for(Opportunity obj:lstOppor)
		{
		  	 
			if(!ParentOpportunity_Map.isEmpty() && ParentOpportunity_Map.containsKey(obj.Parent_Opportunity__c) && obj.StageName=='Payment Received')
			{
				opp=ParentOpportunity_Map.get(obj.Parent_Opportunity__c);
				//lstOppor_to_update2=[Select (Select Amount From Child_Opportunities__r) From Opportunity o where o.id =:opp.Id];
				lstOppor_to_update2=[select id,Amount,Paid_Pledges__c,StageName from Opportunity where Parent_Opportunity__c =:opp.Id];
				system.debug('2222222222'+opp);
				system.debug('3333333333 obj.Amount-->>'+obj.Amount);
				//system.debug('4444444444 opp.Paid_Pledges__c-->>'+opp.Paid_Pledges__c);
				//system.debug('5555555555  total--->>'+(opp.Paid_Pledges__c+obj.Amount));
				if(opp.Paid_Pledges__c==null)
				opp.Paid_Pledges__c = 0.0;
				//Opportunity opp2=new Opportunity(id=opp.id,Paid_Pledges__c=(0+obj.Amount));
				
				//////opp2=new Opportunity(id=opp.id,Paid_Pledges__c=(opp.Paid_Pledges__c+obj.Amount));
				//map_Oppor_to_update.put(opp2.id,opp2);
				//lstOppor_to_update=map_Oppor_to_update.values();
				//set_Oppor_to_update.add(new Opportunity(id=opp.id,Paid_Pledges__c=(opp2.Paid_Pledges__c)));
				
				//////lstOppor_to_update.add(opp2);
				system.debug('666666666666666 lstOppor_to_update-->>'+lstOppor_to_update2);
			}
		}
		}
		system.debug('77777777777777 lstOppor_to_update-->>'+lstOppor_to_update);
		Opportunity opp3;
		for(Opportunity obj:lstOppor_to_update2)
		{
			if(obj.StageName=='Payment Received')
			{
				total=total+obj.Amount;
			}
			//////opp3=new Opportunity(id=obj.Id,Paid_Pledges__c=total);
		}
		
		//////system.debug('999999999999'+opp3);
		
		if(!parentOpporId_Set.isEmpty())
		{
			opp3=new Opportunity(id=opp.Id,Paid_Pledges__c=total);
			//Opportunity opp4=new Opportunity(id=opp2.id,Paid_Pledges__c=0.0);
			//update opp4;
			update opp3;
		}
		
		//lstOppor_to_update2.add(opp3);
		//system.debug('999999999999 lstOppor_to_update2-->>'+lstOppor_to_update2);
	/*	if(lstOppor_to_update2.size()>0)
		{
			update lstOppor_to_update2;	
		}
	*/
		
		system.debug('8888888888'+total);
	
	
		//update lstOppor_to_update;
		//update lstOppor_to_update;
		//system.debug('7777777777 opp2-->>'+opp2);
	}
}