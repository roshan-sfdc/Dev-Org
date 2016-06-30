public with sharing class CampaignCustomController_pagination {
	public string cview;
    public string getcview()
      {
        return cview;
      }
    
     public void setcview(string cview)
      {
        this.cview=cview;
      }
      
     public ApexPages.StandardSetController con{get; set;}
     
     public List<Campaign> AllSearchUsers
    {
        get
        {
            if(con != null)
                return (List<Campaign>)con.getRecords();
            else
                return null ;
        }
        set;
    }
     
     public PageReference Search()
    {   
        if(cview != null)
        {
                if(cview=='RecentlyModified')
                {
                    con = new ApexPages.StandardSetController(Database.getQueryLocator([select Id,Name,Status,Type,Startdate from Campaign order by LastModifiedDate desc]));
                }
                else if(cview=='AllCampaigns')
                {
                    con = new ApexPages.StandardSetController(Database.getQueryLocator([select Name,Status,Type,Startdate from Campaign order by startdate desc]));
                }
                else if(cview=='AllActiveCampaigns')
                {
                    con = new ApexPages.StandardSetController(Database.getQueryLocator([select Name,Status,Type,Startdate from Campaign where IsActive = TRUE order by startdate desc]));
                }
                else if(cview=='MyactiveCampaigns')
                {
                    con = new ApexPages.StandardSetController(Database.getQueryLocator([select Name,Status,Type,Startdate from Campaign where IsActive = TRUE and Owner.Id=:UserInfo.getUserId() order by startdate desc]));
                }
                else 
                {
                    con = new ApexPages.StandardSetController(Database.getQueryLocator([select Name,Status,Type,Startdate from Campaign where IsActive = FALSE order by startdate desc]));
                }
                con.setPageSize(3);
	         }
	         else
	         {
	                con = null;
	         }
	        return null ;
    }
    
    	public Boolean hasNext
		    {
		        get
		        {
		            return con.getHasNext();
		        }
		        set;
		    }
 
    
    	public Boolean hasPrevious
		    {
		        get
		        {
		            return con.getHasPrevious();
		        }
		        set;
		    }
 
          
    	public void previous()
		    {
		        con.previous();
		    }
		 
    
    	public void next()
		    {
		        con.next();
		    }
    
    

}