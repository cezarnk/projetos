package threadExemplo;

public class TesteThread03 {

	public static void main(String[] args) {
		ExemploThreadRunnable02 tr = new ExemploThreadRunnable02();
		Thread t = new Thread(tr,"thread_pessoal");
		t.setName("novo_nome");
		t.start();
		String nome = Thread.currentThread().getName();
		System.out.println("Nome do thread principal: "+nome);
	}
}
