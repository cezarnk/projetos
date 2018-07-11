 //Exemplo de Estrutura switch ... case
 import java.util.Scanner;
 public class ExemploSwitch {
 public static void main(String[] args) {
 char letra;
 Scanner ler = new Scanner(System.in);
 System.out.println(“Digite uma letra:”);
 letra = ler.nextLine().charAt(0);
 switch(letra)
 {
 case ‘a’:
 case 'A': System.out.println ("Vogal A"); break;
 case 'e':
 case 'E': System.out.println ("Vogal E"); break;
 case ‘i’:
 case ‘I’: System.out.println (“Vogal I”); break;
 case ‘o’:
 case ‘O’: System.out.println (“Vogal O”); break;
 case ‘u’:
 case ‘U’: System.out.println (“Vogal U”); break;
 default: System.out.println(“Você não digitou uma vogal!”); break;
 }
 }
 }