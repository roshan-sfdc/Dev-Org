public with sharing class kk {

    public static String fetchLayout(String objectType) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://c.ap1.visual.force.com/services/data/v29.0/sobjects/Contact/describe/layouts/012000000000000AAA');
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        request.setHeader('Content-Type', 'application/json');
        
        HttpResponse response = http.send(request);
        system.debug('===response.getBody()==='+response.getBody());
        
        /*String endpoint = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v29.0/sobjects/' + objectType + '/describe/layouts';
        system.debug('---endpoint--'+endpoint);
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        request.setHeader('Content-Type', 'application/json');
        
        HttpResponse response = http.send(request);
        system.debug('===response.getBody()==='+response.getBody());
        
        return response.getBody();
        */
        return response.getBody();
    }
    
    public class JsonWrapper2 {
        public String Id;
    }
    
    public static void parseResponsee(String responseBody) {
        JSONParser parser = JSON.createParser(responseBody);
        while (parser.nextToken() != null) {
             if (parser.getCurrentName() == 'id') {
             	//if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
             	    JsonWrapper2 wrapper = (JsonWrapper2)parser.readValueAs(JsonWrapper2.class);
             	    system.debug('===wrapper==='+wrapper);
             	//}
             }
        }
    }
    /////////////////////////////////////////////////////////////////////////////////
    
    public static void parseResponse2(String responseBody, String recordTypeId) {
        String layoutId;
        JSONParser parser = JSON.createParser(responseBody);
        while (parser.nextToken() != null) {
            if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
                if (parser.getCurrentName() == 'recordTypeMappings') {
                    while (parser.nextToken() != null) {
                       if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                           JsonWrapper wrapper = (JsonWrapper)parser.readValueAs(JsonWrapper.class);
                           system.debug('===wrapper==='+wrapper);
                           if (wrapper.recordTypeId.containsIgnoreCase(recordTypeId)) 
                               layoutId = wrapper.layoutId;
                       }
                    }
                }
            }
        }
        system.debug('===layoutId==='+layoutId);
    }
    
    public class JsonWrapper {
        public String recordTypeId;
        public String layoutId;
    }
    
    public static void parseResponse(String responseBody, String recordTypeId) {
        system.debug('===responseBody===='+responseBody);
        system.debug('===recordTypeId==='+recordTypeId);
        String layoutId;
        JSONParser parser = JSON.createParser(responseBody);
        
        map<String,String> recordTypeIdVSLayoutIdMap = new map<String,String>();
        list<JsonWrapper> JsonWrapperList = new list<JsonWrapper>();
        
        while (parser.nextToken() != null) {
            parser.nextToken();
            if (parser.getCurrentToken() == JSONToken.FIELD_NAME && ( parser.getCurrentName().equalsIgnoreCase('layoutId')  
                                                                            || parser.getCurrentName().equalsIgnoreCase('recordTypeId'))) {
            	system.debug('==parser.getCurrentName()=='+parser.getCurrentName());
                while (parser.nextToken() != null) {
                    system.debug('==parser.getCurrentName()=='+parser.getCurrentName());
                    if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                       JsonWrapper obj = (JsonWrapper)parser.readValueAs(JsonWrapper.class);
                       if (obj.layoutId != null && obj.recordTypeId != null) {
                           if (obj.recordTypeId.contains(recordTypeId))
                                layoutId = obj.layoutId;
                       }
                    }
                } 
            }
        }
        system.debug('===layoutId===='+layoutId);
    }

/*	
 public List<String> listObjectFields {get;set;}  
 public sObject sObjectToBind {get;set;}           
    public kk() {  
        
        listObjectFields =  new List<String>();  
        Map<String , Schema.SObjectType> globalDescription = Schema.getGlobalDescribe();  
        //In this example I have hard coded the object name  
        Schema.sObjectType sObjType = globalDescription.get('Account');  
          
        sObjectToBind = sObjType.newSObject();  
        Schema.DescribeSObjectResult r1 = sObjType.getDescribe();  
        
        sObjectToBind = [select Id, Phone, Jigsaw, ParentId, Type from Account where Id='0019000000Dknwc'][0];
        
        Map<String , Schema.SObjectField> mapFieldList = r1.fields.getMap();  
        Integer i = 0;  
        for(Schema.SObjectField field : mapFieldList.values())  
        {  
            Schema.DescribeFieldResult fieldResult = field.getDescribe();  
            if(fieldResult.isAccessible() && fieldResult.isUpdateable())   
                {  
                    listObjectFields.add(fieldResult.getName());  
                }  
            if(i == 5)  
                break;  
              
            i++;  
        }  
    }  */
}