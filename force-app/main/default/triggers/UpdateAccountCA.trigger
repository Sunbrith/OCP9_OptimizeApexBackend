trigger UpdateAccountCA on Order (before update) {

        // Get updated orders Ids
        Set<Id> ordersIds = trigger.newMap.keySet();

        // Search for accounts having at least one order with 'ordered' status
        List<Account> accountList = AccountSelector.selectAssociatedAccounts(ordersIds);

        // Update these accounts
        Accounts.updateAccountCA(accountList);    
    } 