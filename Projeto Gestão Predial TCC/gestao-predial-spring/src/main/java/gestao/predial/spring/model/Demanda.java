package gestao.predial.spring.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Demanda implements Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column
	@NotEmpty(message="Local não pode ser vazio.")
	private String local;
	
	@Column
	@NotEmpty(message="Assunto não pode ser vazio.")
	private String assunto;
	
	@Column
	@NotEmpty(message="Descrição não pode ser vazio.")
	private String descricao;
	
	@Column
	@Type(type="timestamp")
	private Timestamp cadastrado_em = new Timestamp(System.currentTimeMillis());

    @Column(name = "perfil_id")
    private int perfilId;    
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public String getAssunto() {
		return assunto;
	}

	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Timestamp getCadastrado_em() {
		return cadastrado_em;
	}

	public void setCadastrado_em(Timestamp cadastrado_em) {
		this.cadastrado_em = cadastrado_em;
	}
	
	
	public void setPerfilId(int perfilId) {
		this.perfilId = perfilId;
	}

	public int getPerfilId() {
		return perfilId;
	}

}
