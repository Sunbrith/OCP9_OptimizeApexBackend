trigger UpdateAccountCA on Order (before update) {
    if(ApprovalTriggerHandler.doNotRunTrigger == false) {
        // Get updated orders Ids
        Set<Id> ordersIds = trigger.newMap.keySet();
        // Search for accounts having at least one order with 'ordered' status
        List<Account> accList = AccountSelector.selectAssociatedAccounts(ordersIds);
        // Update theses accounts
        Accounts.updateAccountCA(accList);    
    } 
}