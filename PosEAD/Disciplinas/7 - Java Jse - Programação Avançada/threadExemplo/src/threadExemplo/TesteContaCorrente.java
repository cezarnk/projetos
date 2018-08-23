package threadExemplo;

public class TesteContaCorrente {

	public static void main(String[] args) {
		ProcessaContaCorrente cc = new ProcessaContaCorrente();
		Thread t = new Thread(cc,"João");
		Thread t2 = new Thread(cc,"Maria");
		try{
			t.start();
			t2.start();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
