public with sharing class TestMetadataAPI {
    
    public static void createObject() 
    {
        MetadataService.MetadataPort service = createService();     
        MetadataService.CustomObject customObject = new MetadataService.CustomObject();
        customObject.fullName = 'Test__c';
        customObject.label = 'Test';
        customObject.pluralLabel = 'Tests';
        customObject.nameField = new MetadataService.CustomField();
        customObject.nameField.type_x = 'Text';
        customObject.nameField.label = 'Test Record';
        customObject.deploymentStatus = 'Deployed';
        customObject.sharingModel = 'ReadWrite'; 
        MetadataService.AsyncResult[] results = service.create( new MetadataService.Metadata[] {customObject});
    }
    
    public static void createField()  
    {
        MetadataService.MetadataPort service = createService();     
        MetadataService.CustomField customField = new MetadataService.CustomField();
        //customField.fullName = 'Test__c.TestField__c'; 
        customField.label = 'Test Field';
        customField.type_x = 'Text';
        customField.length = 42;
        MetadataService.AsyncResult[] results = service.create(new List<MetadataService.Metadata> { customField });
    }
    
    public static void createPage()
    {
        MetadataService.MetadataPort service = createService();     
        MetadataService.ApexPage apexPage = new MetadataService.ApexPage();
        apexPage.apiVersion = 25;
        apexPage.fullName = 'test';
        apexPage.label = 'Test Page';
        apexPage.content = EncodingUtil.base64Encode(Blob.valueOf('<apex:page/>'));
        MetadataService.AsyncResult[] results = service.create(new List<MetadataService.Metadata> { apexPage });
    }
    
    public static void updateField()
    {
        MetadataService.MetadataPort service = createService(); 
         
        MetadataService.CustomObject customObject = new MetadataService.CustomObject();
        customObject.fullName = 'Test__c';
        customObject.label = 'Test';
        customObject.pluralLabel = 'Tests';
        customObject.nameField = new MetadataService.CustomField();
        customObject.nameField.type_x = 'Text';
        customObject.nameField.label = 'Test Record';
        customObject.deploymentStatus = 'Deployed';
        customObject.sharingModel = 'ReadWrite'; 
    
        MetadataService.UpdateMetadata ut = new MetadataService.UpdateMetadata();
        ut.currentName = 'Test__c'; 
        ut.metadata= customObject;
    
        MetadataService.AsyncResult[] results = service.updateMetadata(new List<MetadataService.updateMetadata> {ut});
    }
    
    public static void readCustomField(String fieldName) {
        MetadataServiceNew.MetadataPort service = new MetadataServiceNew.MetadataPort();
        service.SessionHeader = new MetadataServiceNew.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        
        MetadataServiceNew.CustomField field =
            (MetadataServiceNew.CustomField) service.readMetadata('CustomField', new String[] { fieldName }).getRecords()[0]; 

        system.debug('====field===='+field);
        
        system.debug('====type===='+field.type);
        system.debug('====type_x===='+field.type_x);
        system.debug('===required==='+field.required);
        system.debug('===fullName==='+field.fullName);//picklist
        system.debug('===picklist==='+field.picklist.picklistValues);
        for (MetadataServiceNew.PicklistValue val : field.picklist.picklistValues) {
            system.debug('==@@@=='+val.fullName);
        }
        
        /*
        for (MetadataServiceNew.LayoutSection obj : layout.layoutSections) {
            for (MetadataServiceNew.LayoutColumn lc : obj.layoutColumns) {
                if (lc.layoutItems != null) {
                    for (MetadataServiceNew.LayoutItem li : lc.layoutItems) {
                        if (getUpdateableFields().contains(li.field)) {
                            if (sectionVsFieldsMap.containsKey(obj.label))
                                sectionVsFieldsMap.get(obj.label).add(li.field);
                            else sectionVsFieldsMap.put(obj.label, new list<String> {li.field}); 
                        }
                    }
                }
            }
        }
        
        system.debug('=sectionVsFieldsMap='+sectionVsFieldsMap);*/
    } 
    
    public static void getMetadata() {
        MetadataService.MetadataPort service = createService();
        MetadataService.DescribeMetadataResult describeResult = service.describeMetadata(26);
        
        system.debug('===describeResult==='+describeResult);
    }
    
/******************************************HomePageComponent**************************************************************/

    public static void createHomePageComponent() {
        MetadataService.MetadataPort service = createService();   
        MetadataService.HomePageComponent comp = new MetadataService.HomePageComponent();
        comp.fullName = 'aaa';
        comp.pageComponentType = 'htmlArea';
        comp.body = 'testBody';
        comp.links = new String[] {'www.google.com'};
        comp.width = 'wide';
        
        MetadataService.AsyncResult[] results = service.create( new MetadataService.Metadata[] {comp});
    }
/******************************************HomePageComponent**************************************************************/
    
/******************************************HomePageLayout*****************************************************************/

    public static void createHomePageLayout() {
        MetadataService.MetadataPort service = createService();     
        MetadataService.HomePageLayout homePageLayout = new MetadataService.HomePageLayout();
        homePageLayout.fullName = 'Tst';
        homePageLayout.narrowComponents = new String[] {'standard-CreateNew'};
        homePageLayout.wideComponents = new String[] {'ddd'};
        
        MetadataService.AsyncResult[] results = service.create( new MetadataService.Metadata[] {homePageLayout});
    }
    
    public static void readHomePageLayout(String layoutName) { 
        
        MetadataServiceNew.MetadataPort service = new MetadataServiceNew.MetadataPort();
        service.SessionHeader = new MetadataServiceNew.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        
        MetadataServiceNew.HomePageLayout layout =
            (MetadataServiceNew.HomePageLayout) service.readMetadata('HomePageLayout', new String[] { layoutName }).getRecords()[0];
        
        system.debug('===narrowComponents==='+layout.narrowComponents);
        system.debug('===wideComponents==='+layout.wideComponents);
    }
    
    public static void updateHomePageLayout(String layoutName, list<String> narrowComponentsList, list<String> wideComponentsList) {
        MetadataService.MetadataPort service = createService();  
           
        MetadataService.HomePageLayout homePageLayout = new MetadataService.HomePageLayout();
        homePageLayout.fullName = layoutName;
        
        narrowComponentsList.addAll(getHomePageComponents('Narrow Components'));
        wideComponentsList.addAll(getHomePageComponents('Wide Components'));
        
        homePageLayout.narrowComponents = narrowComponentsList;
        homePageLayout.wideComponents = wideComponentsList;
        
        MetadataService.UpdateMetadata ut = new MetadataService.UpdateMetadata(); 
        ut.currentName = layoutName; 
        ut.metadata= homePageLayout; 
        
        MetadataService.AsyncResult[] results = service.updateMetadata(new List<MetadataService.updateMetadata> {ut}); 
    }
     
    public static list<String> getHomePageComponents(String componentType) {
        list<String> HomePageComponentsList = new list<String>();
        
        MetadataServiceNew.MetadataPort service = new MetadataServiceNew.MetadataPort();
        service.SessionHeader = new MetadataServiceNew.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        
        MetadataServiceNew.HomePageLayout layout =
            (MetadataServiceNew.HomePageLayout) service.readMetadata('HomePageLayout', new String[] { 'TestLayout' }).getRecords()[0];
         
        if (componentType.equalsIgnoreCase('Narrow Component'))
            HomePageComponentsList = layout.narrowComponents;
        else if (componentType.equalsIgnoreCase('Wide Component'))
            HomePageComponentsList = layout.wideComponents;
        return HomePageComponentsList;
    }
    
    /*
    public void updateHomePageLayout2() {
        HomeLayoutMetadata.MetadataPort service = createService();  
           
        HomeLayoutMetadata.HomePageLayout homePageLayout = new HomeLayoutMetadata.HomePageLayout();
        homePageLayout.fullName = 'Tst'; //TestLayout
        homePageLayout.narrowComponents = new String[] {'standard-Tags','standard-CreateNew','standard-StandardSearch'};
        homePageLayout.wideComponents = new String[] {'TestComponent'};
        
        //homePageLayout.narrowComponents = new String[] {};
        //homePageLayout.wideComponents = new String[] {};
        
        HomeLayoutMetadata.UpdateMetadata ut = new HomeLayoutMetadata.UpdateMetadata(); 
        ut.currentName = 'Tst'; 
        ut.metadata= homePageLayout; 
        
        HomeLayoutMetadata.AsyncResult[] results = service.updateMetadata(new List<HomeLayoutMetadata.updateMetadata> {ut}); 
    }
    */
    
/******************************************HomePageLayout*****************************************************************/
    
/******************************************Layout*************************************************************************/    
    
    public static void readLayout(String layoutName) {
        
        MetadataServiceNew.MetadataPort service = new MetadataServiceNew.MetadataPort();
        service.SessionHeader = new MetadataServiceNew.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        
        //'Campaign-Campaign Layout'
        
        MetadataServiceNew.Layout layout =
            (MetadataServiceNew.Layout) service.readMetadata('Layout', new String[] { layoutName }).getRecords()[0]; 
            
        system.debug('===layout==='+layout);
        system.debug('===customButtons==='+layout.customButtons);
        system.debug('====headers===='+layout.headers);
        system.debug('====layoutSections===='+layout.layoutSections);
        
        for (MetadataServiceNew.LayoutSection obj : layout.layoutSections) {
            //system.debug('==@customLabel@=='+obj.customLabel);
            system.debug('==@label@=='+obj.label);
            //system.debug('==@layoutColumns@=='+obj.layoutColumns);
            for (MetadataServiceNew.LayoutColumn lc : obj.layoutColumns) {
                //system.debug('==reserved=='+lc.reserved);
                //system.debug('==layoutItems=='+lc.layoutItems);
                if (lc.layoutItems != null) {
                    for (MetadataServiceNew.LayoutItem li : lc.layoutItems) {
                        system.debug('==field=='+li.field);
                    }
                }
            }
         /* system.debug('==@style@=='+obj.style);
            system.debug('==@detailHeading@=='+obj.detailHeading);
            system.debug('==@editHeading@=='+obj.editHeading); */
            system.debug('===@@@@@===');
         
        }
        /*
        for (MetadataServiceNew.RelatedListItem obj : layout.relatedLists) {
            //system.debug('==#customButtons#=='+obj.customButtons);
            //system.debug('==#excludeButtons#=='+obj.excludeButtons);
            system.debug('==#fields#=='+obj.fields);
            system.debug('==#relatedList#=='+obj.relatedList);
            //system.debug('==#sortField#=='+obj.sortField);
            //system.debug('==#sortOrder#=='+obj.sortOrder);
            system.debug('===####===');
        }
        */
        system.debug('====miniLayout===='+layout.miniLayout);
        system.debug('====multilineLayoutFields===='+layout.multilineLayoutFields);
        system.debug('====relatedLists===='+layout.relatedLists);
        system.debug('====relatedObjects===='+layout.relatedObjects);
    }
    
    public static void getPageLayout()
    {
        // List Metadata items for the selected Metadata Type
        //MetaDataItems = new List<SelectOption>();
        list<String> MetaDataItems1 = new list<String>();
        list<String> MetaDataItems2 = new list<String>();
        
        MetadataService.MetadataPort service = createService();
        List<MetadataService.ListMetadataQuery> queries = new List<MetadataService.ListMetadataQuery>();
        MetadataService.ListMetadataQuery queryLayout = new MetadataService.ListMetadataQuery();
        //queryLayout.folder = MetaDataFolder;
        queryLayout.type_x = 'CustomField';//'Layout';//'Profile';RecordType
        //queryLayout.type_x = 'CustomObject'; //RecordType
        //queryLayout.type_x = 'HomePageLayout';//'RecordType';
        queries.add(queryLayout);
        MetadataService.FileProperties[] fileProperties = service.listMetadata(queries, 25);
        MetadataService.FileProperties[] lst = new MetadataService.FileProperties[] {};
        // Sort
        List<String> fullNames = new List<String>();
        if(fileProperties!=null)
        {
            for(MetadataService.FileProperties fileProperty : fileProperties) {
                fullNames.add(fileProperty.fullName); 
                //if (fileProperty.fullName.containsIgnoreCase('McLabs2__Sale__c-Lease Layout')) //Campaign-Campaign Layout //McLabs2__Sale__c-Lease Layout
                    //lst.add(fileProperty);
            }
                fullNames.sort();
                for(String fullName : fullNames) {
                    MetaDataItems1.add(fullName);
                    MetaDataItems2.add(EncodingUtil.urlDecode(fullName, 'UTF-8'));
                    system.debug('==fullName=='+fullName);
                    system.debug('==EncodingUtil=='+EncodingUtil.urlDecode(fullName, 'UTF-8'));
                }
            //MetaDataItems.add(new SelectOption(fullName,EncodingUtil.urlDecode(fullName, 'UTF-8')));
        }
        system.debug('==MetaDataItems1=='+MetaDataItems1);
        system.debug('==MetaDataItems2=='+MetaDataItems2);
        system.debug('===fileProperties===='+fileProperties);
        system.debug('===lst==='+lst);
    }
/******************************************Layout*************************************************************************/
    
/******************************************Record Type********************************************************************/
    public static void readRecordType(String recordTypeName) {
        //String recordTypeName;
        MetadataServiceNew.MetadataPort service = new MetadataServiceNew.MetadataPort();
        service.SessionHeader = new MetadataServiceNew.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        
        //'Campaign-Campaign Layout'
        
        MetadataServiceNew.RecordType recordType =
            (MetadataServiceNew.RecordType) service.readMetadata('RecordType', new String[] { recordTypeName }).getRecords()[0]; 
            
        system.debug('===recordType==='+recordType);
        system.debug('===compactLayoutAssignment==='+recordType.compactLayoutAssignment);
    }
  /*  
    public static void readProfileLayoutAssignemnt(String profile) {
        //String recordTypeName;
        MetadataServiceNew.MetadataPort service = new MetadataServiceNew.MetadataPort();
        service.SessionHeader = new MetadataServiceNew.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        
        //'Campaign-Campaign Layout'
        
        MetadataServiceNew.ProfileLayoutAssignment recordType =
            (MetadataServiceNew.ProfileLayoutAssignment) service.readMetadataWithContent('ProfileLayoutAssignment', new String[] { profile }).getRecords()[0]; 
            
        system.debug('===recordType==='+recordType);
    }
    */
    
/******************************************Record Type********************************************************************/    
    public static void retrieveMetadataItem() {
        MetadataService.MetadataPort service = createService();
        MetadataService.RetrieveRequest retrieveRequest = new MetadataService.RetrieveRequest();
        retrieveRequest.apiVersion = 25;
        retrieveRequest.packageNames = null;
        retrieveRequest.singlePackage = true;
        retrieveRequest.specificFiles = null;
        retrieveRequest.unpackaged = new MetadataService.Package_x();
        retrieveRequest.unpackaged.types = new List<MetadataService.PackageTypeMembers>();
        MetadataService.PackageTypeMembers packageType = new MetadataService.PackageTypeMembers();
        packageType.name = 'Layout';
        packageType.members = new String[] { 'Campaign-Campaign Layout' };
        retrieveRequest.unpackaged.types.add(packageType);
        MetadataService.AsyncResult AsyncResult = service.retrieve(retrieveRequest);
        
        system.debug('==AsyncResult=='+AsyncResult);
        
    }
    
/*  
    
    public static void listMetadata()
    {
        MetadataService.MetadataPort service = createService();     
        List<MetadataService.ListMetadataQuery> queries = new List<MetadataService.ListMetadataQuery>();        
        MetadataService.ListMetadataQuery queryWorkflow = new MetadataService.ListMetadataQuery();
        queryWorkflow.type_x = 'Workflow';
        queries.add(queryWorkflow);     
        MetadataService.ListMetadataQuery queryValidationRule = new MetadataService.ListMetadataQuery();
        queryValidationRule.type_x = 'ValidationRule';
        queries.add(queryValidationRule);       
        MetadataService.FileProperties[] fileProperties = service.listMetadata(queries, 25);
        for(MetadataService.FileProperties fileProperty : fileProperties)
            System.debug(fileProperty.fullName);
    }
    */
    public static MetadataService.MetadataPort createService()
    { 
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        return service;     
    }
    
    public static void readProfile() { 
        
        MetadataServiceNew.MetadataPort service = new MetadataServiceNew.MetadataPort();
        service.SessionHeader = new MetadataServiceNew.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        
        MetadataServiceNew.Profile layout =
            (MetadataServiceNew.Profile) service.readMetadata('Profile', new String[] { 'Admin' }).getRecords()[0];
        system.debug('===layout==='+layout.layoutAssignments); 
        
        for (MetadataServiceNew.ProfileLayoutAssignment obj : layout.layoutAssignments) {
            //if (obj.layout.containsIgnoreCase('Home')) 
                system.debug('==@@@=='+obj.layout);
        }
    } 
    
}