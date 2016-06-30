global class ApexSummaryScheduler implements Schedulable 
{
   global void execute(SchedulableContext sc)
   {
   	 ApexSummaryBatch obj_Apex_Sum_Batch=new ApexSummaryBatch();
   	 Database.executeBatch(obj_Apex_Sum_Batch);
   }
}