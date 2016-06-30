public with sharing class RestObjectController {
	

	public String strSessionId;
	public String strObjName;
	public String strResponseBody;
	
	public boolean blnIsObj{get;set;}
	public boolean blnIsRecords{get;set;}
	public boolean blnIsVisible{get;set;}
	public Integer intCountField{get;set;}
	public String strQuery{get;set;}
	
	public List<ResponseData> lstResponseData{get;set;} 
	public List<SelectOption> lstAllObjectNames{get;set;}
	public String strSelectedObject{get;set;}	
	
	public List<SelectOption> lstAllFields{get;set;}
	public Set<String> setFields{get;set;}
	public List<String> strSelectedField{get;set;}
	public List<SObject> lstRecords{get;set;}
	
	public String strEndpoint = 'https://ap1-api.salesforce.com/services/data/v26.0';
	
	public RestObjectController(){
		
		blnIsVisible = false;
		blnIsRecords = false;
		
		lstAllObjectNames = new List<SelectOption>();
		lstAllFields = new List<SelectOption>();
		setFields = new Set<String>();
		fetchObjects();
		system.debug('-----------constructor---------');
	}
	
	public String getSessionId(){
		
		LoginResponse loginResponse = new LoginResponse(); 		
	 	loginResponse = AutoLogin.generateSessionId();
	 	strSessionId = loginResponse.sessionId;	
	 	return  strSessionId;
	}
	public void fetchObjects(){
        system.debug('-------inside fetchObjects()-------');
		blnIsObj = true;	
		blnIsRecords = false;	
		HttpRequest req = new HttpRequest();
      	req.setEndpoint(strEndpoint+ '/sobjects');
      	strSessionId = this.getSessionId();
      	system.debug('----2222strSessionId2222---------'+strSessionId);
      	
 		req.setHeader('Authorization', 'Bearer ' + strSessionId);  		
      	req.setMethod('GET');
      	
      	Http http = new Http();
      	HttpResponse res = http.send(req);
      	strResponseBody = res.getBody();
      	system.debug('----------sessionID----------'+strSessionId);
      	system.debug('----------response----------'+res);
      	system.debug('---------------------strResponseBody---'+strResponseBody);
      	parseJSON(strResponseBody);   
      	system.debug('---1111lstAllObjectNames1111----'+lstAllObjectNames);
      	
	}
	 
	public void fetchFields(){
		
		blnIsObj = false;
		blnIsVisible = true;
		blnIsRecords = false;
		strObjName = strSelectedObject ;
		strSessionId = this.getSessionId();
		HttpRequest req = new HttpRequest();
      	req.setEndpoint(strEndpoint + '/sobjects'+'/' + strObjName +'/describe/') ;
 		req.setHeader('Authorization', 'Bearer ' + strSessionId);  		
      	req.setMethod('GET');
      	
      	Http http = new Http();
      	HttpResponse res = http.send(req);
      	strResponseBody = res.getBody();
      	system.debug('---------------------strResponseBody---'+strResponseBody);
      	parseJSON(strResponseBody);   
	} 
	
	public String generateQuery(){
		
		strQuery = 'SELECT '  ;
		
		for(String strField: strSelectedField){
	  		strQuery += strField + ',';
	  	}
	  	strQuery = strQuery.substringBeforeLast(',');
		strQuery += ' From '+ strObjName;
	 	system.debug('---------------------strQuery---'+strQuery);
	 	return strQuery;
	}
	public void fetchRecords(){

		blnIsRecords = true;
		
		try{
		strSessionId = this.getSessionId();
		HttpRequest req = new HttpRequest();
		
		/*strQuery = 'SELECT '  ;
		
		for(String strField: strSelectedField){
	  		strQuery += strField + ',';
	  	}
	  	strQuery = strQuery.substringBeforeLast(',');
		strQuery += ' From '+ strObjName;*/
		strQuery = this.generateQuery();
	 	system.debug('---------------------strQuery---'+strQuery);
      	final PageReference theUrl = new PageReference(strEndpoint +'/query/');
        theUrl.getParameters().put('q',strQuery); 
         
        req.setEndpoint(theUrl.getUrl());
 		req.setHeader('Authorization', 'Bearer ' + strSessionId);  		
      	req.setMethod('GET');
      	system.debug('---------------------111111111---');
      	Http http = new Http();
      	HttpResponse res = http.send(req);
      	strResponseBody = res.getBody();
      	
      	system.debug('---------------------strResponseBody---'+strResponseBody);
      	   	
      	JSONParser parser = JSON.createParser(strResponseBody);
        do{
            parser.nextToken();
            system.debug('---------------------22222---');
        }while(parser.hasCurrentToken() && !'records'.equals(parser.getCurrentName()));
        parser.nextToken();
        system.debug('---------------------33333---');
        lstRecords = (List<SObject>) parser.readValueAs(List<SObject>.class);
        if(lstRecords.isEmpty()){
        	ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Currently no records present')); 
        }
        system.debug('---------------------lstRecords---'+lstRecords);
		}
		 catch(Exception e){
		 	System.debug('---------------'+e);
           	ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getmessage())); 
        }

	}
	
	public void parseJSON(String pStrJsonr){  
		system.debug('-----parseJSON--pStrJsonr------'+pStrJsonr);
		
		if (pStrJsonr != null){
			lstResponseData = new List<ResponseData>();
		
		  	if (pStrJsonr != null){       
		        JSONParser parser = JSON.createParser(pStrJsonr);  
		      
		  		while (parser.nextToken() != null) {
		  			
	            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
	                (parser.getText() == 'attributes')) {
	      
	                	parser.nextToken();
	                	if (parser.getCurrentToken() == JSONToken.START_OBJECT)  {
		            		
		            			while (parser.nextToken() !=  JSONToken.END_OBJECT) {  
			            				if((parser.getCurrentToken() == JSONToken.FIELD_NAME)){
		        			 		 		parser.nextToken();
		            			 		 }
		            			 }	
	                	}
	             }
	             
	             if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
	                (parser.getText().toLowerCase() == 'name')) {   
	                	
	                	parser.nextToken();
	                	ResponseData objResponseData = new ResponseData();
	                	objResponseData.Name = parser.getText();
	                	lstResponseData.add(objResponseData);		  
	                }
	              
		  		}
		  	}
		
		  	if(blnIsObj){
			  	// Adding all objects in select option list.
			  	for(ResponseData objres : lstResponseData){	  		
			  		lstAllObjectNames.add(new SelectOption(objres.Name, objres.Name));
			  	}	
			  	lstAllObjectNames.sort();	
			  	system.debug('----lstAllObjectNames----'+lstAllObjectNames);  		  	
			 	system.debug('--------------lstResponseData-------'+lstResponseData);	
		  	}
		  	
		  	if(!blnIsObj){
		  		
		  		String strRemove;
		  		String strRemove1;
		  		
		  		setFields.clear();	
		  	 	for(ResponseData objres : lstResponseData){	 
		  	 		 		
		  	 		if(objres.Name == 'Master'){
		  	 			strRemove = objres.Name;
		  	 		}
		  	 		if(objres.Name == strObjName ){
		  	 			strRemove1 = objres.Name;
		  	 		}
		  	 		setFields.add(objres.Name);	
		  	 		setFields.remove(strRemove);
		  	 		setFields.remove(strRemove1);	  	 		
		  	 	}	
			  	lstAllFields.clear();
			  	for(String strObj : setFields){
			  		lstAllFields.add(new SelectOption(strObj, strObj));
			  	}
			  	lstAllFields.sort();
			  	intCountField = lstAllFields.size();
		  	}
		} 	    
	}
	
	 public class ResponseData{  
	 	
        public string Name{get;set;}  
        public ResponseData(){}
    }  
}