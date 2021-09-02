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

//creates order for one account
public static Account createOrdersForOneAccount(Integer Sum){

    //creates an account
    Account acc = new Account (Name = 'name', Description = 'test');
    insert acc;

    //creates a contract
    Contract contr = new Contract(AccountId    = acc.Id, 
                                  Status       = 'Draft', 
                                  StartDate    = Date.today(),
                                  ContractTerm = 12);
    insert contr;
    contr.Status = 'Activated';
    update contr;

    //creates a price book
    Id priceBookId = Test.getStandardPricebookId();

    //creates a product
    Product2 prod = new Product2(name ='TestProduct', Price__c = 100, IsActive=true);
    insert prod;

    //creates a price book entry
    PricebookEntry pbEntry = new PricebookEntry(Pricebook2Id     = priceBookId, 
                                                Product2Id       = prod.id, 
                                                UseStandardPrice = false, 
                                                UnitPrice        = 100, 
                                                IsActive         = true);
    insert pbEntry;

    //creates orders
    List<Order> orderList = new List<Order>();

    for (Integer i=0; i<num; i++){
        Order ord = new Order(AccountId     = acc.Id,
                              ContractId    = contr.Id,
                              EffectiveDate = System.today(),
                              Status        = 'Draft',
                              Pricebook2Id  = priceBookId);
        orderList.add(ord);
    }
    insert orderList;

    //creates order item
    List<OrderItem> orderItems = new List<OrderItem>();

    for(integer j=0; j<num; j++){
        orderItem orderItemOne = new orderItem(OrderId          = orderList[j].Id,
                                               PriceBookEntryId = pbEntry.Id,
                                               UnitPrice        = 100,
                                               Quantity         = 1);
        orderItems.add(orderItemOne);
    }
    insert orderItems;

    for(order o : orderList){
        o.Status = 'Activated';
    }
    update orderList;
    update orderItems;
    return acc;
  }
}