package br.gov.sp.saobernardo.sispront.solicitacao;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class SolicitacaoNaoEncontradoException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;

	public SolicitacaoNaoEncontradoException(Long id) {
		super("A solicitacao com id " + id + " não foi encontrada");
	}
}
