public class CampaignControllerExtension_pagination
{
   public final Campaign camp;
   
   public CampaignControllerExtension_pagination()
   {
    
   }
   
   public CampaignControllerExtension_pagination(ApexPages.StandardController controller)
   {
    camp=[select id,Status,startdate,enddate,createdbyid,Name,lastmodifiedbyid,description,type,numbersent,parentid from Campaign where Id=: ApexPages.currentPage().getParameters().get('cid')];
   }
   public Campaign getMyCampaign()
   {
    return camp;
   }
   
       public String geteditlink()
        {
         
        String testid= ApexPages.currentPage().getParameters().get('cid');
        
        string Url = System.URL.getSalesforceBaseUrl().toExternalForm()+'/'+testid+'/e';
        return Url;
        
        }
        

        public String getcopylink()
        {
         
        String testid= ApexPages.currentPage().getParameters().get('cid');
        
        string Url = System.URL.getSalesforceBaseUrl().toExternalForm()+'/'+testid+'/e?clone=1';
        return Url;
        
        }

}