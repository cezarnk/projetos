package gestao.predial.modelos;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.rmi.CORBA.UtilDelegate;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import com.mysql.jdbc.Util;


@Entity
public class Perfil implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@NotEmpty(message="Nome não pode ser vazio.")
	private String nome;
	
	@NotEmpty(message="CPF não pode ser vazio.")
	private String cpf;
	
	@NotEmpty(message="Telefone não pode ser vazio.")
	private String telefone;
	
	@Email
	private String email;	
	
	@NotEmpty(message="Estado civil não pode ser vazio.")
	private String estado_civil;
	
	private int qnt_filhos;
	private int qnt_moradores;
	private int andar_ocupado;
	
	@NotEmpty(message="Campo não pode ser vazio.")
	private String administrador;
	
	@Column
	private String data_nascimento;
	
	@Column
	@Type(type="timestamp")
	private Timestamp cadastrado_em = new Timestamp(System.currentTimeMillis());
	
	@OneToMany(mappedBy="perfil",targetEntity = Pagamento.class, cascade = CascadeType.ALL)
	private List<Pagamento> pagamentos;
	
	@OneToMany(mappedBy="perfil",targetEntity = Pagamento.class, cascade = CascadeType.ALL)
	private List<Usuario> usuario;
	
	@OneToMany(mappedBy="perfil",targetEntity = Pagamento.class, cascade = CascadeType.ALL)
	private List<Demanda> demanda;
	
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
	public String isAdministrador() {
		return administrador;
	}
	public void setAdministrador(String administrador) {
		this.administrador = administrador;
	}
	public String getData_nascimento() {
		return data_nascimento;
	}
	public void setData_nascimento(String data_nascimento) {
		this.data_nascimento = data_nascimento;
	}
	public Timestamp getCadastrado_em() {
		return cadastrado_em;
	}
	public void setCadastrado_em(Timestamp cadastrado_em) {
		this.cadastrado_em = cadastrado_em;
	}
	public String getAdministrador() {
		return administrador;
	}
	
	public List<Pagamento> getPagamentos(){
		return pagamentos;
	}
	
	public List<Usuario> getUsuario() {
		return usuario;
	}
	
	public List<Demanda> getDemanda() {
		return demanda;
	}
}
