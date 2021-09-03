global with sharing class UpdateAccountsBatchScheduler implements Schedulable{
    global void execute(SchedulableContext sc) {
        UpdateAccountsBatch uab = new UpdateAccountsBatch();
        Id batchId = Database.executeBatch(uab);
    }
}