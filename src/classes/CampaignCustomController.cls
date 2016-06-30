public class CampaignCustomController
 {
     public string cview;
     
        
        public CampaignCustomController()
        {
        
        }
        public string getcview()
          {
            return cview;
          }
        
         public void setcview(string cview)
          {
            this.cview=cview;
          }
          
         public List<Campaign> getCampaigns(){
            
             if(cview=='Recently Modified')
               {
                 return [Select c.Type, c.Status, c.StartDate, c.Name From Campaign c order by LastModifiedDate];
               }
              else
              if(cview=='All Campaigns')
               {
                 return [Select c.Type, c.Status, c.StartDate, c.Name From Campaign c order by startDate];
               }
             else 
             if(cview=='All Active Campaigns')
               {
                  return [Select c.Type, c.Status, c.StartDate, c.Name From Campaign c Where isActive=TRUE  order by startDate desc];
               }
             else 
             if(cview=='My Active Campaigns')
               {
                  return [Select c.Type, c.Status, c.StartDate, c.Name From Campaign c  where isActive=TRUE and OwnerId=:userInfo.getUserId() order by startDate Desc];
               }
             else 
             if(cview=='Inactive Campaigns')
               {
                  return [Select c.Type, c.Status, c.StartDate, c.Name From Campaign c  where isActive=FALSE  order by startDate Desc];
               }
              return [Select c.Type, c.Status, c.StartDate, c.Name From Campaign c];
        }
  
   
      
   }