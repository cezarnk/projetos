package modelo;

public class Disciplina {

	private String nomeDisciplina;
	private double nota1;
	private double nota2;
	private int faltas;	
	
	public void setNomeDisciplina(String nomeDisciplina) {
		this.nomeDisciplina = nomeDisciplina;
	}
	
	public String getNomeDisciplina() {
		return nomeDisciplina;
	}
	
	public boolean setNota1(double nota1) {
		if(nota1 >= 0 && nota1 <= 10) {
			this.nota1 = nota1;
			return true;
		}
		return false;		
	}
	
	public double getNota1() {
		return nota1;
	}
	
	public boolean setNota2(double nota2) {
		if(nota2 >= 0 && nota2 <= 10) {
			this.nota2 = nota2;
			return true;
		}
		return false;
	}
	
	public double getNota2() {
		return nota2;
	}
	
	public void setFalta(int faltas) {
		this.faltas = faltas;
	}
	
	public int getFalta() {
		return faltas;
	}
	
	public String listarDisciplinas() {
		return 	"Nome da disciplina: "+nomeDisciplina+"\n"+
				"Nota 1: "+nota1+"\n"+
				"Nota 2: "+nota2+"\n"+				
				"Faltas: "+faltas;
	}
			
	public double calculaMedia() {
		return (nota1 + nota2)/2;
	}
	
	public String exibeDisciplina() {
		return "Disciplina: "+nomeDisciplina+" - Nota: "+nota1+"  Nota: "+nota2+" => [Média: "+calculaMedia()+"] \n";
	}
	
}
