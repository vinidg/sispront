package br.gov.sp.saobernardo.sispront.usuario;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.AssertTrue;

import br.gov.sp.saobernardo.sispront.papel.PedidoDePapel;

public class UsuarioFormularioCadastro extends UsuarioFormulario {

	@Valid
	private SenhaParaFormulario senha;

	private List<PedidoDePapel> pedidoPapeis;


	public List<PedidoDePapel> getPedidoPapeis() {
		return pedidoPapeis;
	}

	public void setPedidoPapeis(List<PedidoDePapel> pedidoPapeis) {
		this.pedidoPapeis = pedidoPapeis;
	}

	@Override
	public Usuario convertePara(Usuario usuario) {

		usuario.setRegistro(getRegistro());
		usuario.setNome(getNome());
		usuario.setEmail(getEmail());
		usuario.setFuncao(getFuncao());
		usuario.setTelefone(getTelefone());
		usuario.setCelular(getCelular());
		if (senha != null) {
			usuario.setSenha(senha.getSenha());
		}
		usuario.setUnidade(getUnidade());
		return usuario;
	}

	public SenhaParaFormulario getSenha() {
		return senha;
	}

	public void setSenha(SenhaParaFormulario senha) {
		this.senha = senha;
	}

		@AssertTrue(message = "{usuario.cadastro.papel.obrigatorio}")
	public boolean isPapeisPreenchidos() {
		if (this.pedidoPapeis == null || this.pedidoPapeis.isEmpty()) {
			return false;
		}

		for (PedidoDePapel pedidoDePapel : this.pedidoPapeis) {
			if (pedidoDePapel != null && pedidoDePapel.isAtiva()) {
				return true;
			}
		}

		return false;
	}

}
