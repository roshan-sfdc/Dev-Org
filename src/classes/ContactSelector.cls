public with sharing class ContactSelector extends SObjectSelector{
	
	public list<Schema.Sobjectfield> getSobjectFieldList() {
		return new list<Schema.Sobjectfield> {
			Contact.Id,
			Contact.Name,
			Contact.LastName	
		};
	}
	
	public schema.Sobjecttype getSObjectType() {
		return Contact.Sobjecttype;
	}
	
	public list<String> getSObjectRelationalFieldList() {
		return new list<String> {
			'Contact.Account.Id'
		};
	}
	
	public list<Contact> getContactById(set<id> idSet) {
		return (list<Contact>) getSObjectById(idSet);
	}
	
	public list<Contact> selectContactByStringCondition(String field, String value) {
		return (list<Contact>)selectSObjectsByStringCondition(field, value);
	}
}