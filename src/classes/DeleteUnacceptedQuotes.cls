public class DeleteUnacceptedQuotes {
     @InvocableMethod     
     public static void QuoteDelete(List<Id> bookIds) {         
        List<Book__c> books =[select id from Book__c where Id in : bookIds];         
        system.debug('==books=='+books);
        delete books;
     } 
}