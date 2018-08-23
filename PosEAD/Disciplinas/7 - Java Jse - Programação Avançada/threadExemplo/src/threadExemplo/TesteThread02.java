package threadExemplo;

public class TesteThread02 {

	public static void main(String[] args) {
		ExemploThreadRunnable tr = new ExemploThreadRunnable();
		Thread t = new Thread(tr);
		t.start();
		try{
			for(int i=0;i<20;i++){
				System.out.println("x");
				Thread.sleep(200);
			}
		}catch(Exception e){
			System.out.println("Houve outro erro!");
		}
	}
}
