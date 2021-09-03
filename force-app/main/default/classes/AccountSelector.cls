public with sharing class AccountSelector {

    // Query for UpdateAccounts batch 
    // Search for accounts having at least one order with status 'ordered'
    public static String queryAccountsWithOrderedOrders() {
        String stringQuery = 'SELECT Id, Chiffre_d_affaire__c FROM Account WHERE Id IN (SELECT AccountId FROM Order WHERE Status = \'Ordered\')';
        return stringQuery;
    }
    
    // Search for associated accounts from orders ids 
    public static List<Account> selectAssociatedAccounts(Set<Id> orderIds) {
        List<Account> accountList = [SELECT Id, Chiffre_d_affaire__c 
                                    FROM   Account 
                                    WHERE  Id 
                                    IN 
                                    (SELECT AccountId 
                                    FROM   Order 
                                    WHERE  Id 
                                    IN     :orderIds)
                                    ];
        return accountList;
    }

    public class AccountSelectorException extends Exception {} 
}