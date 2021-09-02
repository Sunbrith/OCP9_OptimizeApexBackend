@isTest private class TestMyTeamOrders {
    
    @isTest static void controllerTest() {
		// Create an account
        Account acc = new Account(name = 'Test', chiffre_d_affaire__c = 10000);
        insert acc;
        List<Order> newOrders = TestDataFactory.createOrdersOnAccount(1, acc.Id);
        Order newOrder = newOrders.get(0);
        
        Test.StartTest(); 
  		PageReference pageRef = Page.MyTeamOrders; 
  		pageRef.getParameters().put('id', String.valueOf(newOrder.Id));
  		Test.setCurrentPage(pageRef);
        MyTeamOrdersController controller = new MyTeamOrdersController();
 		Test.StopTest();
        System.assertEquals(1, controller.getOrders.size());
        System.assertEquals(100, controller.sumOrders);
    }
}