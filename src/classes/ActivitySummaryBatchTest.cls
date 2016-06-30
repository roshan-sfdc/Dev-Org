@isTest
 private class ActivitySummaryBatchTest
 {
     static testMethod void test_LifeTimeActionfield()
     {
        Contact objCont=new Contact(LastName='TestName',Phone='4533');
        
        Campaign objCamp=new Campaign(Name='TestCampaign',isActive=true);
                
        insert objCont;
        insert objCamp;
        
        
        CampaignMember objCampMem=new CampaignMember(ContactId=objCont.Id,CampaignId=objCamp.Id);
        insert objCampMem;
        
        Test.startTest();
        ActivitySummaryBatch2 asb=new ActivitySummaryBatch2();
        Database.executeBatch(asb);
        Test.stopTest();
        Contact cc=[select LifeTime_Count__c from Contact where LastName='TestName'];
        
        system.assert(cc.LifeTime_Count__c==1);
        
        
        
        system.assert(cc.LifeTime_Count__c==1);
        
     }
 }