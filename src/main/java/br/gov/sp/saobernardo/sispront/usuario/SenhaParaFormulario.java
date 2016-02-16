package br.gov.sp.saobernardo.sispront.usuario;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Size;
import javax.validation.constraints.Size.List;

import org.hibernate.validator.constraints.NotBlank;

public class SenhaParaFormulario {

	@NotBlank(message = "{usuario.cadastro.senha.obrigatoria}")
	@List({ @Size(min = 5, message = "{usuario.cadastro.senha.caracteres.minimo}"),
			@Size(max = 20, message = "{usuario.cadastro.senha.caracteres.maximo}") })
	private String senha;

	private String senhaConfirmacao;

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getSenhaConfirmacao() {
		return senhaConfirmacao;
	}

	public void setSenhaConfirmacao(String senhaConfirmacao) {
		this.senhaConfirmacao = senhaConfirmacao;
	}

	@AssertTrue(message = "{usuario.cadastro.senha.nao.confere}")
	public boolean isSenhaConfere() {
		if (this.senha.equals(this.senhaConfirmacao)) {
			return true;
		}
		return false;
	}

}
