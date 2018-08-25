public class Exercicio_aula_1_b
public static void main(String[] args) {
int x=5, y=10, z;
float a=4.5f, b;
double c, d;
char e;
long f;
boolean teste;
x++; //incrementa x em uma unidade
System.out.println(“X = “+x);
z = y--; // copia para z o valor de y e depois decrementa y
System.out.println(“Y = “+y+” Z = “+z);
b = a+x; //operaçoes entre int e float resultam em float
System.out.println(“A = “+a+” B = “+b);
c = 15/2; // mesmo c sendo double, como 15 e 2 são int, resulta na parte inteira
d = a; // double é também um tipo real assim como float, atribuição apenas converte
System.out.println(“C = “+c+” D = “+d);
e = ‘a’;
System.out.println(“E = “+e);
f = x+y+z; // f é long, inteiro e a soma x+y+z resulta em int, apenas converte.
System.out.println(“F = “+f);
teste = z>y; // teste recebe true se o teste for verdadeiro, caso contrario recebe
false
System.out.println(“Teste = “+teste);
}
}