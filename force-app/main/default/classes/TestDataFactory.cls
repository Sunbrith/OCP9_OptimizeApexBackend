@isTest
public class TestDataFactory {
   
//creates a new user
public static User createUser(String name){
    Profile profileId = [SELECT Id 
                         FROM Profile 
                         WHERE Name = 'Standard User'
                         LIMIT 1];

    User newUser = new User(Username          = 'Testy' + name +'@dev.com', 
                            Email             = 'testy@dev.com',
                            Alias             = name,
                            LastName          = 'Testerson',
                            ProfileId         = profileId.id,
                            LanguageLocaleKey = 'en_US',
                            TimeZoneSidKey    = 'America/Los_Angeles',
                            LocaleSidKey      = 'en_US',
                            EmailEncodingKey  = 'ISO-8859-1');

    insert newUser;
    return newUser;
}
}