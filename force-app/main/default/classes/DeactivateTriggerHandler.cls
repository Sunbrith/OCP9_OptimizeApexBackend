public with sharing class DeactivateTriggerHandler {
    // This class deactivates UpdateAccountCA trigger when testing UpdateAccountsBatch.
    // When the boolean doNotRunTrigger is true, trigger is deactivated. 
    public static Boolean doNotRunTrigger = false;

    public static void setDoNotRunTrigger(){
        doNotRunTrigger = true;
    }
}