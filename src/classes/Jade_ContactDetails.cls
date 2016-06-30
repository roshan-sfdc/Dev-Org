public with sharing class Jade_ContactDetails {

    public Contact contact {get; set;}
    public list<SelectOption> stateOptions {get; set;}
    
    public Jade_ContactDetails() {
        contact = new Contact();
    }
    
    public list<SelectOption> getCountryOptions() {
    
        set<String> countries = Jade_Country__c.getAll().keySet();
        list<SelectOption> countryOptions = new list<SelectOption>{new SelectOption('--SELECT--', '--SELECT--')};
        for (String country : countries) {
            countryOptions.add(new SelectOption(country, country));
        }
        return countryOptions;
    }
    
    public Pagereference action() {
        system.debug('===@@@@==='+contact.Country__c);
        Map<String, Jade_State__c> stateMap = Jade_State__c.getAll();
        stateOptions = new list<SelectOption>{new SelectOption('--SELECT--','--SELECT--')};
        
        for(Jade_State__c state : stateMap.values()) {
            
            if (contact.Country__c != '--SELECT--' && state.country__c != null && state.country__c.equals(contact.Country__c)) {
                stateOptions.add(new SelectOption(state.Name, state.Name));
            }
            
        }
    
        system.debug('==stateOptions===='+stateOptions);
        return null;
    }
    
    public Pagereference cancel() {
       

       
       return new Pagereference('003/o');
    }
    
    public Pagereference save() {
       
       Database.saveresult sr = Database.insert(contact);
       
       return new Pagereference('/'+sr.getId());
    }



}