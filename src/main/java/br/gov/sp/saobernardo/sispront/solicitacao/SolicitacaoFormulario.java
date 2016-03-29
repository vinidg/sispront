package br.gov.sp.saobernardo.sispront.solicitacao;

import java.util.Calendar;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import br.gov.sp.saobernardo.sispront.resposta.Status;
import br.gov.sp.saobernardo.sispront.usuario.Usuario;

public class SolicitacaoFormulario {
	
	@NotBlank(message = "{solicitacao.cadastro.nome.obrigatorio}")
	private String nome;

	@NotBlank(message = "{solicitacao.cadastro.mae.obrigatorio}")
	private String mae;
	
	@NotBlank(message = "{solicitacao.cadastro.rg.obrigatorio}")
	private String rg;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar dataNascimento;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Calendar dataAtendimento;
	
	private String motivo;
	
	private String horario;
	
	private String local;
	
	@NotBlank(message = "{solicitacao.cadastro.telefone.obrigatorio}")
	private String telefone;
	
	private String celular;
	
	@NotNull(message = "{solicitacao.cadastro.internacao.obrigatorio}")
	private Boolean internacao;
	
	private Double dias;
	
	private String nomeSolicitante;
	
	private String rgSolicitante;
	
	private String observacao;
	
	@Enumerated(EnumType.STRING)
	private Status status;
	
	@ManyToOne
	@JoinColumn(name="autor_id")
	private Usuario autor;
	
	private String unidade;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar data;
	
	public Solicitacao convertePara(Solicitacao solicitacao){
		
		solicitacao.setNome(nome);
		solicitacao.setMae(mae);
		solicitacao.setRg(rg);
		solicitacao.setDataNascimento(dataNascimento);
		solicitacao.setDataAtendimento(dataAtendimento);
		solicitacao.setMotivo(motivo);
		solicitacao.setHorario(horario);
		solicitacao.setLocal(local);
		solicitacao.setTelefone(telefone);
		solicitacao.setCelular(celular);
		solicitacao.setInternacao(internacao);
		solicitacao.setDias(dias);
		solicitacao.setNomeSolicitante(nomeSolicitante);
		solicitacao.setRgSolicitante(rgSolicitante);
		solicitacao.setObservacao(observacao);
		solicitacao.setData(data);
		
		return solicitacao;
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

	public String getHorario() {
		return horario;
	}

	public void setHorario(String horario) {
		this.horario = horario;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
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

	public Double getDias() {
		return dias;
	}

	public void setDias(Double dias) {
		this.dias = dias;
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

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Usuario getAutor() {
		return autor;
	}

	public void setAutor(Usuario autor) {
		this.autor = autor;
	}

	public String getUnidade() {
		return unidade;
	}

	public void setUnidade(String unidade) {
		this.unidade = unidade;
	}

	public Calendar getData() {
		return data;
	}

	public void setData(Calendar data) {
		this.data = data;
	}
	

	
}
