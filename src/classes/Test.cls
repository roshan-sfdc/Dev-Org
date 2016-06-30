public with sharing class Test {
	
	public List<SelectOption> getValues() {
		List<SelectOption> options = new List<SelectOption>();
		options.add(new SelectOption('US','US'));
		options.add(new SelectOption('CANADA','Canada'));
		options.add(new SelectOption('MEXICO','Mexico'));
		return options;
	}
	 
	public string str {get;set;}

}