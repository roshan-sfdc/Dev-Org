public with sharing class FetchAccount {

    //Login Domain May be test, prerellogin.pre
    String LOGIN_DOMAIN = 'www';
    public String pwd{get;set;}
    public String userName{get;set;}
    public List<Account> acc{get;set;}
    public String errMsg{get;set;}
    public String displayError{get;set;}

    public FetchAccount()
    {
        displayError = 'none';
    }

    public void fetch()
    {
        errMsg  = 'Some error occurred, please try again';
        try
        {
        //-----------------------------------
        // Login via SOAP/XML web service api
        //-----------------------------------
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://' + LOGIN_DOMAIN + '.salesforce.com/services/Soap/u/22.0');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'text/xml;charset=UTF-8');
        request.setHeader('SOAPAction', '""');
        //not escaping username and password because we're setting those variables above
        //in other words, this line "trusts" the lines above
        //if username and password were sourced elsewhere, they'd need to be escaped below
        request.setBody('<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/"><Header/><Body><login xmlns="urn:partner.soap.sforce.com"><username>' + userName+ '</username><password>' + pwd+ '</password></login></Body></Envelope>');
        
        Http http = new Http();
        HttpResponse res = http.send(request);
         
        
        Dom.XmlNode resultElmt = res.getBodyDocument().getRootElement()
          .getChildElement('Body', 'http://schemas.xmlsoap.org/soap/envelope/')
          .getChildElement('loginResponse', 'urn:partner.soap.sforce.com')
          .getChildElement('result', 'urn:partner.soap.sforce.com');

        //-------------------------------
        // Grab session id and server url
        //--------------------------------
        final String SERVER_URL = resultElmt.getChildElement('serverUrl', 'urn:partner.soap.sforce.com') .getText().split('/services')[0];
        final String SESSION_ID = resultElmt.getChildElement('sessionId', 'urn:partner.soap.sforce.com') .getText();

        //----------------------------------
        // Load first 10 accounts via REST API
        //---------------------------------
        final PageReference theUrl = new PageReference(SERVER_URL + '/services/data/v22.0/query/');
        theUrl.getParameters().put('q','Select Name From Account limit 10');
        request = new HttpRequest();
        request.setEndpoint(theUrl.getUrl());
        request.setMethod('GET');
        request.setHeader('Authorization', 'OAuth ' + SESSION_ID);

        String body = (new Http()).send(request).getBody();
		
		system.debug('-------body--------'+body);
		
        JSONParser parser = JSON.createParser(body);

        do{
            parser.nextToken();
        }while(parser.hasCurrentToken() && !'records'.equals(parser.getCurrentName()));

        parser.nextToken();
        
        
        system.debug('--------SERVER_URL---------'+SERVER_URL);
        system.debug('-------SESSION_ID---------'+SESSION_ID);
        system.debug('---body----'+body);
		system.debug('------request-----'+request);
		system.debug('---------parser---------'+parser);
        system.debug('--------parser.nextToken()--------'+parser.nextToken());
        
        acc = (List<Account>) parser.readValueAs(List<Account>.class);
        }
        catch(Exception e)
        {
            displayError = 'block';
        }

    }
}