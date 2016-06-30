global class ActivitySummaryBatch2 implements Database.Batchable<sObject>
{
   
   global Database.Querylocator start(Database.BatchableContext bc)
   {
    return Database.getQueryLocator([Select c.Status, c.Last_Updated_Date__c, c.ContactId, c.CampaignId From CampaignMember c]);
   }
   
   global void execute (Database.Batchablecontext bc, List<CampaignMember> lstCampMem)
   {
       Integer count=0;
       
       Map<String,Integer> Camp_contId_Map=new Map<String,Integer>();
    
    for(CampaignMember objCampMem_1:lstCampMem)
    {
       for(CampaignMember objCampMem_2:lstCampMem)
       {
         if(objCampMem_1.ContactId==objCampMem_2.ContactId)
         {
            count++;
         }
       }
     Camp_contId_Map.put(objCampMem_1.ContactId,count);  
    }
    
    system.debug('11111111111111111111111111111111'+count);
    
   
    List<Contact> lstContact=new List<Contact>(); 
    
    for(Contact obj_cam_mem:[select Id,LifeTime_Count__c from Contact where Id IN:Camp_contId_Map.keyset()])
    {
      obj_cam_mem.LifeTime_Count__c=Camp_contId_Map.get(obj_cam_mem.Id);
      lstContact.add(obj_cam_mem);
    }
    
    update lstContact;
    
   }   
   
   
   global void finish(Database.Batchablecontext bc)
   {
    
   } 
}