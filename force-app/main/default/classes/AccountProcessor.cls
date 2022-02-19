public class AccountProcessor {
    @future
    public static void countContacts(List<ID> accIds){
        List<Account> listacc = [Select id, Number_of_Contacts__c,(Select id from Contacts) from Account where id in:accIds];
        for(account acc: listacc){
            List<Contact> con = acc.contacts;
            acc.Number_of_Contacts__c = con.size();
        }
        update listacc;
    }
}