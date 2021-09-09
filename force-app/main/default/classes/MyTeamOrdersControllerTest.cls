@isTest private class MyTeamOrdersControllerTest {
    
    @TestSetup

    static  void testData() {
    User user3 = TestDataFactory.createUser('User3') ;
                           System.runAs(user3)  {
	            TestDataFactory.createOrdersForOneAccount(5) ; 
	}

    /*
    private static void testData(){
        User user1 = TestDataFactory.createUser('User1');
        Account acc = new Account(Name = 'Test Acc', Chiffre_d_affaire__c = 10000);
        insert acc;
        System.runAs(user1){
            TestDataFactory.createMultipleProductsOrders(acc.Id, 1, 3);
         } 

        /*
        User user2 = TestDataFactory.createUser('User2');
        System.runAs(user2){
            TestDataFactory.createMultipleProductsOrders(2);
        }

        User user3 = TestDataFactory.createUser('User3');
        System.runAs(user3){
            TestDataFactory.createMultipleProductsOrders(4);
        }
        */
    }

    @isTest
private static void TestAggregateResultList(){

    Test.startTest();
    MyTeamOrdersController controller = new MyTeamOrdersController();
    List<AggregateResult> totalOrdersByOwner = controller.aggregateResultList;
    Test.stopTest();

//Assert that the list isn't empty
System.assert(totalOrdersByOwner.size()>0); 
}
}