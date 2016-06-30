public with sharing class SObjectDomain {
	public list<SObject> Records {get; private set;}
	
	public class DomainException extends Exception {
		
	} 

}