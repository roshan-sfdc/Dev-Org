public with sharing class DynamicRowPageController {
	public list<DynamicRowWrapper> WrapperList   {get; set;}
	//public list<String> lstString = new list<String>{get{return new list<String>{'a','b','c','d'}}; set;}
	
	public list<String> lstString {
		get {
			return new list<String>{'a','b','c','d'};
		}	
		set;
	}	
	
	public String foo { 
        get {
            return 'ss';
        }
    }
	
	public DynamicRowPageController() {
		WrapperList = new list<DynamicRowWrapper>(); 
		DynamicRowWrapper objWrapper = new DynamicRowWrapper();
		WrapperList.add(objWrapper);
	}
	
	public Pagereference createDynamicRows() {
		DynamicRowWrapper objWrapper = new DynamicRowWrapper();
		WrapperList.add(objWrapper);
		return null;	
	} 
	
	public Pagereference deleteLastRow() {
		if(WrapperList != null && !WrapperList.isEmpty())
			WrapperList.remove(WrapperList.size()- 1);
		return null;
	}
	
	public class DynamicRowWrapper {
		public String strName 			{get; set;}
		public String strAddress 		{get; set;}		
		public Integer intAge			{get; set;}	
		
		public DynamicRowWrapper () {}
		
		public DynamicRowWrapper (String strName, String strAddress,Integer intAge ) {
			this.strName = strName;
			this.strAddress = strAddress;
			this.intAge = intAge;
		}
	}
}