public with sharing class Error {
    
    private ApexPages.Message ErrorMessage = new ApexPages.Message(ApexPages.Severity.Info ,'Success!');
    public Boolean Success {get; set;}
    
    public Error() {
      Success = true;
      ErrorMessage = new ApexPages.Message(ApexPages.Severity.Info ,'Success!');
    }
    
    public static void logExceptionMessage(Exception ex) {
        apexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error , ex.getMessage()));
    }
    
    public static Error LogException(Exception ex){
        Error err = new Error();
        err.Success = false;
                    
        err.ErrorMessage = new ApexPages.Message(ApexPages.Severity.Error , ex.getMessage());
        apexPages.addMessage(err.ErrorMessage);
        return err;
    }
    
}