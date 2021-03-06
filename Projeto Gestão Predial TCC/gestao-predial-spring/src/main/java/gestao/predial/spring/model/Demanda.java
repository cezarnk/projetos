package gestao.predial.spring.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import gestao.predial.spring.tool.JsonDateSerializer;

@Entity
public class Demanda implements Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column
	@NotEmpty(message="{demanda.formulario.local}")
	private String local;
	
	@Column
	@NotEmpty(message="{demanda.formulario.assunto}")
	private String assunto;
	
	@Column
	@NotEmpty(message="{demanda.formulario.descricao}")
	private String descricao;
	
	@Column
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date cadastrado_em = new Date(System.currentTimeMillis());

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

	@com.fasterxml.jackson.databind.annotation.JsonDeserialize(using =JsonDateSerializer.class)
	public Date getCadastrado_em() {
		return cadastrado_em;
	}

	public void setCadastrado_em(Date cadastrado_em) {
		this.cadastrado_em = cadastrado_em;
	}
	
	
	public void setPerfilId(int perfilId) {
		this.perfilId = perfilId;
	}

	public int getPerfilId() {
		return perfilId;
	}

}
