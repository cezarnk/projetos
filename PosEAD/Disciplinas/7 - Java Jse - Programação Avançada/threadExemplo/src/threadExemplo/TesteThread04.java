package threadExemplo;

public class TesteThread04 {

	public static void main(String[] args) {
		ThreadMultiplo tm = new ThreadMultiplo();
		
		Thread t1 = new Thread(tm,"João");
		Thread t2 = new Thread(tm,"Maria");
		
		t1.setPriority(Thread.MIN_PRIORITY);
		t1.start();
		
		t2.setPriority(Thread.MAX_PRIORITY);
		t2.start();
	}
}
