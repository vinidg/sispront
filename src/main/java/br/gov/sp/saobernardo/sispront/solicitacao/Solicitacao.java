package br.gov.sp.saobernardo.sispront.solicitacao;

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
public class Solicitacao {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "sq_solicitacao")
	@SequenceGenerator(name = "sq_solicitacao", sequenceName = "sq_solicitacao", allocationSize = 1, initialValue = 1)
	private Long id;
	
	private String nome;

	private String mae;
	
	private String rg;
	
	private Calendar dataNascimento;
	
	private Calendar dataAtendimento;
	
	private String motivo;
	
	private String horario;
	
	private String local;
	
	private String telefone;
	
	private String celular;
	
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
	
	private Calendar data;
	
	public Solicitacao() {
		status = Status.Aguardando_Levantamento_de_Ficha;
	}

	@PrePersist
	void prePersist() {
		data = Calendar.getInstance();
	}
	
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

	public Usuario getAutor() {
		return autor;
	}

	public void setAutor(Usuario autor) {
		this.autor = autor;
	}

	public Calendar getData() {
		return data;
	}

	public void setData(Calendar data) {
		this.data = data;
	}

	public Double getDias() {
		return dias;
	}

	public void setDias(Double dias) {
		this.dias = dias;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
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

	public String getUnidade() {
		return unidade;
	}

	public void setUnidade(String unidade) {
		this.unidade = unidade;
	}

}
