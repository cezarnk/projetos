package gestao.predial.modelos;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotEmpty;


@Entity
public class Pagamento implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private BigDecimal valor;
	private BigDecimal multa;
	private BigDecimal desconto;
	private BigDecimal valor_total;
	
	private BigDecimal condominio;
	private int chave_estrangeira;
	
	@Temporal(TemporalType.DATE)
	private Calendar data_pagamento;
	
	@Temporal(TemporalType.DATE)
	private Calendar data_vencimento;

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

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	public String getDataPagamentoFormatado()
	{
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		return formato.format(getData_pagamento());
	}
	
	public Calendar getData_pagamento() {
		return data_pagamento;
	}

	public void setData_pagamento(Calendar data_pagamento) {
		this.data_pagamento = data_pagamento;
	}

	public Calendar getData_vencimento() {
		return data_vencimento;
	}

	public void setData_vencimento(Calendar data_vencimento) {
		this.data_vencimento = data_vencimento;
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

	public BigDecimal getMulta() {
		return multa;
	}

	public void setMulta(BigDecimal multa) {
		this.multa = multa;
	}

	public BigDecimal getDesconto() {
		return desconto;
	}

	public void setDesconto(BigDecimal desconto) {
		this.desconto = desconto;
	}

	public BigDecimal getValor_total() {
		return valor_total;
	}

	public void setValor_total(BigDecimal valor_total) {
		this.valor_total = valor_total;
	}

	public BigDecimal getCondominio() {
		return condominio;
	}

	public void setCondominio(BigDecimal condominio) {
		this.condominio = condominio;
	}

	public int getChave_estrangeira() {
		return chave_estrangeira;
	}

	public void setChave_estrangeira(int chave_estrangeira) {
		this.chave_estrangeira = chave_estrangeira;
	}
	
}
