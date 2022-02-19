public without sharing class DailyLeadProcessor implements Schedulable{
    
    public void execute(SchedulableContext ctx){
        
        // Returns the ID of the CronTrigger schedule
        System.debug('Context ' + ctx.getTriggerId());
        
        // Get 200 Lead records and modify the LeadSource field
        List<Lead> leads = [ SELECT Id, LeadSource FROM Lead WHERE LeadSource = null LIMIT 200];
        
        for(Lead l : leads){
            l.LeadSource = 'Dreamforce';
        }
        // Update the modified records
        update leads;
    }

}