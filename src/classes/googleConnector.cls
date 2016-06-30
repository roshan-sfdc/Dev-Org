public with sharing class googleConnector {
	public googleConnector()
	{
		list<sObject> lstAcc = [select Name from Account LIMIT 5];
		system.debug('-----------processList()------------'+processList(lstAcc));
		for(cObject cobj : processList(lstAcc))
		{
			system.debug('@@@@@@@@@'+cobj);
		}
	}
	
	public List<cObject> processList(List<sObject> items)
	{
	    List<cObject> resultList = new List<cObject>();
	    for(sObject s : items)
	    {
		resultList.add(new cObject(s));	
	    }
	    return resultList;
	}
	
	public class cObject
	{
		sObject obj {get; set;}
		
		public cObject(sObject obj)
		{
			this.obj = obj;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/* public void basicAuthCallout(){
     HttpRequest req = new HttpRequest();
     req.setEndpoint('https://www.google.com');
     req.setMethod('POST');
     
     /* req.setHeader('Content-Type', 'text/xml;charset=UTF-8');
        req.setHeader('SOAPAction', '""');
   	req.setBody('<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/"><Header/><Body><login xmlns="urn:partner.soap.sforce.com"><username>' + 'adityag1@hotmail.com'+ '</username><password>' + 'a26817684'+ '</password></login></Body></Envelope>');
     String username = 'roshan.agrawal@roundcorner.com';
     String password = 'roshan@eternus123';
  
     Blob headerValue = Blob.valueOf(username + ':' + password);
     String authorizationHeader = 'BASIC ' +
     EncodingUtil.base64Encode(headerValue);
     req.setHeader('Authorization', authorizationHeader);
   */
     // Create a new http object to send the request object
     // A response object is generated as a result of the request  
  /*
     Http http = new Http();
     HTTPResponse res = http.send(req);
     System.debug('@@@@@@@@@@@@@@@@@ res body:   '+res.getBody());
   }*/
   
   
   
}