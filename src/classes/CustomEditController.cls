public with sharing class CustomEditController{
    
    private static final map<String,Schema.SObjectType> sObjectMap = Schema.getGlobalDescribe(); 
    public static final String ADDRESS_INFORMATION = 'Address Information';
    
    public sObject sObjectToBind {get;set;}
    public String recordId {get; set;}
    public String recordTypeId {get; set;}
    public map<String, list<String>> sectionVsFieldsMap {get; set;}
    private list<String> sectionList;
    
    private String objectType;
    private String layoutName;
     
    private set<String> addressFieldSet;
    private set<String> locationFieldSet;
    private set<String> updateableFieldSet;
    
    public CustomEditController() { 
        sectionVsFieldsMap = new map<String, list<String>>(); 
        sectionList = new list<String>(); 
    }
    
    private boolean isInitialize = false;
     
    public list<String> getSectionList() {
        system.debug('==called==');
        system.debug('==recordTypeId+='+recordTypeId);
        if (!isInitialize) {
            objectType = String.valueOf(Id.valueOf(recordId).getSobjectType());
            getUpdateableFields();
            recordTypeId = (recordTypeId != null) ? recordTypeId : '';
            //recordTypeId = (updateableFieldSet.contains('RecordTypeId')) ? getRecordTypeId() : ''; 
            fetchLayout();
            sObjectToBind = Database.query(getQueryString()); 
            
            system.debug('===objectType==='+objectType);
            system.debug('==addressFieldSet=='+addressFieldSet);
            system.debug('==locationFieldSet=='+locationFieldSet);
            system.debug('==updateableFieldSet=='+updateableFieldSet);
            system.debug('==sectionVsFieldsMap=='+sectionVsFieldsMap);
            system.debug('==sectionList=='+sectionList);
            system.debug('==sObjectToBind==='+sObjectToBind);
        }
        isInitialize = true;
        
        return sectionList; 
    }
    
    /*
    private String getRecordTypeId() {
        String query = 'SELECT RecordTypeId from ' + objectType + ' where Id = ' + '\''+ recordId + '\'';
        Sobject sobj = Database.query(query);
        String recType =  String.valueOf(sobj.get('RecordTypeId'));
        return ((recType != null) ? recType : '');
    }
    */
    
    private void fetchLayout() {
        String endpoint = URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v29.0/sobjects/' + objectType + '/describe/layouts';
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        request.setHeader('Content-Type', 'application/json');
        
        HttpResponse response = http.send(request);
        system.debug('===response.getBody()==='+response.getBody());
        
        parseResponse(response.getBody());
    }
    
    public class JsonWrapper {
        public String recordTypeId;
        public String layoutId;
    }
    
    private void parseResponse(String responseBody) {
        String layoutId;
        JSONParser parser = JSON.createParser(responseBody);
        while (parser.nextToken() != null) {
            if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
                if (parser.getCurrentName() == 'recordTypeMappings') {
                    while (parser.nextToken() != null) {
                       if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                           JsonWrapper wrapper = (JsonWrapper)parser.readValueAs(JsonWrapper.class);
                           if (wrapper.recordTypeId.containsIgnoreCase(recordTypeId)) 
                               layoutId = wrapper.layoutId;
                       }
                    }
                }
            }
        }
        system.debug('==layoutId==='+layoutId);
        getPageLayoutName(layoutId);
    }
    
    private void getPageLayoutName(String layoutId) {
        if (layoutId == null)
            return;
        String layoutName;
        MetadataServiceNew.MetadataPort service = createService();
        List<MetadataServiceNew.ListMetadataQuery> queries = new List<MetadataServiceNew.ListMetadataQuery>();
        MetadataServiceNew.ListMetadataQuery queryLayout = new MetadataServiceNew.ListMetadataQuery();
        queryLayout.type_x = 'Layout';
        queries.add(queryLayout);
        MetadataServiceNew.FileProperties[] fileProperties = service.listMetadata(queries, 25);
        
        if(fileProperties!=null) {
            for(MetadataServiceNew.FileProperties fileProperty : fileProperties) {
                if (fileProperty.id.equalsIgnoreCase(layoutId)) {
                    layoutName = fileProperty.fullName;
                    break;
                }
            }
        }
        system.debug('==layoutName==='+layoutName);
        readLayout(layoutName);
    }
     
    private void readLayout(String layoutName) { 
        if (layoutName == null)   
            return;
        MetadataServiceNew.MetadataPort service = createService();
        MetadataServiceNew.Layout layout =
            (MetadataServiceNew.Layout) service.readMetadata('Layout', new String[] { layoutName }).getRecords()[0]; 
        
        for (MetadataServiceNew.LayoutSection obj : layout.layoutSections) {
            sectionList.add(obj.label);
            for (MetadataServiceNew.LayoutColumn lc : obj.layoutColumns) {
                if (lc.layoutItems == null)
                   continue;
                for (MetadataServiceNew.LayoutItem li : lc.layoutItems) {
                    if (li.field == null)
                        continue;
                    if (updateableFieldSet.contains(li.field)) {
                        if (sectionVsFieldsMap.containsKey(obj.label))
                            sectionVsFieldsMap.get(obj.label).add(li.field);
                        else sectionVsFieldsMap.put(obj.label, new list<String> {li.field});
                    }
                    else if (locationFieldSet.contains(li.field)) {
                        String locField = li.field.removeEnd('__c');
                        if (sectionVsFieldsMap.containsKey(obj.label))
                            sectionVsFieldsMap.get(obj.label).addAll(new list<String>{locField+'__latitude__s', locField+'__longitude__s'});
                        else sectionVsFieldsMap.put(obj.label, new list<String> {locField+'__latitude__s', locField+'__longitude__s'});
                    }
                    else if (addressFieldSet.contains(li.field)) {
                        list<String> customAddressList = createAddressFields(li.field);
                        if (sectionVsFieldsMap.containsKey(obj.label))
                            sectionVsFieldsMap.get(obj.label).addAll(customAddressList);
                        else sectionVsFieldsMap.put(obj.label, customAddressList);
                    }
                }
            }
        }
        list<String> sectionListTruncated = new list<String>();
        for (String section : sectionList) {
            if (sectionVsFieldsMap.containsKey(section))
                sectionListTruncated.add(section);
        }
        sectionList = sectionListTruncated;
    }
    
    private list<String> createAddressFields(String addressField) {
        list<String> customAddressList = new list<String>();
        String addressPrefix = addressField.removeEnd('Address');
        customAddressList = new list<String> {
           addressPrefix + 'Street', 
           addressPrefix + 'City', 
           addressPrefix + 'State', 
           addressPrefix + 'PostalCode',
           addressPrefix + 'Country'
        }; 
        return customAddressList;
    }
   
    private void getUpdateableFields() {
        updateableFieldSet = new set<String>();
        locationFieldSet = new set<String>();
        addressFieldSet = new set<String>();
        
        Schema.SObjectType sObjType = sObjectMap.get(objectType); 
        Schema.DescribeSObjectResult describeResult = sObjType.getDescribe(); 
        Map<String,Schema.SObjectField> fieldsMap = describeResult.fields.getMap(); 
        
        for (String field : fieldsMap.keySet()) {
            if (fieldsMap.get(field).getdescribe().isUpdateable())
                updateableFieldSet.add(String.valueOf(fieldsMap.get(field).getdescribe().getSObjectField()));
            if (String.valueOf(fieldsMap.get(field).getdescribe().getType()).equalsIgnoreCase('Location'))
                locationFieldSet.add(String.valueOf(fieldsMap.get(field).getdescribe().getSObjectField()));
            if (String.valueOf(fieldsMap.get(field).getdescribe().getType()).equalsIgnoreCase('Address'))
                addressFieldSet.add(String.valueOf(fieldsMap.get(field).getdescribe().getSObjectField()));
        }
    }
    
    private String getQueryString() {
        String query = 'SELECT Name, ';
        for (String title : sectionVsFieldsMap.keySet()) {
            for (String field : sectionVsFieldsMap.get(title)) {
                query += field + ',';
            }
        }
        query = query.removeEnd(',');
        query += ' from ' +  objectType + ' where Id = ' + '\''+ recordId + '\'';
        return query;
    }
    
    public Pagereference saveRecords() {
        Boolean isReturn = false;
        try {
            Database.Saveresult result = Database.update(sObjectToBind);
            isReturn = result.isSuccess();
        } catch(exception ex) {
            Apexpages.addMessage(new Apexpages.Message(ApexPages.Severity.Info, ex.getMessage()));
        }
        //Pagereference page =  (isReturn ? new Pagereference('/'+recordId) : null);
        Pagereference page = new Pagereference('/'+recordId);
        page.setRedirect(true);
        return page;
    }
    
    public Pagereference cancel() {
        return new Pagereference('/'+recordId);
    }
    
    private static MetadataServiceNew.MetadataPort createService() { 
        MetadataServiceNew.MetadataPort service = new MetadataServiceNew.MetadataPort();
        service.SessionHeader = new MetadataServiceNew.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        return service;     
    }
}