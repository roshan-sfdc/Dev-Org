public class UserLookup {
    
    public list<User> getUsers() {
        return [select Id, Name from User LIMIT 10];
    }

}