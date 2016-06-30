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
 
 /*
 Test Cases
 1. When  Stage of all records is not Payment Received.
 2. When  Stage of all records is not Payment Received
 
 */
@isTest
private class TestOpportunity_SumPaidPledges {

    static testMethod void StagePaymentReceived()
 	{
 		Double total=0.0;
 		List<Opportunity> lstOppor=new List<Opportunity>();
 		List<Opportunity> lstOppor2=new List<Opportunity>();
 		Opportunity opp=new Opportunity(Name='TestName',Amount=100.0,CloseDate=Date.ValueOf('2015-08-08'),Type='New Customer',StageName='Payment Received');
        test.startTest();
        insert opp;
        	for(Integer i=0;i<10;i++)
        	{
        		Opportunity opp1=new Opportunity(Name='TestName'+i,Parent_Opportunity__c=opp.id,Amount=1.0,CloseDate=Date.ValueOf('2015-08-08'),Type='New Customer',StageName='Payment Received');
        		lstOppor.add(opp1);
        	}
        	insert lstOppor;
        	
        	for(Opportunity obj:lstOppor)
        	{
        		obj.Type='Existing Customer - Downgrade';
        		lstOppor2.add(obj);
        	}
        	update lstOppor2;
        	for(Opportunity obj:lstOppor2)
        	{
        		total=total+obj.Amount;
        	}
        	//update lstOppor;
        	system.assert(opp.Paid_Pledges__c==10.0);
        test.stopTest();
    }
}