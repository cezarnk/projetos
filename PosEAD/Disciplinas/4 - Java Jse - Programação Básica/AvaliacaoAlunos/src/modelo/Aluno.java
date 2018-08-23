package modelo;

import java.util.ArrayList;
import java.util.List;


public class Aluno {
	
	private String nome;
	private String ra;	
	private List<Disciplina> listaDisciplina;
	
	public Aluno() {
		listaDisciplina = new ArrayList<>();
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setRa(String ra) {
		this.ra = ra;
	}
	
	public String getRa() {
		return ra;
	}
	
	public List<Disciplina> getListaDisciplina() {
		return listaDisciplina;
	}
	
	public void incluirDisciplina(Disciplina disciplina) {
		listaDisciplina.add(disciplina);
	}
	
}
