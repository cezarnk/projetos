package threadExemplo;

public class TesteThread {

	public static void main(String[] args) {
		ExemploThread thread = new ExemploThread();
		thread.start();
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
