public with sharing class Demo 
{
	 //List displayed on UI
    public List<selectoption> supportedObject {get; set;}
    
    //Selected Object
    public String SelectedObject {get; set;}
    
    //Global describe
    Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
    Set<String> objectKeys = gd.keySet();
    
    //Field Select List
    public List<SelectOption> fieldLableAPI {get; set;}
    
    //Selected fields to be displayed in table
    public List<String> SelectedFields {get; set;}
    
    //List to maintain dynamic query result
    public List<sObject> ObjectList {get; set;}
    
    
    //Constructor
    public Demo()
    {
        //Initialize
        supportedObject = new List<selectoption>() ;
        SelectedObject = '' ;
        fieldLableAPI = new List<SelectOption>() ;
        SelectedFields = new List<String>() ;
        ObjectList = new List<sObject>() ;
        
        //Get only reference to objects
        for(Schema.SObjectType item : ProcessInstance.TargetObjectId.getDescribe().getReferenceTo())
        {
            //Excluding custom setting objects
            if(!item.getDescribe().CustomSetting)
            {
                //Adding to list
                supportedObject.add(new SelectOption(item.getDescribe().getLocalName().toLowerCase() , item.getDescribe().getLabel() ));
            }
        }
        
    }
    
    public Pagereference showError() {
        try {
            insert (new Contact());
        } catch(Exception ex) {
            Error.LogException(ex);
        }
        return null;
    }
    
    //Get fields of selected object
    public void ObjectFields()
    {
        if(SelectedObject != '--None--')
        {
            //Creating sObject for dynamic selected object
            Schema.SObjectType systemObjectType = gd.get(SelectedObject);
            //Fetching field results
            Schema.DescribeSObjectResult r = systemObjectType.getDescribe();
                
            Map<String, Schema.SObjectField> M = r.fields.getMap();
            //Creating picklist of fields
            for(Schema.SObjectField fieldAPI : M.values())
            {
                fieldLableAPI.add(new SelectOption(fieldAPI.getDescribe().getName() , fieldAPI.getDescribe().getLabel())) ;
            }
        }
    }
    
    public void ShowTable()
    {
        //Creating dynamic query with selected field
        String myQuery = 'Select Id ' ;
        
        for(String field : SelectedFields)
        {
            if(field.toLowerCase() != 'id' && field.toLowerCase() != '--none--')
            myQuery += ','+ field + ' ' ;
        }
        
        //Limit is 100 for now you can change it according to need
        myQuery += ' from ' + SelectedObject + ' LIMIT 100' ;
        
        //Executing the query and fetching results
        ObjectList = Database.query(myQuery) ;
    }
	/*public list<sObject> lst {get; set;}
	public list<cObject> lstWrapper {get; set;}
	public Demo()
	{
		lst = [select Id, Name from Account LIMIT 5];
		lstWrapper = processList(lst);
		system.debug('----------lstWrapper----------'+lstWrapper);
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
	
	*/
	/*public Integer counter {get;set;}
	
	public Demo()
	{
		counter = 0;
	}
	
	Public Pagereference incrementCounter()
	{
		counter++;
		return null;
	}
	*/
	
}