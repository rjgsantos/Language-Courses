public class CustomIterable implements Iterable<Account> {
	
    public Iterator<Account> iterator(){
        List<Account> accs = [SELECT Id, name, NumberOfEmployees from Account LIMIT 10];
        return new CustomIterator(accs);
    }

}