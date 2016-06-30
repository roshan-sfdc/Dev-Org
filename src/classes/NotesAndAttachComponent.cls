public with sharing class NotesAndAttachComponent {

	public List<Attachment> attachments {get; set;}
	public map<Id,Account> accountMap {get; private set;}
	public list<AttachmentWrapper> wrapperList {get; set;}
	
	public boolean isNewAttachment {get; set;}
	
	public NotesAndAttachComponent() {
		//list<Account> accountList = [sele];
		//attachments = [SELECT name, Id, ParentId  FROM Attachment WHERE ParentID = '0019000000NoAvP'];
	}
	
	public Pagereference init() {
		String mode = Apexpages.currentPage().getParameters().get('mode');
		isNewAttachment = (!String.isEmpty(mode) && mode.equals('newAttach'))? true : false;
		accountMap = new map<Id,Account>([select Id, Name from Account LIMIT 10]);
		attachments = [SELECT name, Id, ParentId  FROM Attachment WHERE ParentID IN :accountMap.keySet()];
		wrapperList = new list<AttachmentWrapper>();
		for (Attachment attach : attachments) {
			wrapperList.add(new AttachmentWrapper(attach, accountMap.get(attach.ParentId)));
		}
		return null;
	}
	
	public Pagereference createNewAttachment() {
		return new Pagereference('/apex/NotesAndAttachComponent?mode=newAttach');
	}
	
	public class AttachmentWrapper {
		public Attachment attach {get; private set;}
		public Account account {get; private set;}
		
		public attachmentWrapper(Attachment attach, Account account) {
			this.attach = attach;
			this.account = account;	
		}
	}
	

}