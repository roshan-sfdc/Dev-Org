public with sharing class RelatedList {
    
    private static Map<String,Schema.SObjectField> fieldsMap = Contact.SobjectType.getDescribe().fields.getMap();
    
    public Account account {get; set;}
    public list<Contact> contactList {get; set;}
    public map<String, String> labelVsAPINameMap {get; private set;}
    
    public Pagereference init() {
        String accId = Apexpages.currentPage().getParameters().get('accID');
        account = Database.query(getQuery(accId));
        contactList = account.contacts;
        return null;
    }
    
    public String getQuery(String accId) {
        String query = 'select Id, Name, ';
    	String childQuery = 'select Name, ';
		labelVsAPINameMap = new map<String, String>();
		for (String field : fieldsMap.keySet()) {
            if (fieldsMap.get(field).getdescribe().isUpdateable()) {
                labelVsAPINameMap.put(field,String.valueOf(fieldsMap.get(field).getdescribe().getLabel()));
                childQuery += field + ',';
            }
		}        
        childQuery = childQuery.removeEnd(',');
        childQuery += ' from Contacts';
        
        query = query + '( ' + childQuery + ' ) from Account where Id = ' + '\''+ accId + '\'';
        return query;
    }
}