public with sharing class OrgConnector {
	public static final map<String,Schema.SObjectType> GLOBAL_DESCRIBE_RESULT = schema.getGlobalDescribe();
	public static final String DEFAULT_PICKLIST_MSG_SELECT = '----Select----';
	public static final String LOGIN_STRING = 'https://www.salesforce.com/services/Soap/u/22.0';
	public static final String QUERY_LOGIN_STRING = 'https://ap1-api.salesforce.com/services/data/v26.0/query/';
	public static final String FETCH_SOBJECTLIST_URL = 'https://ap1-api.salesforce.com/services/data/v26.0/sobjects'; 	
	public static final String LOGIN_SUCCESSFULL = 'You have succesfully logged in';
	public static final String LOGIN_ERROR = 'Login Error';
	
	public String username 									{get; set;}
	public String password 									{get; set;}
	public String selectedObject 							{get; set;}
	public list<selectOption> stdObjectList   				{get; set;}
	public list<selectOption> fieldList						{get; set;}
	public list<String> selectedFieldList 					{get; set;}
	public Integer intNoOfRecs       						{get; set;}
	public list<sObject> sObjectList						{get; set;}
	private String SESSION_ID;
	public String connectionStatusMsg						{get; set;}
	public Boolean logOutBtnRendered						{get; set;}
	
	private set<string> sobjectsFilterSet;			
	
	public transient Httprequest request;
	public transient Http http;
	public transient Httpresponse response;
	
	public OrgConnector()
	{
		initializeVariable();
	}
	
	private void initializeVariable()
	{
		stdObjectList = new list<selectOption>{new SelectOption(DEFAULT_PICKLIST_MSG_SELECT, DEFAULT_PICKLIST_MSG_SELECT)};
		fieldList = new list<selectOption>{new SelectOption(DEFAULT_PICKLIST_MSG_SELECT,DEFAULT_PICKLIST_MSG_SELECT)};
		selectedFieldList = new list<String>(); 
		connectionStatusMsg = '';
		sobjectsFilterSet = new set<string>{'Name','NoteAndAttachment','EmailStatus','OpenActivity','ProcessInstanceHistory','Approval','ActivityHistory'};
		sObjectList = new list<sObject>();
		request = new Httprequest();
		http = new Http();
		response = new Httpresponse();
		logOutBtnRendered = false;
	}

	public Pagereference createOrgConnection() {
		
		try{
			if((password == null || password == '') && (username == null || username==''))
				ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info,'please enter your username and password'));
			else if(username == null || username == '')
				ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info,'Please enter username'));
			else if(password == null || password == '')
				ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info,'Please enter password'));
			else {
				request = new Httprequest();
				request.setEndpoint(LOGIN_STRING);
				request.setMethod('POST');
				request.setHeader('Content-Type', 'text/xml;charset=UTF-8');
				request.setHeader('SOAPAction', '""');
				request.setBody('<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/"><Header/><Body><login xmlns="urn:partner.soap.sforce.com"><username>' + username+ '</username><password>' + password+ '</password></login></Body></Envelope>');
				
				http = new Http();
				response = http.send(request);
				system.debug('------------response.getBody()'+response.getBody());	
						
				if(response.getStatus().equalsIgnoreCase('Ok')) {
					connectionStatusMsg = LOGIN_SUCCESSFULL;
					SESSION_ID = response.getBody().substringBetween('<sessionId>', '</sessionId>');
					getObjectListofDestinationOrg();
					logOutBtnRendered = true;
				}
				else
					ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info,LOGIN_ERROR));
					//connectionStatusMsg = LOGIN_ERROR;
				}
		}catch(Exception ex){
			system.debug('----orgConnectionException----'+ex);
		}
		return null;
	}
	
	private void getObjectListofDestinationOrg() {
		
		try{
			Httprequest objrequest = new Httprequest();
			objrequest.setEndPoint(FETCH_SOBJECTLIST_URL);
			objrequest.setHeader('Authorization', 'OAuth ' + SESSION_ID); 
			objrequest.setMethod('GET');
			
			Http objhttp = new Http();
	      	HttpResponse res = objhttp.send(objrequest);
	      	String strResponseBody = res.getBody();
			
			JSONParser parser = JSON.createParser(strResponseBody);
			
			while(parser.nextToken() != null) {
				if(parser.getCurrentToken() == JSONToken.FIELD_NAME && (parser.getText().toLowerCase() == 'name')) {
					parser.nextToken();
					
					if(!sobjectsFilterSet.contains(parser.getText())) {
						String strobjectAPIName = parser.getText();
						parser.nextToken();
						parser.nextToken();
						String strobjectLabel = parser.getText();
						stdObjectList.add(new SelectOption(strobjectAPIName,strobjectLabel));
						stdObjectList.sort();
					}
				}
			} 
			system.debug('-----stdObjectList----'+stdObjectList);
			
		} catch(Exception ex) {
			system.debug('----fetchObjectsException---'+ex);
		}
	}
	
	/*
	private list<selectOption> getAllStdObjList()
	{
		list<selectOption> stdObjectList = new list<selectOption>();
		stdObjectList.add(new SelectOption(DEFAULT_PICKLIST_MSG_SELECT, DEFAULT_PICKLIST_MSG_SELECT));
		for(schema.Sobjecttype sobjType : GLOBAL_DESCRIBE_RESULT.values())
		{
			if(!String.valueOf(sobjType).endsWith('__c'))
				stdObjectList.add(new SelectOption(String.valueOf(sobjType), String.valueOf(sobjType)));
		} 
		stdObjectList.sort();
		return stdObjectList;
	}
	
	*/
	
	public void fetchFieldsOfSelectedSObject() {
		//sObjectList = new list<SObject>();
		if(selectedObject!= null && selectedObject != '' && !selectedObject.equalsIgnoreCase(DEFAULT_PICKLIST_MSG_SELECT)) {
			fieldList = new list<selectOption>();
			Httprequest request = new Httprequest();
			request.setEndPoint(FETCH_SOBJECTLIST_URL+'/'+selectedObject+'/describe/');
			request.setHeader('Authorization', 'OAuth '+ SESSION_ID);	
			request.setMethod('GET');
			
			Http http = new Http();
			HttpResponse response = http.send(request);
			String resBody = response.getBody();
			system.debug('------resbody-----'+resBody);
				
			JSONParser parser = JSON.createParser(resBody);
			list<String> fieldNameList = new list<String>(); 
			while(parser.nextToken() != null) {
				if(parser.getCurrentToken() == JSONToken.FIELD_NAME && (parser.getText().toLowerCase() == 'name')) {
					parser.nextToken();
					String strFieldName = parser.getText();
					fieldNameList.add(strFieldName);
					if(strFieldName != null && strFieldName != '' && !strFieldName.equals('Master') && !strFieldName.equals(selectedObject) && !strFieldName.equals('Id'))
						fieldList.add(new selectOption(strFieldName,strFieldName));
				}
			}
			fieldList.sort();
			system.debug('---fieldNameList.size()-----'+fieldNameList.size());
			system.debug('-----fieldList-----'+fieldList);
		}else{
			fieldList = new list<selectOption>{new SelectOption(DEFAULT_PICKLIST_MSG_SELECT,DEFAULT_PICKLIST_MSG_SELECT)};
		}
	}
	
	/*
	public Pagereference dogetAllFields() 
	{
		fieldList = new list<selectOption>();
		if(selectedObject!= null && selectedObject != '' && !selectedObject.equalsIgnoreCase(DEFAULT_PICKLIST_MSG_SELECT)) {
			Schema.Sobjecttype sObj =  GLOBAL_DESCRIBE_RESULT.get(selectedObject);
			map<String, Schema.Sobjectfield> SobjectFieldMap = sObj.getDescribe().fields.getMap();
			for(Schema.Sobjectfield field : SobjectFieldMap.values()) {
				fieldList.add(new selectOption(field.getDescribe().getName(),field.getDescribe().getLabel()));
			}
		fieldList.sort();
		}
		else
			fieldList.add(new SelectOption(DEFAULT_PICKLIST_MSG_SELECT,DEFAULT_PICKLIST_MSG_SELECT));
		return null;
	}
	*/
	
	public Pagereference getRecords() {
		
		try{
			sObjectList = new list<Sobject>();
			set<string> selectedFieldSet = new set<string>();
			selectedFieldSet.addAll(selectedFieldList); 
			
			system.debug('-----selectedFieldSet----'+selectedFieldSet);
			if(selectedObject == null || selectedObject == '' || selectedObject.equalsIgnoreCase(DEFAULT_PICKLIST_MSG_SELECT))
				ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info,'Please Select an Object'));
			else
			if(selectedFieldList == null || selectedFieldList.isEmpty() || selectedFieldSet.contains(DEFAULT_PICKLIST_MSG_SELECT)) {
				system.debug('55555555555555555555');
				ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info,'Please select fields'));
			}
				
			else 
			{
				system.debug('--lastelse----');
				String strQuery = generateQuery();
				system.debug('---strQuery---'+strQuery);
				Pagereference theURL = new Pagereference(QUERY_LOGIN_STRING);		
				theURL.getParameters().put('q',strQuery);
				request = new Httprequest();
				request.setEndpoint(theURL.getURL());
				request.setMethod('GET');
				request.setHeader('Authorization', 'OAuth ' + SESSION_ID);
				
				Http http = new Http();
				String strResponseBody = http.send(request).getBody();
				
				system.debug('--------strResponseBody-------'+strResponseBody);
				
				JSONParser parser = JSON.createParser(strResponseBody);
		        do{
		            parser.nextToken();
		        }while(parser.hasCurrentToken() && !'records'.equals(parser.getCurrentName()));
		        parser.nextToken();
		        sObjectList = (List<SObject>) parser.readValueAs(List<SObject>.class);
				if(sObjectList.size() == 0)
					ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info, 'No record available for selected Object'));
				system.debug('-------sObjectList-------'+sObjectList);
			}	
		} catch(Exception ex) {
			//ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info, ex.getMessage()));
			system.debug('-----showTableexception---'+ex);
		} 
		system.debug('-----size-----'+sObjectList.size());
		return null;
	}
	
	private String generateQuery() {
		system.debug('-------selectedFieldList------'+selectedFieldList);
		String strQuery = '';
		if(selectedObject!= null && selectedObject != '' && !selectedObject.equalsIgnoreCase(DEFAULT_PICKLIST_MSG_SELECT)) {
			for(String strFields : selectedFieldList) {
				if(strFields != null && strFields != '' && !strFields.equals(DEFAULT_PICKLIST_MSG_SELECT))
					strQuery = strQuery + strFields + ',';
			}
			
			strQuery = strQuery.removeEnd(',');
			strQuery = 'Select Id, ' + strQuery + ' from ' + selectedObject; 
			if(intNoOfRecs != null && intNoOfRecs > 0)
				strQuery = strQuery + ' LIMIT ' + intNoOfRecs ;
		}
		return strQuery;
	}
	
	public Pagereference doLogout() {
		initializeVariable();
		return null;
	}
	
}