public with sharing class HomeLayoutMetadata {
	
	
    public class listMetadataResponse_element {
        public MetadataService.FileProperties[] result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata','FileProperties','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class DescribeMetadataResult {
        public MetadataService.DescribeMetadataObject[] metadataObjects;
        public String organizationNamespace;
        public Boolean partialSaveAllowed;
        public Boolean testRequired;
        private String[] metadataObjects_type_info = new String[]{'metadataObjects','http://soap.sforce.com/2006/04/metadata','DescribeMetadataObject','0','-1','false'};
        private String[] organizationNamespace_type_info = new String[]{'organizationNamespace','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] partialSaveAllowed_type_info = new String[]{'partialSaveAllowed','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] testRequired_type_info = new String[]{'testRequired','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'metadataObjects','organizationNamespace','partialSaveAllowed','testRequired'};
    }
    public class IdeasSettings {
        public Boolean enableIdeaThemes;
        public Boolean enableIdeas;
        public Boolean enableIdeasReputation;
        public Double halfLife;
        private String[] enableIdeaThemes_type_info = new String[]{'enableIdeaThemes','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] enableIdeas_type_info = new String[]{'enableIdeas','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] enableIdeasReputation_type_info = new String[]{'enableIdeasReputation','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] halfLife_type_info = new String[]{'halfLife','http://www.w3.org/2001/XMLSchema','double','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'enableIdeaThemes','enableIdeas','enableIdeasReputation','halfLife'};
    }
    public class Country {
        public Boolean active;
        public String integrationValue;
        public String isoCode;
        public String label;
        public Boolean orgDefault;
        public Boolean standard;
        public MetadataService.State[] states;
        public Boolean visible;
        private String[] active_type_info = new String[]{'active','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] integrationValue_type_info = new String[]{'integrationValue','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] isoCode_type_info = new String[]{'isoCode','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] label_type_info = new String[]{'label','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] orgDefault_type_info = new String[]{'orgDefault','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] standard_type_info = new String[]{'standard','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] states_type_info = new String[]{'states','http://soap.sforce.com/2006/04/metadata','State','0','-1','false'};
        private String[] visible_type_info = new String[]{'visible','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'active','integrationValue','isoCode','label','orgDefault','standard','states','visible'};
    }
    public class PermissionSetApexClassAccess {
        public String apexClass;
        public Boolean enabled;
        private String[] apexClass_type_info = new String[]{'apexClass','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] enabled_type_info = new String[]{'enabled','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'apexClass','enabled'};
    }
    public class LiveAgentSettings {
        public Boolean enableLiveAgent;
        private String[] enableLiveAgent_type_info = new String[]{'enableLiveAgent','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'enableLiveAgent'};
    }
    public class SkillAssignments {
        public MetadataService.SkillProfileAssignments profiles;
        public MetadataService.SkillUserAssignments users;
        private String[] profiles_type_info = new String[]{'profiles','http://soap.sforce.com/2006/04/metadata','SkillProfileAssignments','0','1','false'};
        private String[] users_type_info = new String[]{'users','http://soap.sforce.com/2006/04/metadata','SkillUserAssignments','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'profiles','users'};
    }
    public class LogInfo {
        public String category;
        public String level;
        private String[] category_type_info = new String[]{'category','http://soap.sforce.com/2006/04/metadata','LogCategory','1','1','false'};
        private String[] level_type_info = new String[]{'level','http://soap.sforce.com/2006/04/metadata','LogCategoryLevel','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'category','level'};
    }
    public class WorkflowTaskTranslation {
        public String description;
        public String name;
        public String subject;
        private String[] description_type_info = new String[]{'description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] name_type_info = new String[]{'name','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] subject_type_info = new String[]{'subject','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'description','name','subject'};
    }
    public class FlowElement {
        public String description;
        public String name;
        private String[] description_type_info = new String[]{'description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] name_type_info = new String[]{'name','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'description','name'};
    }
    public class ReportBlockInfo {
        public MetadataService.ReportAggregateReference[] aggregateReferences;
        public String blockId;
        public String joinTable;
        private String[] aggregateReferences_type_info = new String[]{'aggregateReferences','http://soap.sforce.com/2006/04/metadata','ReportAggregateReference','0','-1','false'};
        private String[] blockId_type_info = new String[]{'blockId','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] joinTable_type_info = new String[]{'joinTable','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'aggregateReferences','blockId','joinTable'};
    }
    public class describeMetadataResponse_element {
        public MetadataService.DescribeMetadataResult result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata','DescribeMetadataResult','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class CaseOwnerSharingRule {
        public String caseAccessLevel;
        public String name;
        private String[] caseAccessLevel_type_info = new String[]{'caseAccessLevel','http://soap.sforce.com/2006/04/metadata','ShareAccessLevelReadEdit','1','1','false'};
        private String[] name_type_info = new String[]{'name','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'caseAccessLevel','name'};
    }
    public class DeployMessage {
        public Boolean changed;
        public Integer columnNumber;
        public Boolean created;
        public Boolean deleted;
        public String fileName;
        public String fullName;
        public String id;
        public Integer lineNumber;
        public String problem;
        public String problemType;
        public Boolean success;
        private String[] changed_type_info = new String[]{'changed','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] columnNumber_type_info = new String[]{'columnNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] created_type_info = new String[]{'created','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] deleted_type_info = new String[]{'deleted','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] fileName_type_info = new String[]{'fileName','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] fullName_type_info = new String[]{'fullName','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] id_type_info = new String[]{'id','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] lineNumber_type_info = new String[]{'lineNumber','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] problem_type_info = new String[]{'problem','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] problemType_type_info = new String[]{'problemType','http://soap.sforce.com/2006/04/metadata','DeployProblemType','0','1','false'};
        private String[] success_type_info = new String[]{'success','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'changed','columnNumber','created','deleted','fileName','fullName','id','lineNumber','problem','problemType','success'};
    }
    public class FlowSubflowInputAssignment {
        public String name;
        public MetadataService.FlowElementReferenceOrValue value;
        private String[] name_type_info = new String[]{'name','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] value_type_info = new String[]{'value','http://soap.sforce.com/2006/04/metadata','FlowElementReferenceOrValue','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'name','value'};
    }
    public class CodeCoverageResult {
        public MetadataService.CodeLocation[] dmlInfo;
        public String id;
        public MetadataService.CodeLocation[] locationsNotCovered;
        public MetadataService.CodeLocation[] methodInfo;
        public String name;
        public String namespace;
        public Integer numLocations;
        public Integer numLocationsNotCovered;
        public MetadataService.CodeLocation[] soqlInfo;
        public MetadataService.CodeLocation[] soslInfo;
        public String type_x;
        private String[] dmlInfo_type_info = new String[]{'dmlInfo','http://soap.sforce.com/2006/04/metadata','CodeLocation','0','-1','false'};
        private String[] id_type_info = new String[]{'id','http://soap.sforce.com/2006/04/metadata','ID','1','1','false'};
        private String[] locationsNotCovered_type_info = new String[]{'locationsNotCovered','http://soap.sforce.com/2006/04/metadata','CodeLocation','0','-1','false'};
        private String[] methodInfo_type_info = new String[]{'methodInfo','http://soap.sforce.com/2006/04/metadata','CodeLocation','0','-1','false'};
        private String[] name_type_info = new String[]{'name','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] namespace_type_info = new String[]{'namespace','http://www.w3.org/2001/XMLSchema','string','1','1','true'};
        private String[] numLocations_type_info = new String[]{'numLocations','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] numLocationsNotCovered_type_info = new String[]{'numLocationsNotCovered','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] soqlInfo_type_info = new String[]{'soqlInfo','http://soap.sforce.com/2006/04/metadata','CodeLocation','0','-1','false'};
        private String[] soslInfo_type_info = new String[]{'soslInfo','http://soap.sforce.com/2006/04/metadata','CodeLocation','0','-1','false'};
        private String[] type_x_type_info = new String[]{'type','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'dmlInfo','id','locationsNotCovered','methodInfo','name','namespace','numLocations','numLocationsNotCovered','soqlInfo','soslInfo','type_x'};
    }
    public class describeMetadata_element {
        public Double asOfVersion;
        private String[] asOfVersion_type_info = new String[]{'asOfVersion','http://www.w3.org/2001/XMLSchema','double','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'asOfVersion'};
    }
    public class RetrieveResult {
        public MetadataService.FileProperties[] fileProperties;
        public String id;
        public MetadataService.RetrieveMessage[] messages;
        public String zipFile;
        private String[] fileProperties_type_info = new String[]{'fileProperties','http://soap.sforce.com/2006/04/metadata','FileProperties','0','-1','false'};
        private String[] id_type_info = new String[]{'id','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] messages_type_info = new String[]{'messages','http://soap.sforce.com/2006/04/metadata','RetrieveMessage','0','-1','false'};
        private String[] zipFile_type_info = new String[]{'zipFile','http://www.w3.org/2001/XMLSchema','base64Binary','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'fileProperties','id','messages','zipFile'};
    }
    public class delete_element {
        public MetadataService.Metadata[] metadata;
        private String[] metadata_type_info = new String[]{'metadata','http://soap.sforce.com/2006/04/metadata','Metadata','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'metadata'};
    }
    public class QuickActionList {
        public MetadataService.QuickActionListItem[] quickActionListItems;
        private String[] quickActionListItems_type_info = new String[]{'quickActionListItems','http://soap.sforce.com/2006/04/metadata','QuickActionListItem','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'quickActionListItems'};
    }
    public class create_element {
        public MetadataService.Metadata[] metadata;
        private String[] metadata_type_info = new String[]{'metadata','http://soap.sforce.com/2006/04/metadata','Metadata','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'metadata'};
    }
    public class checkStatus_element {
        public String[] asyncProcessId;
        private String[] asyncProcessId_type_info = new String[]{'asyncProcessId','http://soap.sforce.com/2006/04/metadata','ID','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'asyncProcessId'};
    }
    public class checkStatusResponse_element {
        public MetadataService.AsyncResult[] result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata','AsyncResult','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class PushNotification {
        public String[] fieldNames;
        public String objectName;
        private String[] fieldNames_type_info = new String[]{'fieldNames','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        private String[] objectName_type_info = new String[]{'objectName','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'fieldNames','objectName'};
    }
    public class EmailToCaseSettings {
        public Boolean enableEmailToCase;
        public Boolean enableHtmlEmail;
        public Boolean enableOnDemandEmailToCase;
        public Boolean enableThreadIDInBody;
        public Boolean enableThreadIDInSubject;
        public Boolean notifyOwnerOnNewCaseEmail;
        public String overEmailLimitAction;
        public MetadataService.EmailToCaseRoutingAddress[] routingAddresses;
        public String unauthorizedSenderAction;
        private String[] enableEmailToCase_type_info = new String[]{'enableEmailToCase','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] enableHtmlEmail_type_info = new String[]{'enableHtmlEmail','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] enableOnDemandEmailToCase_type_info = new String[]{'enableOnDemandEmailToCase','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] enableThreadIDInBody_type_info = new String[]{'enableThreadIDInBody','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] enableThreadIDInSubject_type_info = new String[]{'enableThreadIDInSubject','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] notifyOwnerOnNewCaseEmail_type_info = new String[]{'notifyOwnerOnNewCaseEmail','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] overEmailLimitAction_type_info = new String[]{'overEmailLimitAction','http://soap.sforce.com/2006/04/metadata','EmailToCaseOnFailureActionType','0','1','false'};
        private String[] routingAddresses_type_info = new String[]{'routingAddresses','http://soap.sforce.com/2006/04/metadata','EmailToCaseRoutingAddress','0','-1','false'};
        private String[] unauthorizedSenderAction_type_info = new String[]{'unauthorizedSenderAction','http://soap.sforce.com/2006/04/metadata','EmailToCaseOnFailureActionType','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'enableEmailToCase','enableHtmlEmail','enableOnDemandEmailToCase','enableThreadIDInBody','enableThreadIDInSubject','notifyOwnerOnNewCaseEmail','overEmailLimitAction','routingAddresses','unauthorizedSenderAction'};
    }
    public class deployResponse_element {
        public MetadataService.AsyncResult result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata','AsyncResult','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class EscalationAction {
        public String assignedTo;
        public String assignedToTemplate;
        public String assignedToType;
        public Integer minutesToEscalation;
        public Boolean notifyCaseOwner;
        public String[] notifyEmail;
        public String notifyTo;
        public String notifyToTemplate;
        private String[] assignedTo_type_info = new String[]{'assignedTo','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] assignedToTemplate_type_info = new String[]{'assignedToTemplate','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] assignedToType_type_info = new String[]{'assignedToType','http://soap.sforce.com/2006/04/metadata','AssignToLookupValueType','0','1','false'};
        private String[] minutesToEscalation_type_info = new String[]{'minutesToEscalation','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] notifyCaseOwner_type_info = new String[]{'notifyCaseOwner','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] notifyEmail_type_info = new String[]{'notifyEmail','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        private String[] notifyTo_type_info = new String[]{'notifyTo','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] notifyToTemplate_type_info = new String[]{'notifyToTemplate','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'assignedTo','assignedToTemplate','assignedToType','minutesToEscalation','notifyCaseOwner','notifyEmail','notifyTo','notifyToTemplate'};
    }
    public class DataCategory {
        public MetadataService.DataCategory[] dataCategory;
        public String label;
        public String name;
        private String[] dataCategory_type_info = new String[]{'dataCategory','http://soap.sforce.com/2006/04/metadata','DataCategory','0','-1','false'};
        private String[] label_type_info = new String[]{'label','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] name_type_info = new String[]{'name','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'dataCategory','label','name'};
    }
    public class MetadataPort {
        public String endpoint_x;
        {
         URL baseUrl = URL.getSalesforceBaseUrl();
         endpoint_x = baseUrl.toExternalForm() + '/services/Soap/m/28.0';
        }
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        public MetadataService.SessionHeader_element SessionHeader;
        public MetadataService.DebuggingInfo_element DebuggingInfo;
        public MetadataService.CallOptions_element CallOptions;
        public MetadataService.DebuggingHeader_element DebuggingHeader;
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/2006/04/metadata';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/2006/04/metadata';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/2006/04/metadata';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/2006/04/metadata';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata', 'MetadataService'};
        public MetadataService.AsyncResult retrieve(MetadataService.RetrieveRequest retrieveRequest) {
            MetadataService.retrieve_element request_x = new MetadataService.retrieve_element();
            MetadataService.retrieveResponse_element response_x;
            request_x.retrieveRequest = retrieveRequest;
            Map<String, MetadataService.retrieveResponse_element> response_map_x = new Map<String, MetadataService.retrieveResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'retrieve',
              'http://soap.sforce.com/2006/04/metadata',
              'retrieveResponse',
              'MetadataService.retrieveResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.DeployResult checkDeployStatus(String asyncProcessId) {
            MetadataService.checkDeployStatus_element request_x = new MetadataService.checkDeployStatus_element();
            MetadataService.checkDeployStatusResponse_element response_x;
            request_x.asyncProcessId = asyncProcessId;
            Map<String, MetadataService.checkDeployStatusResponse_element> response_map_x = new Map<String, MetadataService.checkDeployStatusResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'checkDeployStatus',
              'http://soap.sforce.com/2006/04/metadata',
              'checkDeployStatusResponse',
              'MetadataService.checkDeployStatusResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.AsyncResult[] updateMetadata(MetadataService.UpdateMetadata[] UpdateMetadata) {
            MetadataService.update_element request_x = new MetadataService.update_element();
            MetadataService.updateResponse_element response_x;
            request_x.UpdateMetadata = UpdateMetadata;
            Map<String, MetadataService.updateResponse_element> response_map_x = new Map<String, MetadataService.updateResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'update',
              'http://soap.sforce.com/2006/04/metadata',
              'updateResponse',
              'MetadataService.updateResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            system.debug('====response_x==='+response_x);
            system.debug('====response_x.result===='+response_x.result);
            return response_x.result;
        }
        public MetadataService.FileProperties[] listMetadata(MetadataService.ListMetadataQuery[] queries,Double asOfVersion) {
            MetadataService.listMetadata_element request_x = new MetadataService.listMetadata_element();
            MetadataService.listMetadataResponse_element response_x;
            request_x.queries = queries;
            request_x.asOfVersion = asOfVersion;
            Map<String, MetadataService.listMetadataResponse_element> response_map_x = new Map<String, MetadataService.listMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'listMetadata',
              'http://soap.sforce.com/2006/04/metadata',
              'listMetadataResponse',
              'MetadataService.listMetadataResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.AsyncResult[] checkStatus(String[] asyncProcessId) {
            MetadataService.checkStatus_element request_x = new MetadataService.checkStatus_element();
            MetadataService.checkStatusResponse_element response_x;
            request_x.asyncProcessId = asyncProcessId;
            Map<String, MetadataService.checkStatusResponse_element> response_map_x = new Map<String, MetadataService.checkStatusResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'checkStatus',
              'http://soap.sforce.com/2006/04/metadata',
              'checkStatusResponse',
              'MetadataService.checkStatusResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.AsyncResult[] create(MetadataService.Metadata[] metadata) {
            MetadataService.create_element request_x = new MetadataService.create_element();
            MetadataService.createResponse_element response_x;
            request_x.metadata = metadata;
            Map<String, MetadataService.createResponse_element> response_map_x = new Map<String, MetadataService.createResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'create',
              'http://soap.sforce.com/2006/04/metadata',
              'createResponse',
              'MetadataService.createResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.RetrieveResult checkRetrieveStatus(String asyncProcessId) {
            MetadataService.checkRetrieveStatus_element request_x = new MetadataService.checkRetrieveStatus_element();
            MetadataService.checkRetrieveStatusResponse_element response_x;
            request_x.asyncProcessId = asyncProcessId;
            Map<String, MetadataService.checkRetrieveStatusResponse_element> response_map_x = new Map<String, MetadataService.checkRetrieveStatusResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'checkRetrieveStatus',
              'http://soap.sforce.com/2006/04/metadata',
              'checkRetrieveStatusResponse',
              'MetadataService.checkRetrieveStatusResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.AsyncResult[] deleteMetadata(MetadataService.Metadata[] metadata) {
            MetadataService.delete_element request_x = new MetadataService.delete_element();
            MetadataService.deleteResponse_element response_x;
            request_x.metadata = metadata;
            Map<String, MetadataService.deleteResponse_element> response_map_x = new Map<String, MetadataService.deleteResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'delete',
              'http://soap.sforce.com/2006/04/metadata',
              'deleteResponse',
              'MetadataService.deleteResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.DescribeMetadataResult describeMetadata(Double asOfVersion) {
            MetadataService.describeMetadata_element request_x = new MetadataService.describeMetadata_element();
            MetadataService.describeMetadataResponse_element response_x;
            request_x.asOfVersion = asOfVersion;
            Map<String, MetadataService.describeMetadataResponse_element> response_map_x = new Map<String, MetadataService.describeMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'describeMetadata',
              'http://soap.sforce.com/2006/04/metadata',
              'describeMetadataResponse',
              'MetadataService.describeMetadataResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.AsyncResult deploy(String ZipFile,MetadataService.DeployOptions DeployOptions) {
            MetadataService.deploy_element request_x = new MetadataService.deploy_element();
            MetadataService.deployResponse_element response_x;
            request_x.ZipFile = ZipFile;
            request_x.DeployOptions = DeployOptions;
            Map<String, MetadataService.deployResponse_element> response_map_x = new Map<String, MetadataService.deployResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'deploy',
              'http://soap.sforce.com/2006/04/metadata',
              'deployResponse',
              'MetadataService.deployResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
    }
    public class ObjectUsage {
        public String[] object_x;
        private String[] object_x_type_info = new String[]{'object','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'object_x'};
    }
    public virtual class MetadataWithContent extends Metadata {
        public String content;
        private String[] content_type_info = new String[]{'content','http://www.w3.org/2001/XMLSchema','base64Binary','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'content'};
    }
    public class ListMetadataQuery {
        public String folder;
        public String type_x;
        private String[] folder_type_info = new String[]{'folder','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] type_x_type_info = new String[]{'type','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'folder','type_x'};
    }
    public class RetrieveRequest {
        public Double apiVersion;
        public String[] packageNames;
        public Boolean singlePackage;
        public String[] specificFiles;
        public MetadataService.Package_x unpackaged;
        private String[] apiVersion_type_info = new String[]{'apiVersion','http://www.w3.org/2001/XMLSchema','double','1','1','false'};
        private String[] packageNames_type_info = new String[]{'packageNames','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        private String[] singlePackage_type_info = new String[]{'singlePackage','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] specificFiles_type_info = new String[]{'specificFiles','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        private String[] unpackaged_type_info = new String[]{'unpackaged','http://soap.sforce.com/2006/04/metadata','Package','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'apiVersion','packageNames','singlePackage','specificFiles','unpackaged'};
    }
    
    /*
    public class HomePageLayout extends Metadata {
        //added by me
        public String fullName;
        public String[] narrowComponents;
        public String[] wideComponents;
        private String[] narrowComponents_type_info = new String[]{'narrowComponents','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        private String[] wideComponents_type_info = new String[]{'wideComponents','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'narrowComponents','wideComponents'};
    }
    */
    
     public class HomePageLayout extends Metadata {
        public String type = 'HomePageLayout';
        public String fullName;
        public String[] narrowComponents;
        public String[] wideComponents;
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] fullName_type_info = new String[]{'fullName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] narrowComponents_type_info = new String[]{'narrowComponents','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        private String[] wideComponents_type_info = new String[]{'wideComponents','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'fullName','narrowComponents','wideComponents'};
    }
    
    public class HomePageComponent extends Metadata{
        public String type = 'HomePageComponent';
        public String fullName;
        public String body;
        public String[] links;
        public String pageComponentType;
        public String width;
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] fullName_type_info = new String[]{'fullName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] body_type_info = new String[]{'body','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] links_type_info = new String[]{'links','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        private String[] pageComponentType_type_info = new String[]{'pageComponentType','http://soap.sforce.com/2006/04/metadata','PageComponentType','1','1','false'};
        private String[] width_type_info = new String[]{'width','http://soap.sforce.com/2006/04/metadata','PageComponentWidth','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'fullName','body','links','pageComponentType','width'};
    }
    
    public class RetrieveMessage {
        public String fileName;
        public String problem;
        private String[] fileName_type_info = new String[]{'fileName','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] problem_type_info = new String[]{'problem','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'fileName','problem'};
    }
    public class UpdateMetadata {
        public String currentName;
        public MetadataService.Metadata metadata;
        private String[] currentName_type_info = new String[]{'currentName','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] metadata_type_info = new String[]{'metadata','http://soap.sforce.com/2006/04/metadata','Metadata','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'currentName','metadata'};
    }
    public class ActionOverride {
        public String actionName;
        public String comment;
        public String content;
        public Boolean skipRecordTypeSelect;
        public String type_x;
        private String[] actionName_type_info = new String[]{'actionName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] comment_type_info = new String[]{'comment','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] content_type_info = new String[]{'content','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] skipRecordTypeSelect_type_info = new String[]{'skipRecordTypeSelect','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/2006/04/metadata','ActionOverrideType','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'actionName','comment','content','skipRecordTypeSelect','type_x'};
    }
    public class retrieveResponse_element {
        public MetadataService.AsyncResult result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata','AsyncResult','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class deploy_element {
        public String ZipFile;
        public MetadataService.DeployOptions DeployOptions;
        private String[] ZipFile_type_info = new String[]{'ZipFile','http://www.w3.org/2001/XMLSchema','base64Binary','1','1','false'};
        private String[] DeployOptions_type_info = new String[]{'DeployOptions','http://soap.sforce.com/2006/04/metadata','DeployOptions','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'ZipFile','DeployOptions'};
    }
    public class ListPlacement {
        public Integer height;
        public String location;
        public String units;
        public Integer width;
        private String[] height_type_info = new String[]{'height','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] location_type_info = new String[]{'location','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] units_type_info = new String[]{'units','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] width_type_info = new String[]{'width','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'height','location','units','width'};
    }
    public class PackageVersion {
        public Integer majorNumber;
        public Integer minorNumber;
        public String namespace;
        private String[] majorNumber_type_info = new String[]{'majorNumber','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] minorNumber_type_info = new String[]{'minorNumber','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] namespace_type_info = new String[]{'namespace','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'majorNumber','minorNumber','namespace'};
    }
    public class LiveChatButton {
        public String animation;
        public String chatPage;
        public MetadataService.LiveChatButtonDeployments deployments;
        public Boolean enableQueue;
        public String inviteEndPosition;
        public String inviteImage;
        public String inviteStartPosition;
        public Boolean isActive;
        public String label;
        public String offlineImage;
        public String onlineImage;
        public Boolean optionsHasInviteAfterAccept;
        public Boolean optionsHasInviteAfterReject;
        public Boolean optionsIsInviteAutoRemove;
        public Integer overallQueueLength;
        public Integer perAgentQueueLength;
        public String postChatPage;
        public String postChatUrl;
        public String preChatFormPage;
        public String preChatFormUrl;
        public Integer pushTimeOut;
        public String routingType;
        public String site;
        public MetadataService.LiveChatButtonSkills skills;
        public Integer timeToRemoveInvite;
        public String type_x;
        public String windowLanguage;
        private String[] animation_type_info = new String[]{'animation','http://soap.sforce.com/2006/04/metadata','LiveChatButtonPresentation','0','1','false'};
        private String[] chatPage_type_info = new String[]{'chatPage','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] deployments_type_info = new String[]{'deployments','http://soap.sforce.com/2006/04/metadata','LiveChatButtonDeployments','0','1','false'};
        private String[] enableQueue_type_info = new String[]{'enableQueue','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] inviteEndPosition_type_info = new String[]{'inviteEndPosition','http://soap.sforce.com/2006/04/metadata','LiveChatButtonInviteEndPosition','0','1','false'};
        private String[] inviteImage_type_info = new String[]{'inviteImage','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] inviteStartPosition_type_info = new String[]{'inviteStartPosition','http://soap.sforce.com/2006/04/metadata','LiveChatButtonInviteStartPosition','0','1','false'};
        private String[] isActive_type_info = new String[]{'isActive','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] label_type_info = new String[]{'label','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] offlineImage_type_info = new String[]{'offlineImage','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] onlineImage_type_info = new String[]{'onlineImage','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] optionsHasInviteAfterAccept_type_info = new String[]{'optionsHasInviteAfterAccept','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] optionsHasInviteAfterReject_type_info = new String[]{'optionsHasInviteAfterReject','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] optionsIsInviteAutoRemove_type_info = new String[]{'optionsIsInviteAutoRemove','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] overallQueueLength_type_info = new String[]{'overallQueueLength','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] perAgentQueueLength_type_info = new String[]{'perAgentQueueLength','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] postChatPage_type_info = new String[]{'postChatPage','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] postChatUrl_type_info = new String[]{'postChatUrl','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] preChatFormPage_type_info = new String[]{'preChatFormPage','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] preChatFormUrl_type_info = new String[]{'preChatFormUrl','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] pushTimeOut_type_info = new String[]{'pushTimeOut','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] routingType_type_info = new String[]{'routingType','http://soap.sforce.com/2006/04/metadata','LiveChatButtonRoutingType','1','1','false'};
        private String[] site_type_info = new String[]{'site','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] skills_type_info = new String[]{'skills','http://soap.sforce.com/2006/04/metadata','LiveChatButtonSkills','0','1','false'};
        private String[] timeToRemoveInvite_type_info = new String[]{'timeToRemoveInvite','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/2006/04/metadata','LiveChatButtonType','1','1','false'};
        private String[] windowLanguage_type_info = new String[]{'windowLanguage','http://soap.sforce.com/2006/04/metadata','Language','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'animation','chatPage','deployments','enableQueue','inviteEndPosition','inviteImage','inviteStartPosition','isActive','label','offlineImage','onlineImage','optionsHasInviteAfterAccept','optionsHasInviteAfterReject','optionsIsInviteAutoRemove','overallQueueLength','perAgentQueueLength','postChatPage','postChatUrl','preChatFormPage','preChatFormUrl','pushTimeOut','routingType','site','skills','timeToRemoveInvite','type_x','windowLanguage'};
    }
    public class Network {
        public MetadataService.Branding branding;
        public String caseCommentEmailTemplate;
        public String changePasswordTemplate;
        public String description;
        public String emailSenderAddress;
        public String emailSenderName;
        public Boolean enableInvitation;
        public String forgotPasswordTemplate;
        public MetadataService.NetworkMemberGroup networkMemberGroups;
        public String newSenderAddress;
        public Boolean selfRegistration;
        public Boolean sendWelcomeEmail;
        public String site;
        public String status;
        public MetadataService.NetworkTabSet tabs;
        public String urlPathPrefix;
        public String welcomeTemplate;
        private String[] branding_type_info = new String[]{'branding','http://soap.sforce.com/2006/04/metadata','Branding','0','1','false'};
        private String[] caseCommentEmailTemplate_type_info = new String[]{'caseCommentEmailTemplate','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] changePasswordTemplate_type_info = new String[]{'changePasswordTemplate','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] description_type_info = new String[]{'description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] emailSenderAddress_type_info = new String[]{'emailSenderAddress','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] emailSenderName_type_info = new String[]{'emailSenderName','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] enableInvitation_type_info = new String[]{'enableInvitation','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] forgotPasswordTemplate_type_info = new String[]{'forgotPasswordTemplate','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] networkMemberGroups_type_info = new String[]{'networkMemberGroups','http://soap.sforce.com/2006/04/metadata','NetworkMemberGroup','0','1','false'};
        private String[] newSenderAddress_type_info = new String[]{'newSenderAddress','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] selfRegistration_type_info = new String[]{'selfRegistration','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] sendWelcomeEmail_type_info = new String[]{'sendWelcomeEmail','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] site_type_info = new String[]{'site','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] status_type_info = new String[]{'status','http://soap.sforce.com/2006/04/metadata','NetworkStatus','1','1','false'};
        private String[] tabs_type_info = new String[]{'tabs','http://soap.sforce.com/2006/04/metadata','NetworkTabSet','1','1','false'};
        private String[] urlPathPrefix_type_info = new String[]{'urlPathPrefix','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] welcomeTemplate_type_info = new String[]{'welcomeTemplate','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'branding','caseCommentEmailTemplate','changePasswordTemplate','description','emailSenderAddress','emailSenderName','enableInvitation','forgotPasswordTemplate','networkMemberGroups','newSenderAddress','selfRegistration','sendWelcomeEmail','site','status','tabs','urlPathPrefix','welcomeTemplate'};
    }
    public class RunTestsResult {
        public MetadataService.CodeCoverageResult[] codeCoverage;
        public MetadataService.CodeCoverageWarning[] codeCoverageWarnings;
        public MetadataService.RunTestFailure[] failures;
        public Integer numFailures;
        public Integer numTestsRun;
        public MetadataService.RunTestSuccess[] successes;
        public Double totalTime;
        private String[] codeCoverage_type_info = new String[]{'codeCoverage','http://soap.sforce.com/2006/04/metadata','CodeCoverageResult','0','-1','false'};
        private String[] codeCoverageWarnings_type_info = new String[]{'codeCoverageWarnings','http://soap.sforce.com/2006/04/metadata','CodeCoverageWarning','0','-1','false'};
        private String[] failures_type_info = new String[]{'failures','http://soap.sforce.com/2006/04/metadata','RunTestFailure','0','-1','false'};
        private String[] numFailures_type_info = new String[]{'numFailures','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] numTestsRun_type_info = new String[]{'numTestsRun','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] successes_type_info = new String[]{'successes','http://soap.sforce.com/2006/04/metadata','RunTestSuccess','0','-1','false'};
        private String[] totalTime_type_info = new String[]{'totalTime','http://www.w3.org/2001/XMLSchema','double','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'codeCoverage','codeCoverageWarnings','failures','numFailures','numTestsRun','successes','totalTime'};
    }
    public class PermissionSetUserPermission {
        public Boolean enabled;
        public String name;
        private String[] enabled_type_info = new String[]{'enabled','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] name_type_info = new String[]{'name','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'enabled','name'};
    }
    public class FlowVariable {
        public String dataType;
        public Boolean isInput;
        public Boolean isOutput;
        public Integer scale;
        public MetadataService.FlowElementReferenceOrValue value;
        private String[] dataType_type_info = new String[]{'dataType','http://soap.sforce.com/2006/04/metadata','FlowDataType','1','1','false'};
        private String[] isInput_type_info = new String[]{'isInput','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] isOutput_type_info = new String[]{'isOutput','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] scale_type_info = new String[]{'scale','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] value_type_info = new String[]{'value','http://soap.sforce.com/2006/04/metadata','FlowElementReferenceOrValue','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'dataType','isInput','isOutput','scale','value'};
    }
    public class ChatterAnswersReputationLevel {
        public String name;
        public Integer value;
        private String[] name_type_info = new String[]{'name','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] value_type_info = new String[]{'value','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'name','value'};
    }
    public class LiveChatDeploymentDomainWhitelist {
        public String[] domain;
        private String[] domain_type_info = new String[]{'domain','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'domain'};
    }
    public class ProfileLoginHours {
        public String fridayEnd;
        public String fridayStart;
        public String mondayEnd;
        public String mondayStart;
        public String saturdayEnd;
        public String saturdayStart;
        public String sundayEnd;
        public String sundayStart;
        public String thursdayEnd;
        public String thursdayStart;
        public String tuesdayEnd;
        public String tuesdayStart;
        public String wednesdayEnd;
        public String wednesdayStart;
        private String[] fridayEnd_type_info = new String[]{'fridayEnd','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] fridayStart_type_info = new String[]{'fridayStart','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] mondayEnd_type_info = new String[]{'mondayEnd','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] mondayStart_type_info = new String[]{'mondayStart','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] saturdayEnd_type_info = new String[]{'saturdayEnd','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] saturdayStart_type_info = new String[]{'saturdayStart','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] sundayEnd_type_info = new String[]{'sundayEnd','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] sundayStart_type_info = new String[]{'sundayStart','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] thursdayEnd_type_info = new String[]{'thursdayEnd','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] thursdayStart_type_info = new String[]{'thursdayStart','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] tuesdayEnd_type_info = new String[]{'tuesdayEnd','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] tuesdayStart_type_info = new String[]{'tuesdayStart','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] wednesdayEnd_type_info = new String[]{'wednesdayEnd','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] wednesdayStart_type_info = new String[]{'wednesdayStart','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'fridayEnd','fridayStart','mondayEnd','mondayStart','saturdayEnd','saturdayStart','sundayEnd','sundayStart','thursdayEnd','thursdayStart','tuesdayEnd','tuesdayStart','wednesdayEnd','wednesdayStart'};
    }
    public class DashboardFilter {
        public MetadataService.DashboardFilterOption[] dashboardFilterOptions;
        public String name;
        private String[] dashboardFilterOptions_type_info = new String[]{'dashboardFilterOptions','http://soap.sforce.com/2006/04/metadata','DashboardFilterOption','0','-1','false'};
        private String[] name_type_info = new String[]{'name','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'dashboardFilterOptions','name'};
    }
    public class CodeLocation {
        public Integer column;
        public Integer line;
        public Integer numExecutions;
        public Double time_x;
        private String[] column_type_info = new String[]{'column','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] line_type_info = new String[]{'line','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] numExecutions_type_info = new String[]{'numExecutions','http://www.w3.org/2001/XMLSchema','int','1','1','false'};
        private String[] time_x_type_info = new String[]{'time','http://www.w3.org/2001/XMLSchema','double','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'column','line','numExecutions','time_x'};
    }
    public class FieldSetItem {
        public String field;
        public Boolean isFieldManaged;
        public Boolean isRequired;
        private String[] field_type_info = new String[]{'field','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] isFieldManaged_type_info = new String[]{'isFieldManaged','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] isRequired_type_info = new String[]{'isRequired','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'field','isFieldManaged','isRequired'};
    }
    public class KnowledgeLanguageSettings {
        public MetadataService.KnowledgeLanguage[] language;
        private String[] language_type_info = new String[]{'language','http://soap.sforce.com/2006/04/metadata','KnowledgeLanguage','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'language'};
    }
    public class ReportFilterItem {
        public String column;
        public String operator;
        public String value;
        private String[] column_type_info = new String[]{'column','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] operator_type_info = new String[]{'operator','http://soap.sforce.com/2006/04/metadata','FilterOperation','1','1','false'};
        private String[] value_type_info = new String[]{'value','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'column','operator','value'};
    }
    public class FlowDynamicChoiceSet {
        public String dataType;
        public String displayField;
        public MetadataService.FlowRecordFilter[] filters;
        public Integer limit_x;
        public String object_x;
        public MetadataService.FlowOutputFieldAssignment[] outputAssignments;
        public String sortField;
        public String sortOrder;
        public String valueField;
        private String[] dataType_type_info = new String[]{'dataType','http://soap.sforce.com/2006/04/metadata','FlowDataType','1','1','false'};
        private String[] displayField_type_info = new String[]{'displayField','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] filters_type_info = new String[]{'filters','http://soap.sforce.com/2006/04/metadata','FlowRecordFilter','0','-1','false'};
        private String[] limit_x_type_info = new String[]{'limit','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] object_x_type_info = new String[]{'object','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] outputAssignments_type_info = new String[]{'outputAssignments','http://soap.sforce.com/2006/04/metadata','FlowOutputFieldAssignment','0','-1','false'};
        private String[] sortField_type_info = new String[]{'sortField','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] sortOrder_type_info = new String[]{'sortOrder','http://soap.sforce.com/2006/04/metadata','SortOrder','0','1','false'};
        private String[] valueField_type_info = new String[]{'valueField','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'dataType','displayField','filters','limit_x','object_x','outputAssignments','sortField','sortOrder','valueField'};
    }
    public class KnowledgeSettings {
        public MetadataService.KnowledgeAnswerSettings answers;
        public MetadataService.KnowledgeCaseSettings cases;
        public String defaultLanguage;
        public Boolean enableCreateEditOnArticlesTab;
        public Boolean enableExternalMediaContent;
        public Boolean enableKnowledge;
        public MetadataService.KnowledgeLanguageSettings languages;
        public Boolean showArticleSummariesCustomerPortal;
        public Boolean showArticleSummariesInternalApp;
        public Boolean showArticleSummariesPartnerPortal;
        public Boolean showValidationStatusField;
        private String[] answers_type_info = new String[]{'answers','http://soap.sforce.com/2006/04/metadata','KnowledgeAnswerSettings','0','1','false'};
        private String[] cases_type_info = new String[]{'cases','http://soap.sforce.com/2006/04/metadata','KnowledgeCaseSettings','0','1','false'};
        private String[] defaultLanguage_type_info = new String[]{'defaultLanguage','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] enableCreateEditOnArticlesTab_type_info = new String[]{'enableCreateEditOnArticlesTab','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] enableExternalMediaContent_type_info = new String[]{'enableExternalMediaContent','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] enableKnowledge_type_info = new String[]{'enableKnowledge','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] languages_type_info = new String[]{'languages','http://soap.sforce.com/2006/04/metadata','KnowledgeLanguageSettings','0','1','false'};
        private String[] showArticleSummariesCustomerPortal_type_info = new String[]{'showArticleSummariesCustomerPortal','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] showArticleSummariesInternalApp_type_info = new String[]{'showArticleSummariesInternalApp','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] showArticleSummariesPartnerPortal_type_info = new String[]{'showArticleSummariesPartnerPortal','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] showValidationStatusField_type_info = new String[]{'showValidationStatusField','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'answers','cases','defaultLanguage','enableCreateEditOnArticlesTab','enableExternalMediaContent','enableKnowledge','languages','showArticleSummariesCustomerPortal','showArticleSummariesInternalApp','showArticleSummariesPartnerPortal','showValidationStatusField'};
    }
    public class ApexClass extends MetadataWithContent {
public String type = 'ApexClass';
public String fullName;
        public String content;
        public Double apiVersion;
        public MetadataService.PackageVersion[] packageVersions;
        public String status;
private String[] type_att_info = new String[]{'xsi:type'};
private String[] fullName_type_info = new String[]{'fullName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apiVersion_type_info = new String[]{'apiVersion','http://www.w3.org/2001/XMLSchema','double','1','1','false'};
        private String[] content_type_info = new String[]{'content','http://www.w3.org/2001/XMLSchema','base64Binary','0','1','false'};
        private String[] packageVersions_type_info = new String[]{'packageVersions','http://soap.sforce.com/2006/04/metadata','PackageVersion','0','-1','false'};
        private String[] status_type_info = new String[]{'status','http://soap.sforce.com/2006/04/metadata','ApexCodeUnitStatus','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'fullName', 'content', 'apiVersion','packageVersions','status'};
    }
    public class SessionSettings {
        public Boolean disableTimeoutWarning;
        public Boolean enableCSRFOnGet;
        public Boolean enableCSRFOnPost;
        public Boolean enableCacheAndAutocomplete;
        public Boolean enableClickjackNonsetupSFDC;
        public Boolean enableClickjackNonsetupUser;
        public Boolean enableClickjackSetup;
        public Boolean enableSMSIdentity;
        public Boolean forceRelogin;
        public Boolean lockSessionsToIp;
        public String sessionTimeout;
        private String[] disableTimeoutWarning_type_info = new String[]{'disableTimeoutWarning','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] enableCSRFOnGet_type_info = new String[]{'enableCSRFOnGet','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] enableCSRFOnPost_type_info = new String[]{'enableCSRFOnPost','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] enableCacheAndAutocomplete_type_info = new String[]{'enableCacheAndAutocomplete','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] enableClickjackNonsetupSFDC_type_info = new String[]{'enableClickjackNonsetupSFDC','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] enableClickjackNonsetupUser_type_info = new String[]{'enableClickjackNonsetupUser','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] enableClickjackSetup_type_info = new String[]{'enableClickjackSetup','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] enableSMSIdentity_type_info = new String[]{'enableSMSIdentity','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] forceRelogin_type_info = new String[]{'forceRelogin','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] lockSessionsToIp_type_info = new String[]{'lockSessionsToIp','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] sessionTimeout_type_info = new String[]{'sessionTimeout','http://soap.sforce.com/2006/04/metadata','SessionTimeout','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'disableTimeoutWarning','enableCSRFOnGet','enableCSRFOnPost','enableCacheAndAutocomplete','enableClickjackNonsetupSFDC','enableClickjackNonsetupUser','enableClickjackSetup','enableSMSIdentity','forceRelogin','lockSessionsToIp','sessionTimeout'};
    }
    public class Document {
        public String description;
        public Boolean internalUseOnly;
        public String keywords;
        public String name;
        public Boolean public_x;
        private String[] description_type_info = new String[]{'description','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] internalUseOnly_type_info = new String[]{'internalUseOnly','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] keywords_type_info = new String[]{'keywords','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] name_type_info = new String[]{'name','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] public_x_type_info = new String[]{'public','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'description','internalUseOnly','keywords','name','public_x'};
    }
    public class Folder {
        public String accessType;
        public MetadataService.FolderShare[] folderShares;
        public String name;
        public String publicFolderAccess;
        public MetadataService.SharedTo sharedTo;
        private String[] accessType_type_info = new String[]{'accessType','http://soap.sforce.com/2006/04/metadata','FolderAccessTypes','0','1','false'};
        private String[] folderShares_type_info = new String[]{'folderShares','http://soap.sforce.com/2006/04/metadata','FolderShare','0','-1','false'};
        private String[] name_type_info = new String[]{'name','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] publicFolderAccess_type_info = new String[]{'publicFolderAccess','http://soap.sforce.com/2006/04/metadata','PublicFolderAccess','0','1','false'};
        private String[] sharedTo_type_info = new String[]{'sharedTo','http://soap.sforce.com/2006/04/metadata','SharedTo','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'accessType','folderShares','name','publicFolderAccess','sharedTo'};
    }
    public class AutoResponseRules {
        public MetadataService.AutoResponseRule[] autoResponseRule;
        private String[] autoResponseRule_type_info = new String[]{'autoResponseRule','http://soap.sforce.com/2006/04/metadata','AutoResponseRule','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'autoResponseRule'};
    }
    public class DeployResult {
        public String id;
        public MetadataService.DeployMessage[] messages;
        public MetadataService.RetrieveResult retrieveResult;
        public MetadataService.RunTestsResult runTestResult;
        public Boolean success;
        private String[] id_type_info = new String[]{'id','http://soap.sforce.com/2006/04/metadata','ID','1','1','false'};
        private String[] messages_type_info = new String[]{'messages','http://soap.sforce.com/2006/04/metadata','DeployMessage','0','-1','false'};
        private String[] retrieveResult_type_info = new String[]{'retrieveResult','http://soap.sforce.com/2006/04/metadata','RetrieveResult','0','1','false'};
        private String[] runTestResult_type_info = new String[]{'runTestResult','http://soap.sforce.com/2006/04/metadata','RunTestsResult','0','1','false'};
        private String[] success_type_info = new String[]{'success','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'id','messages','retrieveResult','runTestResult','success'};
    }
  /*  public class HomePageComponent extends Metadata{
        public String body;
        public String[] links;
        public String pageComponentType;
        public String width;
        private String[] body_type_info = new String[]{'body','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] links_type_info = new String[]{'links','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        private String[] pageComponentType_type_info = new String[]{'pageComponentType','http://soap.sforce.com/2006/04/metadata','PageComponentType','1','1','false'};
        private String[] width_type_info = new String[]{'width','http://soap.sforce.com/2006/04/metadata','PageComponentWidth','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'body','links','pageComponentType','width'};
    }*/
    public class CallOptions_element {
        public String client;
        private String[] client_type_info = new String[]{'client','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'client'};
    }
    public class updateResponse_element {
        public MetadataService.AsyncResult[] result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata','AsyncResult','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class retrieve_element {
        public MetadataService.RetrieveRequest retrieveRequest;
        private String[] retrieveRequest_type_info = new String[]{'retrieveRequest','http://soap.sforce.com/2006/04/metadata','RetrieveRequest','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'retrieveRequest'};
    }
    public class DescribeMetadataObject {
        public String[] childXmlNames;
        public String directoryName;
        public Boolean inFolder;
        public Boolean metaFile;
        public String suffix;
        public String xmlName;
        private String[] childXmlNames_type_info = new String[]{'childXmlNames','http://www.w3.org/2001/XMLSchema','string','0','-1','false'};
        private String[] directoryName_type_info = new String[]{'directoryName','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] inFolder_type_info = new String[]{'inFolder','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] metaFile_type_info = new String[]{'metaFile','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] suffix_type_info = new String[]{'suffix','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] xmlName_type_info = new String[]{'xmlName','http://www.w3.org/2001/XMLSchema','string','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'childXmlNames','directoryName','inFolder','metaFile','suffix','xmlName'};
    }
    public class createResponse_element {
        public MetadataService.AsyncResult[] result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata','AsyncResult','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class AsyncResult {
        public Boolean checkOnly;
        public Boolean done;
        public String id;
        public String message;
        public Integer numberComponentErrors;
        public Integer numberComponentsDeployed;
        public Integer numberComponentsTotal;
        public Integer numberTestErrors;
        public Integer numberTestsCompleted;
        public Integer numberTestsTotal;
        public String state;
        public String stateDetail;
        public DateTime stateDetailLastModifiedDate;
        public String statusCode;
        private String[] checkOnly_type_info = new String[]{'checkOnly','http://www.w3.org/2001/XMLSchema','boolean','0','1','false'};
        private String[] done_type_info = new String[]{'done','http://www.w3.org/2001/XMLSchema','boolean','1','1','false'};
        private String[] id_type_info = new String[]{'id','http://soap.sforce.com/2006/04/metadata','ID','1','1','false'};
        private String[] message_type_info = new String[]{'message','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] numberComponentErrors_type_info = new String[]{'numberComponentErrors','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] numberComponentsDeployed_type_info = new String[]{'numberComponentsDeployed','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] numberComponentsTotal_type_info = new String[]{'numberComponentsTotal','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] numberTestErrors_type_info = new String[]{'numberTestErrors','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] numberTestsCompleted_type_info = new String[]{'numberTestsCompleted','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] numberTestsTotal_type_info = new String[]{'numberTestsTotal','http://www.w3.org/2001/XMLSchema','int','0','1','false'};
        private String[] state_type_info = new String[]{'state','http://soap.sforce.com/2006/04/metadata','AsyncRequestState','1','1','false'};
        private String[] stateDetail_type_info = new String[]{'stateDetail','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] stateDetailLastModifiedDate_type_info = new String[]{'stateDetailLastModifiedDate','http://www.w3.org/2001/XMLSchema','dateTime','0','1','false'};
        private String[] statusCode_type_info = new String[]{'statusCode','http://soap.sforce.com/2006/04/metadata','StatusCode','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'checkOnly','done','id','message','numberComponentErrors','numberComponentsDeployed','numberComponentsTotal','numberTestErrors','numberTestsCompleted','numberTestsTotal','state','stateDetail','stateDetailLastModifiedDate','statusCode'};
    }
    public class checkRetrieveStatus_element {
        public String asyncProcessId;
        private String[] asyncProcessId_type_info = new String[]{'asyncProcessId','http://soap.sforce.com/2006/04/metadata','ID','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'asyncProcessId'};
    }
    public class listMetadata_element {
        public MetadataService.ListMetadataQuery[] queries;
        public Double asOfVersion;
        private String[] queries_type_info = new String[]{'queries','http://soap.sforce.com/2006/04/metadata','ListMetadataQuery','0','-1','false'};
        private String[] asOfVersion_type_info = new String[]{'asOfVersion','http://www.w3.org/2001/XMLSchema','double','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'queries','asOfVersion'};
    }
    public virtual class Metadata {
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'fullName'};
    }
    public class deleteResponse_element {
        public MetadataService.AsyncResult[] result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata','AsyncResult','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class update_element {
        public MetadataService.UpdateMetadata[] UpdateMetadata;
        private String[] UpdateMetadata_type_info = new String[]{'UpdateMetadata','http://soap.sforce.com/2006/04/metadata','UpdateMetadata','0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'UpdateMetadata'};
    }
    public class DashboardFolder {
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{};
    }
    public class checkRetrieveStatusResponse_element {
        public MetadataService.RetrieveResult result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata','RetrieveResult','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class checkDeployStatusResponse_element {
        public MetadataService.DeployResult result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata','DeployResult','1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
}