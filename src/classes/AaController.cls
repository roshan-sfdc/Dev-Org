public with sharing class AaController
{
	/* Comment Added by Ajay */
    public User user {get; set;}
    public String selectedLanguage {get; set;}
    public boolean isDisplayData {get; set;}
    
    public Pagereference init() {
        user = [select ID, LanguageLocaleKey from User where Id = :Userinfo.getUserId()];
        isDisplayData = false;
        return null;
    }
    
    public void updateUser() {
        try {
            Database.Saveresult updateResult = Database.update(user);
            isDisplayData = updateResult.isSuccess();
        } catch(Exception ex) {
            system.debug('---Exception---'+ex);
        }
    }
    
    public class testWrapper {
        String a;
        public testWrapper() {
            
        }
    }
    
/*	List<OpportunityLineItem> lst=new List<OpportunityLineItem>();
	public List<OpportunityLineItem> getDetails()
	{
		lst=[Select Quantity,PricebookEntryId,OpportunityId From OpportunityLineItem where OpportunityId=:ApexPages.currentPage().getParameters().get('cid')];
		return lst;
	}
	
*/
}