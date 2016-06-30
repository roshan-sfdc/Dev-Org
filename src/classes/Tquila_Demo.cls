public class Tquila_Demo {
    
    public Survey_Result__c surveyResult {get; set;}
    
    public Tquila_Demo() {
        surveyResult = new Survey_Result__c();
        system.debug('====='+[select Id, Name from User LIMIT 10]);
    }
    
    public list<User> getUsers() {
        return [select Id, Name from User LIMIT 10];
    }
    
    public Pagereference submit() {
        try {
            insert surveyResult;       
        } catch(Exception ex) {
            system.debug('==exception=='+ex);
        }
        return new Pagereference('/Tquila_Demo');
    }

}