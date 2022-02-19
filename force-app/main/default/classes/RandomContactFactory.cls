public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer numGeneratedContacts,String lastNameContactsGenerated){
        
        List<Contact> newContactlist = new List<Contact>();
        
        for(Integer i = 0; i < numGeneratedContacts; i++ ){
            Contact ct = new Contact();
            ct.FirstName = 'Test ' + i;
            ct.LastName = lastNameContactsGenerated;
            newContactlist.add(ct);
        }
        
        return newContactlist;
    }
}