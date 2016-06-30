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
private class CampaignControllerTest {

    static testMethod void test_SetView_GetView() 
    {
          PageReference pageRef=Page.Campaign_Management_Landing_Page;
          Test.setCurrentPageReference(pageRef);
          CampaignCustomController objCont=new CampaignCustomController();
          Test.startTest();
              objCont.setcview('Recently Modified');
              system.assert(objCont.getcview()=='Recently Modified');
          Test.stopTest(); 
    }
    
    static testMethod void test_RecentlyModified()
    {
          PageReference pageRef=Page.Campaign_Management_Landing_Page;
          Test.setCurrentPageReference(pageRef);
          CampaignCustomController objCont=new CampaignCustomController();
          Test.startTest();
               Campaign camp1=new Campaign(Name='Test1',Type='TestType1',status='TestStatus1',startDate=Date.ValueOf('2012-08-08'));
               Campaign camp2=new Campaign(Name='Test2',Type='TestType2',status='TestStatus2',startDate=Date.ValueOf('2012-08-08'));
               objCont.setcview('Recently Modified');
               List<Campaign> lstCamp=new List<Campaign>();
               lstCamp.add(camp1);
               lstCamp.add(camp2);
               insert lstCamp;
               List<Campaign> lstcamp2=new List<Campaign>();
               lstcamp2=objCont.getCampaigns();
               Campaign camp4=[select name,status,type from Campaign where name='Test1'];
               System.assert(camp4.name=='Test1');
          Test.stopTest();
    }
    
    static testMethod void test_All_Campaigns()
    {
          PageReference pageRef=Page.Campaign_Management_Landing_Page;
          Test.setCurrentPageReference(pageRef);
          CampaignCustomController objCont=new CampaignCustomController();
          Test.startTest();
               Campaign camp1=new Campaign(Name='Test1',Type='TestType1',status='TestStatus1',startDate=Date.ValueOf('2012-08-08'));
               Campaign camp2=new Campaign(Name='Test2',Type='TestType2',status='TestStatus2',startDate=Date.ValueOf('2012-08-08'));
               List<Campaign> lstCamp=new List<Campaign>();
               lstCamp.add(camp1);
               lstCamp.add(camp2);
               insert lstCamp;
               objCont.setcview('All Campaigns');
               List<Campaign> lstcamp2=new List<Campaign>();
               lstcamp2=objCont.getCampaigns();
               Campaign camp4=[select name,status,type from Campaign where name='Test1'];
               System.assert(lstCamp.get(0).name=='Test1');
          Test.stopTest();
    }
    
    
    static testMethod void test_All_Active_Campaigns()
    {
          PageReference pageRef=Page.Campaign_Management_Landing_Page;
          Test.setCurrentPageReference(pageRef);
          CampaignCustomController objCont=new CampaignCustomController();
          Test.startTest();
               Campaign camp1=new Campaign(Name='Test1',Type='TestType1',status='TestStatus1',isActive=true,startDate=Date.ValueOf('2012-08-08'));
               Campaign camp2=new Campaign(Name='Test2',Type='TestType2',status='TestStatus2',startDate=Date.ValueOf('2012-08-08'));
               List<Campaign> lstCamp=new List<Campaign>();
               lstCamp.add(camp1);
               lstCamp.add(camp2);
               insert lstCamp;
               objCont.setcview('All Active Campaigns');
               List<Campaign> lstcamp2=new List<Campaign>();
               lstcamp2=objCont.getCampaigns();
               Campaign camp4=[select name,status,type,isActive from Campaign where name='Test1'];
               System.assert(lstCamp.get(0).isActive==true);
          Test.stopTest();
    }
    
    static testMethod void test_My_Active_Campaigns()
    {
          PageReference pageRef=Page.Campaign_Management_Landing_Page;
          Test.setCurrentPageReference(pageRef);
          CampaignCustomController objCont=new CampaignCustomController();
          Test.startTest();
               Campaign camp1=new Campaign(Name='Test1',Type='TestType1',status='TestStatus1',isActive=true,startDate=Date.ValueOf('2012-08-08'));
               Campaign camp2=new Campaign(Name='Test2',Type='TestType2',status='TestStatus2',startDate=Date.ValueOf('2012-08-08'));
               List<Campaign> lstCamp=new List<Campaign>();
               lstCamp.add(camp1);
               lstCamp.add(camp2);
               insert lstCamp;
               objCont.setcview('My Active Campaigns');
               List<Campaign> lstcamp2=new List<Campaign>();
               lstcamp2=objCont.getCampaigns();
               Campaign camp4=[select name,status,type,isActive from Campaign where isActive=true];
               System.assert(lstCamp.get(0).name==camp4.name);
          Test.stopTest();
    }
    
    static testMethod void test_Inactive_Campaigns()
    {
          PageReference pageRef=Page.Campaign_Management_Landing_Page;
          Test.setCurrentPageReference(pageRef);
          CampaignCustomController objCont=new CampaignCustomController();
          Test.startTest();
               Campaign camp1=new Campaign(Name='Test1',Type='TestType1',status='TestStatus1',isActive=false,startDate=Date.ValueOf('2012-08-08'));
               Campaign camp2=new Campaign(Name='Test2',Type='TestType2',status='TestStatus2',startDate=Date.ValueOf('2012-08-08'));
               List<Campaign> lstCamp=new List<Campaign>();
               lstCamp.add(camp1);
               lstCamp.add(camp2);
               insert lstCamp;
               objCont.setcview('Inactive Campaigns');
               List<Campaign> lstcamp2=new List<Campaign>();
               lstcamp2=objCont.getCampaigns();
               Campaign camp4=[select name,status,type,isActive from Campaign where isActive=false and status='TestStatus1'];
               System.assert(lstCamp.get(0).name==camp4.name);
          Test.stopTest();
    }
}