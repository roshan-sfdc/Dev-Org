global class MyWebService 
{
    webService static Id makeContact(String lastNamepar, Account a) 
    {
        Contact c = new Contact(lastName = lastNamepar, AccountId = a.Id);
        insert c;
        return c.id;
    }
}