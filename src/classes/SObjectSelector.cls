public abstract with sharing class SObjectSelector {
	
	abstract list<schema.Sobjectfield> getSobjectFieldList();
	
	abstract Schema.Sobjecttype getSObjectType();
	
	public String getSObjectName() {
		return getSObjectType().getDescribe().getName();
	}
	
	public virtual String getOrderBy() {
		return 'name';
	}
	
	abstract list<String> getSObjectRelationalFieldList();
	
	public String getFieldListString() {
		String fieldString = '';
		
		for(Schema.SObjectField field : getSobjectFieldList())
			fieldString += field + ', ';
			
		for(String field : getSObjectRelationalFieldList())
			fieldString += field + ', ';
			
		fieldString = fieldString.removeEnd(', ');
		return fieldString;
	}
	
	public list<SObject> getSObjectById(set<Id> idSet) {
		assertIsAccessible();
		return Database.query(String.format('SELECT {0} from {1} where Id IN : idSet ORDER BY {2}', new list<String>{getFieldListString(), getSObjectName(), getOrderBy()}));
	}
	
	public list<SObject> selectSObjectsByStringCondition(String field, String value) {
		assertIsAccessible();
		return Database.query(String.format('SELECT {0} from {1} where {2} = {5}{3}{5} ORDER BY {4} ', new list<String>{getFieldListString(), getSObjectName(), field, value, getOrderBy(), '\''}));
		
	}
	
	public void assertIsAccessible() {
		if(!getSObjectType().getDescribe().isAccessible())
			throw new SObjectDomain.DomainException('Permision to access an '+ getSObjectType().getDescribe().getName() + ' denied.');
		
	}

}