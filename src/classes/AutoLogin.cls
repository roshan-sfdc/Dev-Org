/*

    This class is aimed to provide the functionality to login to the given credentials
    programmatically and generate the session id

*/
public class AutoLogin {

    public static loginResponse generateSessionId(){
    
    LoginResponse loginResponse = new LoginResponse(); 
    
    try{
        System.debug('=================== ' + Userinfo.getSessionId());
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        //setting the http callout method as post
        req.setMethod('POST');
        //setting the soap url as endpoint to to http request
        req.setEndPoint(ConnectionUtility.LOGIN_URL); 
        req.setHeader('Content-type','text/xml');
        req.setHeader('SoapAction',ConnectionUtility.getLoginSoapAction());
        req.setBody(ConnectionUtility.getLoginSoapBody('roshan.agrawal@espl.com', 'r0655324009', ''));
        
        if(!Test.isRunningTest()){
        //sending the requst to get the login response and sessionId of remote org
        res = h.send(req);
        //loginresponse.result = res.getBody();
        system.debug('-------------------res.getBody()'+(res.getBody()));
            loginresponse.status=res.getStatus();
            loginresponse.statusCode=res.getStatusCode(); 
            
            system.debug('-------status-----'+loginresponse.status);
        }else{
            loginresponse.statusCode = 200;
            loginresponse.status = 'OK';
            loginresponse.result = '<?xml version="1.0" encoding="UTF-8"?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns="urn:partner.soap.sforce.com" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><soapenv:Body><loginResponse><result><metadataServerUrl>https://ap1-api.salesforce.com/services/Soap/m/21.0/00D90000000YYpr</metadataServerUrl><passwordExpired>false</passwordExpired><sandbox>false</sandbox><serverUrl>https://ap1-api.salesforce.com/services/Soap/u/21.0/00D90000000YYpr</serverUrl><sessionId>00D90000000YYpr!AQkAQGItxGayPzRLb3g2z96MsVuJnidnW2fZAUpNEKcq_i5tjmV_oj.eZZHn90l0A9PbZtgvuTIVUlahKDPYqgXuhR5Y9Md4</sessionId><userId>00590000000KRhTAAW</userId><userInfo><accessibilityMode>false</accessibilityMode><currencySymbol>$</currencySymbol><orgAttachmentFileSizeLimit>5242880</orgAttachmentFileSizeLimit><orgDefaultCurrencyIsoCode>USD</orgDefaultCurrencyIsoCode><orgDisallowHtmlAttachments>false</orgDisallowHtmlAttachments><orgHasPersonAccounts>false</orgHasPersonAccounts><organizationId>00D90000000YYprEAG</organizationId><organizationMultiCurrency>false</organizationMultiCurrency><organizationName>Angel</organizationName><profileId>00e90000000ooA1AAI</profileId><roleId xsi:nil="true"/><sessionSecondsValid>7200</sessionSecondsValid><userDefaultCurrencyIsoCode xsi:nil="true"/><userEmail>test@test.com</userEmail><userFullName>shivam singh</userFullName><userId>00590000000KRhTAAW</userId><userLanguage>en_US</userLanguage><userLocale>en_US</userLocale><userName>test.test@test.com</userName><userTimeZone>America/Los_Angeles</userTimeZone><userType>Standard</userType><userUiSkin>Theme3</userUiSkin></userInfo></result></loginResponse></soapenv:Body></soapenv:Envelope>';
        }
  
    if(loginresponse.statusCode == 200){
        System.debug('============== loginresponse ' + loginResponse);
        //loginresponse.sessionId = loginresponse.result.substring(
                                //loginresponse.result.indexOf('<sessionId>')+11, 
                                  //loginresponse.result.indexOf('</sessionId>'));
        System.debug('==== RESPONSE BODY ' + res.getBody());
        System.debug('==== SESSION ID ' + res.getBody().substringBetween('<sessionId>', '</sessionId>'));
        loginresponse.sessionId = res.getBody().substringBetween('<sessionId>', '</sessionId>');
                                //loginresponse.result.indexOf('<sessionId>')+11, 
                                //loginresponse.result.indexOf('</sessionId>'));
        System.debug('-=----------- Retrieved ssession Id ' + loginresponse.sessionId);
                                  
    }else{
        //loginresponse.isError = true;
    }
    }catch(Exception ex){
        loginresponse.message = ex.getMessage();
    }
    return loginResponse;           
    }
}