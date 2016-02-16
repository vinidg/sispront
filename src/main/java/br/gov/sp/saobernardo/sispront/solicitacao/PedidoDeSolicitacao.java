package br.gov.sp.saobernardo.sispront.solicitacao;

import java.util.Calendar;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

public class PedidoDeSolicitacao {
	
	@Id
	@GeneratedValue
	private Long id;
	
	@NotBlank(message = "{}")
	private String nome;
	
	@NotBlank(message = "{}")
	private String mae;
	
	@NotBlank(message = "{}")
	private String rg;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar dataNascimento;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar dataAtendimento;
	
	private String motivo;
	
	@NotBlank(message = "{}")
	private String telefone;
	
	private String celular;
	
	@NotNull(message = "{}")
	private Boolean internacao;
	
	private String nomeSolicitante;
	
	private String rgSolicitante;
	
	private String observacao;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getMae() {
		return mae;
	}

	public void setMae(String mae) {
		this.mae = mae;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public Calendar getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Calendar dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public Calendar getDataAtendimento() {
		return dataAtendimento;
	}

	public void setDataAtendimento(Calendar dataAtendimento) {
		this.dataAtendimento = dataAtendimento;
	}

	public String getMotivo() {
		return motivo;
	}

	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public Boolean getInternacao() {
		return internacao;
	}

	public void setInternacao(Boolean internacao) {
		this.internacao = internacao;
	}

	public String getNomeSolicitante() {
		return nomeSolicitante;
	}

	public void setNomeSolicitante(String nomeSolicitante) {
		this.nomeSolicitante = nomeSolicitante;
	}

	public String getRgSolicitante() {
		return rgSolicitante;
	}

	public void setRgSolicitante(String rgSolicitante) {
		this.rgSolicitante = rgSolicitante;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	
}
