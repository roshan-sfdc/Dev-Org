global class ActivitySummaryBatchOld implements Database.Batchable<sObject>
{
   
   global Database.Querylocator start(Database.BatchableContext bc)
   {
    return Database.getQueryLocator([Select c.Status, c.Last_Updated_Date__c, c.ContactId, c.CampaignId From CampaignMember c]);
   }
   
   global void execute (Database.Batchablecontext bc, List<sObject> lstsObj)
   {
     List<CampaignMember> lstCampaignMembers = (List<CampaignMember>)lstsObj;
     
     List<CampaignMember> lstCampMem=new List<CampaignMember>();
     List<CampaignMember> lstCampYesterday=new List<CampaignMember>();
     List<CampaignMember> lstCampLast90=new List<CampaignMember>();
     List<CampaignMember> lstCamp180=new List<CampaignMember>();
     List<CampaignMember> lstCamp365=new List<CampaignMember>();
     
     
     CampaignMember camp=new CampaignMember();
     
     Date d1=null;

     for( CampaignMember obj:lstCampaignMembers)
     {
        lstCampMem.add(obj);
        
        camp=obj;
        
        d1=obj.Last_Updated_Date__c.date();
     
     
     if(d1==system.today().addDays(-1))
     {
        lstCampYesterday.add(camp);
        system.debug('11111111111111111111111111111'+camp);
     }
     
     if(d1<system.today().addDays(-1) && d1>system.today().addDays(-90))
     {
        lstCampLast90.add(camp);
        system.debug('222222222222222222222222222222'+camp);
     }
     
     if(d1<system.today().addDays(-91) && d1>system.today().addDays(-180))
     {
        lstCamp180.add(camp);
        system.debug('3333333333333333333333333333'+camp);
     }
    
     if(d1<system.today().addDays(-181) && d1>system.today().addDays(-365))
     {
        lstCamp365.add(camp);
        system.debug('44444444444444444444444444444'+camp);
     }  
    }
     integer counter=0;
     for(CampaignMember objCamp1:lstCampMem)
     {
        for(CampaignMember objCamp2:lstCampMem)
        {
            if(objCamp1.ContactId==objCamp2.ContactId)
            {
                counter+=1;
            }
        }
     }
     system.debug('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'+counter);
   } 
   
   global void finish(Database.Batchablecontext bc)
   {
    
   }
}