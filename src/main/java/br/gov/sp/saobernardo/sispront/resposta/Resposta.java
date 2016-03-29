package br.gov.sp.saobernardo.sispront.resposta;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;

import br.gov.sp.saobernardo.sispront.usuario.Usuario;

@Entity
public class Resposta {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sq_resposta")
	@SequenceGenerator(name = "sq_resposta", sequenceName = "sq_resposta", allocationSize = 1, initialValue = 1)
	private Long id;
	
	@Enumerated(EnumType.STRING)
	private Status resposta;
	
	private String motivo;
	
	private String rg;
	
	private Calendar dataDaResposta;
	
	@ManyToOne
	@JoinColumn(name = "autor_id")
	private Usuario autor;

	@Deprecated
	Resposta() {
	}
	
	public Resposta(Status resposta, String motivo, String rg, Usuario autor){
		super();
		this.resposta = resposta;
		this.motivo = motivo;
		this.rg = rg;
		this.autor = autor;
	}
	
	@PrePersist
	void prePersist() {
		dataDaResposta = Calendar.getInstance();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMotivo() {
		return motivo;
	}

	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public Calendar getDataDaResposta() {
		return dataDaResposta;
	}

	public void setDataDaResposta(Calendar dataDaResposta) {
		this.dataDaResposta = dataDaResposta;
	}

	public Usuario getAutor() {
		return autor;
	}

	public void setAutor(Usuario autor) {
		this.autor = autor;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((resposta == null) ? 0 : resposta.hashCode());
		return result;
	}

	public Status getResposta() {
		return resposta;
	}

	public void setResposta(Status resposta) {
		this.resposta = resposta;
	}

}
