public class ListSortingClass {
    
    public void executeList(){
        List<String> colors = new List<String> {
        	'Yellow',
            'Red',
            'Green'};
    	colors.sort();
    
    	System.assertEquals('Green', colors.get(0));
    	System.assertEquals('Red', colors.get(1));
    	system.assertEquals('Yellow', colors.get(2));
        
     	List<Integer> ls1 = new List<Integer>(10);
        ls1.add(0,1);
        ls1.add(1,2);
        ls1.add(5,23);
        
        List<Integer> ls2 = new List<Integer>(ls1);
        System.debug(ls2);
        System.debug(ls2.hashCode());
        
        Set<Integer> set1 = new Set<Integer>();
        set1.add(1);
        set1.add(2);
        set1.add(3);
        System.debug(set1);
        system.debug(set1.hashCode());
    }
}