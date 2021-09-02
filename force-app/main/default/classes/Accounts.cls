public with sharing class Accounts {
    
    public static List<Account> updateAccountCA(List<Account> accountsToUpdate) {
       
        // If the account list is empty, an exception is thrown
        if(accountsToUpdate.size()==0) {
            throw new AccountDomainException('No Account Specified');
        } else {

            // Get orders related to theses accounts
             list<Order> accOrders =  OrdersSelector.selectOrdersFromAccounts(accountsToUpdate);
            
            // Update accounts CA adding totalAmount of related orders
            for(Account acc : accountsToUpdate) {
                for(Order newOrder : accOrders) {
                    if(acc.Id == newOrder.AccountId) {
                        acc.chiffre_d_affaire__c += newOrder.TotalAmount;
                    }
                } 
            }
            update accountsToUpdate;
            return accountsToUpdate;
        }
    }
    public class AccountDomainException extends Exception {} 
}