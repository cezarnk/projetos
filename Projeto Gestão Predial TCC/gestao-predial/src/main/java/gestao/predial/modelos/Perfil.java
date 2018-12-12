package gestao.predial.modelos;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Perfil implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@NotEmpty
	private String nome;
	
	@NotEmpty
	private String cpf;
	
	@NotEmpty
	private String telefone;
	
	@Email
	private String email;	
	private String estado_civil;
	private int qnt_filhos;
	private int qnt_moradores;
	private int andar_ocupado;
	@NotEmpty
	private boolean administrador;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEstado_civil() {
		return estado_civil;
	}
	public void setEstado_civil(String estado_civil) {
		this.estado_civil = estado_civil;
	}
	public int getQnt_filhos() {
		return qnt_filhos;
	}
	public void setQnt_filhos(int qnt_filhos) {
		this.qnt_filhos = qnt_filhos;
	}
	public int getQnt_moradores() {
		return qnt_moradores;
	}
	public void setQnt_moradores(int qnt_moradores) {
		this.qnt_moradores = qnt_moradores;
	}
	public int getAndar_ocupado() {
		return andar_ocupado;
	}
	public void setAndar_ocupado(int andar_ocupado) {
		this.andar_ocupado = andar_ocupado;
	}
	public boolean isAdministrador() {
		return administrador;
	}
	public void setAdministrador(boolean administrador) {
		this.administrador = administrador;
	}
	
}
