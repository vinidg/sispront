package br.gov.sp.saobernardo.sispront.usuario;

import org.hibernate.validator.constraints.NotBlank;

public class UsuarioFormulario {

	@NotBlank(message = "{usuario.cadastro.registro.obrigatorio}")
	private String registro;

	@NotBlank(message = "{usuario.cadastro.nome.obrigatorio}")
	private String nome;

	@NotBlank(message = "{usuario.cadastro.email.obrigatorio}")
	private String email;

	@NotBlank(message = "{usuario.cadastro.funcao.obrigatoria}")
	private String funcao;

	private String telefone;

	private String celular;
	
	private String unidade;

	public Usuario convertePara(Usuario usuario) {

		usuario.setRegistro(registro);
		usuario.setNome(nome);
		usuario.setEmail(email);
		usuario.setFuncao(funcao);
		usuario.setTelefone(telefone);
		usuario.setCelular(celular);
		usuario.setUnidade(unidade);
		return usuario;
	}

	public String getRegistro() {
		return registro;
	}

	public void setRegistro(String registro) {
		this.registro = registro;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFuncao() {
		return funcao;
	}

	public void setFuncao(String funcao) {
		this.funcao = funcao;
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

	public String getUnidade() {
		return unidade;
	}

	public void setUnidade(String unidade) {
		this.unidade = unidade;
	}
}
