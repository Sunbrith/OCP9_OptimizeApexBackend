@isTest private class MyTeamOrdersControllerTest {
    
    @TestSetup
    private static void testData(){
        User user1 = TestDataFactory.createUser('User1');
        System.runAs(user1){
            TestDataFactory.createMultipleProductsOrders(3);
        }

        User user2 = TestDataFactory.createUser('User2');
        System.runAs(user2){
            TestDataFactory.createMultipleProductsOrders(2);
        }

        User user3 = TestDataFactory.createUser('User3');
        System.runAs(user3){
            TestDataFactory.createMultipleProductsOrders(4);
        }
    }

    @isTest
private static void TestAggregateResultList(){

    Test.startTest();
    MyTeamOrdersController controller = new MyTeamOrdersController();
    List<AggregateResult> totalOrdersByOwner = controller.aggregateResultList;
    Test.stopTest();

//Assert that that the list isn't empty
System.assert(totalOrdersByOwner.size()>0); 
}
}