public with sharing class SettingsPageController {
    public list<Setting__c> settingList {get; set;}
    
    public String refPage {get { return 'dd';} set;}
    
    public Pagereference init() {
        settingList = [select Id, Referenced_Page__c from Setting__c];
        refPage = 'dd';
        return null;
    }
}