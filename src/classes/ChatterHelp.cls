public with sharing Class ChatterHelp {

public static void postFeedComment(List<id> Parentid, id feedItemId, string content){
        String communityId = null;
        if(feedItemId != null && content != null && content != '' && Parentid.size() > 0 && Parentid != null) {
            system.debug('Parentid*******' + Parentid);
            system.debug('content>>>' + content);
            ConnectApi.MessageBodyInput messageBodyInput = new ConnectApi.MessageBodyInput();
            ConnectApi.TextSegmentInput textSegmentInput = new ConnectApi.TextSegmentInput();
            messageBodyInput.messageSegments = new List<ConnectApi.MessageSegmentInput>();
            
            ConnectApi.CommentInput input = new ConnectApi.CommentInput();
            messageBodyInput.messageSegments = new List<ConnectApi.MessageSegmentInput>();
            input.body = messageBodyInput;
             
            // @Mention for Asked To User List 
            ConnectApi.TextSegmentInput textSegment = new ConnectApi.TextSegmentInput();
            if(Parentid.size() > 0){
                for(id u: Parentid){
                    ConnectApi.MentionSegmentInput mentionSegmentInput = new ConnectApi.MentionSegmentInput();
                    mentionSegmentInput.id = u;
                    messageBodyInput.messageSegments.add(mentionSegmentInput);
                }
                textSegment.text = ' '+content;
                messageBodyInput.messageSegments.add(textSegment);
                ConnectApi.Comment commentRep = ConnectApi.ChatterFeeds.postComment(communityId, feedItemId, input,null); 
            }
             //ConnectApi.Comment commentRep = ConnectApi.ChatterFeeds.postComment(communityId, feedItemId, input, null);
        }
    }
    
    public static void postUserRef() {
        
        String bod = /*URL.getSalesforceBaseUrl().toExternalForm() + '/' + '00590000000bzI8' +*/' Please see below details:'+'\n';
        bod += 'Name = ' + 'Roshan'+'\n';
        bod += 'Age = ' + '26'+'\n';
        bod += 'ID = ' + '443561'+'\n';
        bod += '===================';
        
        ConnectApi.MessageBodyInput messageInput = new ConnectApi.MessageBodyInput();
        messageInput.messageSegments = new List<ConnectApi.MessageSegmentInput>();

        CollaborationGroup chatterGroup = [select Id, Name from CollaborationGroup where Name = 'Test Group'];
        
        ConnectApi.MentionSegmentInput mentionSegment = new ConnectApi.MentionSegmentInput();
        mentionSegment.id = '00590000000bzI8'; // The ID of the user to mention.
        messageInput.messageSegments.add(mentionSegment);
        
        ConnectApi.TextSegmentInput textSegment = new ConnectApi.TextSegmentInput();
        textSegment.text = bod;// 'Happy Birthday ';
        messageInput.messageSegments.add(textSegment);
         
        //textSegment = new ConnectApi.TextSegmentInput();
        //textSegment.text = '!';
        //messageInput.messageSegments.add(textSegment);
         
        ConnectApi.FeedItemInput input = new ConnectApi.FeedItemInput();
        input.body = messageInput;
        //input.parentId = chatterGroup.Id;//
            
         
        ConnectApi.FeedItem fi = ConnectApi.ChatterFeeds.postFeedItem(null, ConnectApi.FeedType.Record, chatterGroup.Id, input, null);
    } 

}