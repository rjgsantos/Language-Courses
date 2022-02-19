@isTest
public class RemindOppyOwnersTest {
 
    // Dummy CRON expression: midnight on March 15
    // Because this is a test, job executes
    // immediately after Test.stopTest();
    public static String CRON_EXP = '0 0 0 17 3 ? 2022';
    
    static testmethod void testScheduledJob(){
        
        // Create some out of date Opportunity records
        List<Opportunity> opptys = new List<Opportunity>();
        
        Date closeDate = Date.today().addDays(-7);
        
        for(Integer i=0; i<10; i++){
            Opportunity o = new Opportunity(Name = 'Opportunity  ' + i, CloseDate = closeDate, StageName = 'Prospecting');
            opptys.add(o);
        }
        insert opptys;
        
        // Get the IDs of the opportunities we just inserted
        Map<Id, Opportunity> opptyMap = new Map<Id, Opportunity>(opptys);
        List<Id> opptyIds = new List<Id>(opptymap.keySet());
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new RemindOpptyOwners());
        // Verify the scheduled job has not run yet
        List<Task> lt = [Select Id from Task Where WhatId In :opptyIds];
        System.assertEquals(0, lt.size(), 'Task exist before job has run');
        // Stopping the test will run the job synchrounously
        Test.stopTest();
        // Now that the schedule job has executed, check that our tasks where created
        lt = [SELECT Id FROM Task WHERE WhatId IN :opptyIds];
        System.assertEquals(opptyIds.size(), lt.size(), 'There were not created');        
    }
}