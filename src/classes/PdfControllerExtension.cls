public with sharing class PdfControllerExtension 
{
	ID id;
	public PdfControllerExtension(){}
	List<QuoteLineItem>lstQuoteLineItem=new List<QuoteLineItem>();
	public PdfControllerExtension(ApexPages.StandardController controller)
	{
		id=controller.getRecord().Id;
		lstQuoteLineItem=[select PricebookEntryId,TotalPrice,Quote.Discount,UnitPrice,PricebookEntry.Product2.Name,Subtotal,Quantity,ListPrice,Discount from QuoteLineItem where QuoteId=:id];
	}
	public List<QuoteLineItem> getQuoteLineItemss()
	{
		return lstQuoteLineItem;
	}
}