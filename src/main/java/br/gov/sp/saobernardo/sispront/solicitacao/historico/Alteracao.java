package br.gov.sp.saobernardo.sispront.solicitacao.historico;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.beans.factory.annotation.Autowired;

import br.gov.sp.saobernardo.sispront.usuario.Usuario;

@Entity
public class Alteracao {

	public static enum TipoDeAlteracao {
		Aguardando_Levantamento_de_Ficha, Aguardando_Retirada, Entregue, Não_Entregue
	}

	@Id
	@GeneratedValue
	private Long id;

	@Temporal(TemporalType.TIMESTAMP)
	private Calendar data;

	@Enumerated(EnumType.STRING)
	private TipoDeAlteracao tipoDeAlteracao;

	@ManyToOne
	private Usuario autor;

	@Column(length = 2000)
	String observacao;

	/**
	 * @deprecated Aos olhos do Hibernate somente
	 */
	@Deprecated
	Alteracao() {
	}

	@Autowired
	private Alteracao(TipoDeAlteracao tipoDeAlteracao, Usuario autor, String observacao) {
		this.tipoDeAlteracao = tipoDeAlteracao;
		this.autor = autor;
		this.observacao = observacao;
	}

	public Alteracao(Usuario autor, String observacao) {
		this(TipoDeAlteracao.Entregue, autor, observacao);
	}

	public Long getId() {
		return id;
	}

	public Calendar getData() {
		return data;
	}

	public TipoDeAlteracao getTipo() {
		return tipoDeAlteracao;
	}

	public Usuario getAutor() {
		return autor;
	}

	@PrePersist
	void prePersist() {
		data = Calendar.getInstance();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Alteracao other = (Alteracao) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setData(Calendar data) {
		this.data = data;
	}

	public void setTipo(TipoDeAlteracao tipoDeAlteracao) {
		this.tipoDeAlteracao = tipoDeAlteracao;
	}

	public void setAutor(Usuario autor) {
		this.autor = autor;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

}
