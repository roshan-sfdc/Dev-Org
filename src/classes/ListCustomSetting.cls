public with sharing class ListCustomSetting {
	
    private static map<String, Country__c> countrySettingMap = Country__c.getAll();
    private static map<String, City__c> citySettingMap = City__c.getAll();
    
    public String country {get; set;}
    public String city {get; set;}
    
    public list<Selectoption> cityOptions {get; set;}
    
    public Pagereference init() {
        
        return null;
    }
    
    public list<Selectoption> getCountryOptions() {
        list<Selectoption> countryOptions = new list<Selectoption>();
        for (String country : countrySettingMap.keySet()) {
            countryOptions.add(new SelectOption(country, country));
        }
        return countryOptions;
    }
    
    public list<Selectoption> getCityOptions() {
        cityOptions = new list<Selectoption>();
        
        system.debug('====country===='+country);
        
        for (String city : citySettingMap.keySet()) {
            system.debug('===city=='+city);
            system.debug('==citySettingMap.get(city).Country__c=='+citySettingMap.get(city).Country__c);
            system.debug('==equals=='+citySettingMap.get(city).Country__c.equals(country));
            system.debug('===not equals=='+!citySettingMap.get(city).Country__c.equals(country));
            if (citySettingMap.get(city).Country__c == null || !citySettingMap.get(city).Country__c.equals(country))
                continue;
            cityOptions.add(new SelectOption(city, city));
        }
        system.debug('===cityOptions=='+cityOptions);
        return null;
    }
}