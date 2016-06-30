public with sharing class TranslationPageController {
    public User user {get; set;}
    public Contact contact {get; private set;}
    public String selectedLanguage {get; set;}
    
    public Pagereference init() {
        user = [select ID, LanguageLocaleKey from User where Id = :Userinfo.getUserId()];
        contact = new Contact();
        system.debug('===user=='+user);
        
        return null;
    }
    
    public Pagereference updateUser() {
        try {
        	system.debug('---user before update===='+user);
            Database.Saveresult updateResult = Database.update(user);
            system.debug('---user after update===='+user);
            
            system.debug('===@@@==='+updateResult.isSuccess());
        } catch(Exception ex) {
            system.debug('---Exception---'+ex);
        }
        return null;
    }
    
    public String getLabel() {
        return System.Label.Translation_Test;
    }
}