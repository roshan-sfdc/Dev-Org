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
private class AccountDuplicateTestClass {
	
	/*
	     1.Full Name and Email are same.
	     2.Full Name and Phone are same.
	     3.Email and Phone are same.
	     4.All three are same. 
	*/
	
	
	

    static testMethod void allValuesAreUnique() 
    {
    	List <Account> lstAccount=new List<Account>();   
    	
		    	for(Integer i=0;i<=100;i++)
		    	{
		    	
			        Account acc=new Account(Name='Roshan'+i,First_Name__c='Rajan'+i,Last_Name__c='Kumar'+i,Phone='123456'+i,Email__c=i+'Rajan@gmail.com');
			        
			        lstAccount.add(acc);
		
		    	}
	    	Test.startTest();
	    	insert lstAccount;
    	
    	
	    	for(Account acc:[select ParentId,Name from Account where Id IN: lstAccount])
	    	{
	    		system.assert(acc.ParentId==null);
	    	}
    	
    		Test.stopTest();
        
      }
     
    static testMethod void phoneAndEmailAreSame() 
    {
    	Account acc=new Account(Name='Roshan',First_Name__c='Rajan',Last_Name__c='Kumar',Phone='123456',Email__c='Rajan@gmail.com');
    	
    	List <Account> lstAccount=new List<Account>();   
    	
		    	for(Integer i=0;i<=200;i++)
		    	{
		    	
			        Account objAcc=new Account(Name='Roshan'+i,First_Name__c='Rajan'+i,Last_Name__c='Kumar'+i,Phone='123456',Email__c='Rajan@gmail.com');
			        
			        lstAccount.add(objAcc);
		    	}
	    	Test.startTest();
	    	insert acc;
	    	insert lstAccount; 
	    	
			Account acc1=[select Id, Name, Phone, Email__c from Account where Name='Roshan' and Phone='123456' and Email__c= 'Rajan@gmail.com'];
			Account acc2=[select Id,ParentId, Name, Phone, Email__c from Account where Name='Roshan20' and Phone='123456' and Email__c= 'Rajan@gmail.com'];
	    	system.assert(acc2.ParentId==acc1.Id);
	    	
	    	Test.stopTest();

     } 
     
   static testMethod void phoneAndFullNameAreSame() 
    {
    	Account acc=new Account(Name='Roshan',First_Name__c='Rajan',Last_Name__c='Kumar',Phone='123456',Email__c='rk@gmail.com');
    	
    	List<Account> lstAccnt=new List<Account>();
    	
    	for(Integer i=1;i<=200;i++)
    	{
    		Account objAccnt=new Account(Name='Roshan'+i,First_Name__c='Rajan',Last_Name__c='Kumar',Phone='123456',Email__c='rk@gmail.com'+i);
    		
    		lstAccnt.add(objAccnt);
    	}
    	
    	test.startTest();
    	insert acc;
    	insert lstAccnt;
    	
    	Account acc1=[select Name,Id,Phone,Full_Name__c from Account where Name='Roshan' and First_Name__c='Rajan' and Last_Name__c='Kumar' and Phone='123456'];
    	
    	Account acc2=[select Name,ParentId,Phone,Full_Name__c from Account where Name='Roshan20' and First_Name__c='Rajan' and Last_Name__c='Kumar' and Phone='123456'];
    	
    	system.assert(acc2.ParentId==acc1.Id);
    	
    	test.stopTest();
	        
     } 
     
    static testMethod void eMailAndFullNameAreSame() 
    {
    	Account acc=new Account(Name='Roshan',First_Name__c='Rajan',Last_Name__c='Kumar',Phone='123456',Email__c='rk@gmail.com');
    	
    	List<Account> lstAccnt=new List<Account>();
    	
    	for(Integer i=1;i<=200;i++)
    	{
    		Account objAccnt=new Account(Name='Roshan'+i,First_Name__c='Rajan',Last_Name__c='Kumar',Phone='123456'+i,Email__c='rk@gmail.com');
    		
    		lstAccnt.add(objAccnt);
    	}
    	
    	test.startTest();
    	insert acc;
    	insert lstAccnt;
    	
    	Account acc1=[select Name,Id,Phone,Full_Name__c from Account where Name='Roshan' and First_Name__c='Rajan' and Last_Name__c='Kumar' and Email__c='rk@gmail.com'];
    	
    	Account acc2=[select Name,ParentId,Phone,Full_Name__c from Account where Name='Roshan20' and First_Name__c='Rajan' and Last_Name__c='Kumar' and Email__c='rk@gmail.com'];
    	
    	system.assert(acc2.ParentId==acc1.Id);
    	
    	test.stopTest();
    } 
     
     static testMethod void AllRecordsAreSame() 
    {
    /*	List <Account> lstAccount=new List<Account>();   
    	
    	Account accObj1=new Account(Name='Roshan',First_Name__c='Rajan',Last_Name__c='Kumar',Phone='123456',Email__c='Rajan@gmail.com');
    	
    	Account accObj2=new Account(Name='Roshann',First_Name__c='Rajan',Last_Name__c='Kumar',Phone='123456',Email__c='Rajan@gmail.com');
	    	Test.startTest();
	    	insert accObj1;
	    	insert accObj2;
    	    Account AccntObj1= [select Id,Name from Account where Name='Roshan'];
    	    Account AccntObj2= [select ParentId,Name from Account where Name='Roshann'];
    	
    	
    	Test.stopTest();
        */
        
        Account acc=new Account(Name='Roshan',First_Name__c='Rajan',Last_Name__c='Kumar',Phone='123456',Email__c='rk@gmail.com');
    	
    	List<Account> lstAccnt=new List<Account>();
    	
    	for(Integer i=1;i<=200;i++)
    	{
    		Account objAccnt=new Account(Name='Roshan'+i,First_Name__c='Rajan',Last_Name__c='Kumar',Phone='123456',Email__c='rk@gmail.com');
    		
    		lstAccnt.add(objAccnt);
    	}
    	
    	test.startTest();
    	insert acc;
    	insert lstAccnt;
    	
    	Account acc1=[select Name,Id,Phone,Full_Name__c from Account where Name='Roshan' and ParentId=null];
    	
    	Account acc2=[select Name,ParentId,Phone,Full_Name__c from Account where Name='Roshan20'];
    	
    	system.assert(acc2.ParentId==acc1.Id);
    	
    	test.stopTest();
     } 
     

     
}