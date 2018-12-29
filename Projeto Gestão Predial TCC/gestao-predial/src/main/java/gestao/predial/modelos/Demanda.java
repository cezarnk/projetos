package gestao.predial.modelos;

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
	private Integer usuario_chave;
	
	@Column
	@NotEmpty
	private String local;
	
	@Column
	@NotEmpty
	private String assunto;
	
	@Column
	@NotEmpty
	private String descricao;
	
	@Column
	@Type(type="timestamp")
	private Timestamp cadastrado_em = new Timestamp(System.currentTimeMillis());

	@ManyToOne
	@JoinColumn(name="perfil_id")
	private Perfil perfil;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getUsuario_chave() {
		return usuario_chave;
	}

	public void setUsuario_chave(Integer usuario_chave) {
		this.usuario_chave = usuario_chave;
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
	
	public Perfil getPerfil() {
		return perfil;
	}

	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}

}
