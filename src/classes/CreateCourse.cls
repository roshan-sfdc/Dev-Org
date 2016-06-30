global class CreateCourse implements Process.Plugin
{
	global Process.PluginResult invoke(Process.PluginRequest request)
	{
		Double Course_duration = (Double)request.inputParameters.get('Course_duration');
		Double totalPayment = (Course_duration)*5;
		map<String,Object> result = new map<String,Object>{'totalPayment' => totalPayment};
		return new Process.PluginResult(result); 		
	}
	
	global Process.PluginDescribeResult	describe()
	{
		Process.PluginDescribeResult result = new Process.PluginDescribeResult();
		result.description = 'This plug-in generates total fees';
		result.Tag = 'total course fees';
		result.inputParameters = new list<Process.PluginDescribeResult.inputParameter>
		{
			new Process.PluginDescribeResult.InputParameter('Course_duration',Process.PluginDescribeResult.ParameterType.Double,true)
		};
		
		result.outputParameters = new list<Process.PluginDescribeResult.outputParameter>
		{
			new Process.PluginDescribeResult.OutputParameter('totalPayment',Process.PluginDescribeResult.ParameterType.Double)
		};
		return result;
	}
}