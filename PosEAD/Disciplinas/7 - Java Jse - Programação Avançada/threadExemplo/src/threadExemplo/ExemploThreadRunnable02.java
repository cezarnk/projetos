package threadExemplo;

public class ExemploThreadRunnable02 implements Runnable {
	public void run(){
		String nome = Thread.currentThread().getName();
		System.out.println("Nome inicial do novo thread: "+nome);
	}
}
