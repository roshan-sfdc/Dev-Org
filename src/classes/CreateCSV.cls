public with sharing class CreateCSV {

public CreateCSV() {
	list<String> fieldList = new list<String>(); 
	String str = '';
	map<String, Schema.Sobjectfield> SobjectFieldMap = schema.getGlobalDescribe().get('Account').getDescribe().fields.getMap();
	for(Schema.Sobjectfield field : SobjectFieldMap.values()) {
				fieldList.add(field.getDescribe().getName());
			}
	for(String s : fieldList)
	{
		str =  str + s +'\n';
	}
	Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
	blob csvBlob = Blob.valueOf(str);
	string csvname= 'fieldList.csv';
	csvAttc.setFileName(csvname);
	csvAttc.setBody(csvBlob);
	Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
	String[] toAddresses = new list<string> {'roshan1234agrawal@gmail.com'};
	String subject ='Account CSV';
	email.setSubject(subject);
	email.setToAddresses( toAddresses );
	email.setPlainTextBody('Account CSV ');
	email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
	Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
	
	/*----------------------------------------------------------------------------------------------------
	List<Account > acclist = [Select id,name , CreatedDate , lastModifiedDate from Account limit 10];
	string header = 'Record Id, Name , Created Date, Modified Date \n';
	string finalstr = header ;
	for(Account a: acclist)
	{
	       string recordString = a.id+','+a.Name+','+a.CreatedDate+','+a.LastModifiedDate +'\n';
	       finalstr = finalstr +recordString;
	}
	Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
	blob csvBlob = Blob.valueOf(finalstr);
	string csvname= 'Account.csv';
	csvAttc.setFileName(csvname);
	csvAttc.setBody(csvBlob);
	Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
	String[] toAddresses = new list<string> {'roshan1234agrawal@gmail.com'};
	String subject ='Account CSV';
	email.setSubject(subject);
	email.setToAddresses( toAddresses );
	email.setPlainTextBody('Account CSV ');
	email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
	Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
	*/
}


}