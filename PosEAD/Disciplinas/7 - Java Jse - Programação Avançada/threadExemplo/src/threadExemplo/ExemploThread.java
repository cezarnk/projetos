package threadExemplo;

public class ExemploThread extends Thread{
	public void run(){
		try {
			for (int i=0;i<20;i++){
				System.out.println("y");
				Thread.sleep(200);
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
}
