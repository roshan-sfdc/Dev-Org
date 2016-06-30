public with sharing class CustomEditControllerOld {
    
    private static final map<String,Schema.SObjectType> sObjectMap = Schema.getGlobalDescribe(); 
    public static final String ADDRESS_INFORMATION = 'Address Information';
    
    public sObject sObjectToBind {get;set;}    
    private String recordId;
    private String recordTypeId;
    public map<String, list<String>> sectionVsFieldsMap {get; set;}
    public list<String> sectionList {get; set;}
    
    private String objectType;
    private String layoutName;
    
    private set<String> addressFieldSet;
    private set<String> locationFieldSet;
    private set<String> updateableFieldSet;
    
    public CustomEditControllerOld () {
        sectionVsFieldsMap = new map<String, list<String>>();
        sectionList = new list<String>();
        
        recordId = Apexpages.currentPage().getParameters().get('recordId');
        recordTypeId = Apexpages.currentPage().getParameters().get('recordTypeId');
        recordTypeId = (recordTypeId != null) ? recordTypeId : '';
        
        objectType = String.valueOf(Id.valueOf(recordId).getSobjectType());
        getUpdateableFields();
        fetchLayout();
        sObjectToBind = Database.query(getQueryString());
    }
    
    public void fetchLayout() {
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
    
    public void parseResponse(String responseBody) {
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
        getPageLayoutName(layoutId);
    }
    
    public void getPageLayoutName(String layoutId) {
        if (layoutId == null)
            return;
        String layoutName;
        MetadataService.MetadataPort service = createService();
        List<MetadataService.ListMetadataQuery> queries = new List<MetadataService.ListMetadataQuery>();
        MetadataService.ListMetadataQuery queryLayout = new MetadataService.ListMetadataQuery();
        queryLayout.type_x = 'Layout';
        queries.add(queryLayout);
        MetadataService.FileProperties[] fileProperties = service.listMetadata(queries, 25);
        
        if(fileProperties!=null) {
            for(MetadataService.FileProperties fileProperty : fileProperties) {
                if (fileProperty.id.equalsIgnoreCase(layoutId))
                    layoutName = fileProperty.fullName;
            }
        }
        readLayout(layoutName);
    }
     
    public void readLayout(String layoutName) { 
        if (layoutName == null)   
            return;
        MetadataServiceNew.MetadataPort service = new MetadataServiceNew.MetadataPort();
        service.SessionHeader = new MetadataServiceNew.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        
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
        String query = 'SELECT ';
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
            Database.Upsertresult result = Database.upsert(sObjectToBind);
            isReturn = result.isSuccess();
        } catch(exception ex) {
            Apexpages.addMessage(new Apexpages.Message(ApexPages.Severity.Info, ex.getMessage()));
        }
        return (isReturn ? new Pagereference('/'+recordId) : null);
    }
    
    public Pagereference cancel() {
        return new Pagereference('/'+recordId);
    }
    
    private static MetadataService.MetadataPort createService() { 
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        return service;     
    }
}