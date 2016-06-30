trigger EmployeeTrigger on Employee__c (after update) {
	
	List<Employee__c> lstEmp;
	
	if(trigger.isAfter && trigger.isUpdate)
	{
		system.debug('%%%%%%%%%%%%%%%%%%%%   NEW  :'+trigger.new+'/n%%%%%%%%%%%%%%%%%   OLD   :'+trigger.old);
		system.debug('%%%%%%%%%%%%%%%%%%%%'+lstEmp);
	}

}