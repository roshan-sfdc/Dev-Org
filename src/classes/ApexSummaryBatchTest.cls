/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */

@isTest
 private class ApexSummaryBatchTest
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
        ApexSummaryBatch asb=new ApexSummaryBatch();
        Database.executeBatch(asb);
        Test.stopTest();
        Contact cc=[select LifeTime_Count__c from Contact where LastName='TestName'];
        
        system.assert(cc.LifeTime_Count__c==1);
        
        
        
        system.assert(cc.LifeTime_Count__c==1);
        
     }
 }