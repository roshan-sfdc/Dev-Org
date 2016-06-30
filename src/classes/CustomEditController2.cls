public with sharing class CustomEditController2 {
    
    public String recordId {get; set;}
    public String recordTypeId {get; set;}
    private String objectType;
    
    public CustomEditController2() {}
    
    public Pagereference init() {
        return null;
    }
    
    public Pagereference btn() {
        system.debug('==recordTypeId=='+recordTypeId);
        system.debug('==recordId=='+recordId);
        
        return null;
    }
    
    private String getObjectName(String ObjId) {  
        // get all objects from the org  
        Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe();  
          
        // to store objects and their prefixes  
        Map<String, String> keyPrefixMap = new Map<String, String>{};  
          
        //get the object prefix in IDs  
        Set<String> keyPrefixSet = gd.keySet();  
          
        // fill up the prefixes map  
        for(String sObj : keyPrefixSet)  
        {  
            Schema.DescribeSObjectResult r =  gd.get(sObj).getDescribe();  
            String tempName = r.getName();  
            String tempPrefix = r.getKeyPrefix();  
            keyPrefixMap.put(tempPrefix, tempName);  
        }  
        
        String tPrefix = ObjId;  
        tPrefix = tPrefix.subString(0,3);  
          
        //get the object type now  
        return keyPrefixMap.get(tPrefix);  
    }  
}