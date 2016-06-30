trigger Book_UpdateDate on Book__c (before insert) {
    
    Time startTime_ND = Time.newInstance(06, 00, 00, 00);
    Time endTime_ND = Time.newInstance(23, 59, 59, 00);
    
    
    Time startTime_SD = Time.newInstance(12, 00, 00, 00);
    Time endTime_SD = Time.newInstance(5, 59, 59, 00);
    list<Book__c> bookList = new list<Book__c>();
    for (Book__c book : trigger.new) {
    	system.debug('==System.Now().time()==='+System.Now().time());
    	
    	system.debug('==11=='+(startTime_ND<System.Now().time()));
    	system.debug('==22=='+(System.Now().time()<endTime_ND));
    	system.debug('==33=='+(startTime_SD<System.Now().time()));
    	system.debug('==44=='+(System.Now().time()<endTime_SD));
    	
        if (startTime_ND<System.Now().time() &&  System.Now().time()<endTime_ND) {
            book.dt__c = Datetime.newInstance(System.Now().year() +1, System.Now().month(), System.Now().date().day(), 06, 00, 00); 
        }
        
        if (startTime_SD<System.Now().time() &&  System.Now().time()<endTime_SD) {
            book.dt__c = Datetime.newInstance(System.Now().year(), System.Now().month(), System.Now().date().day(), 06, 00, 00);
        }
        
        system.debug('===book.dt__c=='+book.dt__c);
        
        bookList.add(book);
    }
    
    //if (bookList!= null && bookList.size()>0)
        //update bookList;
}