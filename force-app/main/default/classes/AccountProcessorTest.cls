@isTest
public class AccountProcessorTest {
    
    public static testmethod void testAccountProcessorTest(){
        Account a = new Account();
        a.Name = 'Test Account';
        Insert a;
        system.debug('account a ' + a.Id + ' ' + a.Name);
        
        Contact cont = new Contact();
        cont.FirstName = 'Rui1';
        cont.LastName = 'Santos1';
        cont.AccountId = a.Id;
       
        system.debug('contact cont:' + cont.Id + ' ----first name: ' + cont.FirstName);
        
        List<id> accIds = new List<id>();
        accIds.add(a.Id);
        
        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();
        
        Account ACC = [Select Number_of_Contacts__c from Account where id = :a.Id LIMIT 1];
        System.assertEquals(ACC.Number_of_Contacts__c,1);
    }

}