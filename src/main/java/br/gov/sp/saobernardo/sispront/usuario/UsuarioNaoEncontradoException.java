package br.gov.sp.saobernardo.sispront.usuario;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class UsuarioNaoEncontradoException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public UsuarioNaoEncontradoException(Long id) {
		super("O usuário com id " + id + " não foi encontrado");
	}

}
