package gestao.predial.spring.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Usuario implements Serializable{
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;

    @NotEmpty
    private String nome;

    @NotEmpty(message="Login não pode ser vazio.")
    private String login;

    @NotEmpty(message="Senha não pode ser vazio.")
    private String senha;

    @NotEmpty(message="Campo não pode ser vazio.")
    private String nome_guerra;
    
    private int chave_estrangeira;
    
	@ManyToOne
	@JoinColumn(name="perfil_id")
	private Perfil perfil;

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

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getNome_guerra() {
		return nome_guerra;
	}

	public void setNome_guerra(String nome_guerra) {
		this.nome_guerra = nome_guerra;
	}
	
	public int getChave_estrangeira() {
		return chave_estrangeira;
	}

	public void setChave_estrangeira(int chave_estrangeira) {
		this.chave_estrangeira = chave_estrangeira;
	}
	
	public Perfil getPerfil() {
		return perfil;
	}

	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}
}
