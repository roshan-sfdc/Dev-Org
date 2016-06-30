@RestResource(urlMapping='/Lead/*')
global with sharing class LeadManipulatorClass
{
	global with sharing class ReponseParameters
	 {
	 	global Boolean isSuccess=false;
	    global String lead;
	    global String status;
	 }
   @HttpPost
    global static ReponseParameters doCreate(){
      try{
		      RestRequest req=RestContext.request;
		      RestResponse res=RestContext.response;
		      Lead objLead=new Lead();
		      objLead.FirstName=req.params.get('firstname');
		      objLead.LastName=req.params.get('lastname');
		      objLead.Email=req.params.get('email');
		      objLead.Phone=req.params.get('phone');
		      objLead.Company='ABC';
		      objLead.Status='ClosedConverted';
		      insert objLead;
		      ReponseParameters obj_Res=new ReponseParameters();
	      	  obj_Res.isSuccess=true;
	      	  obj_Res.lead=objLead.Id;
	      	  obj_Res.status='Success';
	      	  return obj_Res;
         }
     catch(Exception ex)  
         { 
         	  ReponseParameters obj_Res=new ReponseParameters();
	      	  obj_Res.isSuccess=false;
	      	  obj_Res.lead='';
	      	  obj_Res.status='Could not create a new Lead';
	      	  return obj_Res;
         }
    }
  
  @HttpDelete
   global static ReponseParameters doDelete()
   {
		     RestRequest req=RestContext.request;
		     RestResponse res=RestContext.response; 
		     string firstName=req.params.get('firstname');
		     string lastname=req.params.get('lastname');
		     string email=req.params.get('email');
		     string phone=req.params.get('phone');
		     List <Lead> lstLead=[select Id,LastName,FirstName from Lead where FirstName=:firstName and LastName=:lastname and Email=:email and Phone=:phone];
		     delete lstLead;
		     ReponseParameters obj_Res=new ReponseParameters();
       if(lstLead.size()!=0)
          { 
	      	 obj_Res.isSuccess=true;
	      	 obj_Res.lead=firstName+lastname;
	      	 obj_Res.status='Success';
          }
        else
         { 
	      	 obj_Res.isSuccess=false;
	      	 obj_Res.lead='';
	      	 obj_Res.status='Could not delete the Lead';
         }
        return obj_Res;
  } 
  
 @HttpPatch
 global static  ReponseParameters  doUpdate(){
 	
  try{	
	 	 RestRequest req=RestContext.request;
	     RestResponse res=RestContext.response; 
	     string firstName=req.params.get('firstname'); 
	     string lastname=req.params.get('lastname');
	     string email=req.params.get('email');
	     string phone=req.params.get('phone');
	     Lead objLead=[select Id,LastName,FirstName from Lead where FirstName=:firstName and LastName=:lastname];
	     objLead.Email=email;
	     objLead.Phone=phone;
	     update objLead;
	     ReponseParameters obj_Res=new ReponseParameters();
	     obj_Res.isSuccess=true;
	     obj_Res.lead=objLead.Id;
	     obj_Res.status='Success';
	     return obj_Res;
     }      
   catch(Exception ex)
     {
     	 ReponseParameters obj_Res=new ReponseParameters();
         obj_Res.isSuccess=false;
         obj_Res.lead='';
      	 obj_Res.status='Could not update the Lead';
         return obj_Res;
     }
 }
 
}