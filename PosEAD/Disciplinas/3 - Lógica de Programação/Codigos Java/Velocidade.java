//Exemplo de Estrutura de Sele��o Simples
 import java.util.Scanner;
 public class Velocidade {
 public static void main(String[] args) {
 int vel, vel_max, dif;


 Scanner ler = new Scanner(System.in);
 System.out.println(�Digite a velocidade m�xima permitida na rodovia:�);
 vel_max = ler.nextInt();
 System.out.println(�Digite a velocidade que o ve�culo trafega:�);
 vel = ler.nextInt();
 dif = vel � vel_max;
 if (dif > 0 )
 {
 System.out.println(�Motorista voc� foi multado!�);
 System.out.println(�Est� �+dif+� acima da vel. permitida �+vel_max);
 }
 }
 }