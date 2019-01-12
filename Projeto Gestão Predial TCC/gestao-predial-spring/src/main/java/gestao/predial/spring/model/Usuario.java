package gestao.predial.spring.model;

import java.io.Serializable;

import javax.persistence.Column;
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

    @NotEmpty(message="{usuario.formulario.login}")
    private String login;

    @NotEmpty(message="{usuario.formulario.senha}")
    private String senha;

    @NotEmpty(message="{usuario.formulario.nome}")
    private String nome_guerra;
    
    @Column(name = "perfil_id")
    private int perfilId;    

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
	

	public void setPerfilId(int perfilId) {
		this.perfilId = perfilId;
	}

	public int getPerfilId() {
		return perfilId;
	}
	

}
