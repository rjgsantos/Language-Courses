public class CustomIterator 
	implements Iterator<Account>{

        private List<Account> accs;
        private Integer currentIndex;
        
        public CustomIterator(List<Account> accs){
            this.accs = accs;
            this.currentIndex = 0;
        }
        
        public boolean hasNext(){
            return currentIndex < accs.size() -1;
        }
        
        public Account next(){
            if(hasNext()){
                currentIndex++;
                return accs[currentIndex];
            }else{
                throw new NoSuchElementException();
            }
        }
}