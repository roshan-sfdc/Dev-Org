public with sharing class PriceBoookController 
{
   public List<PricebookEntry> getPriceDetails()
   {
   	  List<PricebookEntry> lst_Price=[select Name,PriceBook2Id,Product2Id,ProductCode from PricebookEntry where  PriceBook2Id IN (select Id from Pricebook2)];
   	  return lst_Price;
   }
   public String getLink()
	{
		String url=system.URL.getSalesforceBaseUrl().toExternalForm();
		return url;
	}
	
}