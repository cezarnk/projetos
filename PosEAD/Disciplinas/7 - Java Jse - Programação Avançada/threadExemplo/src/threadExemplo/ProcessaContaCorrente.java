package threadExemplo;

public class ProcessaContaCorrente implements Runnable{
	
	ContaCorrente conta = new ContaCorrente();
	
	private synchronized void efetuarOperacao(double valor){
		String nome = Thread.currentThread().getName();
		try{
			if(conta.verificarSaldo(valor)){
				System.out.println("Valor sacado por "+nome+" : "+valor);
				System.out.println("Saldo par "+nome+" : "+conta.efetuarSaque(valor));
			}else{
				System.out.println("Saldo insuficiente para "+nome);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void run(){
		try{
			for(int i=0;i<10;i++){
				Thread.sleep(180);
				efetuarOperacao(20);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
