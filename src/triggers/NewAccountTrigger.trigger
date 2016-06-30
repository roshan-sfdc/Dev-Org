trigger NewAccountTrigger on Account(after update)
 {
    
    List<Account> lstAccount;
    
    if(trigger.isAfter && trigger.isUpdate)
    {
        system.debug('%%%%%%%%%%%%%%%%%%%%   NEW  :'+trigger.new+'/n%%%%%%%%%%%%%%%%%   OLD   :'+trigger.old);
        system.debug('%%%%%%%%%%%%%%%%%%%%'+lstAccount);
    }

}