package br.gov.sp.saobernardo.sispront.solicitacao;

import java.util.List;

import br.gov.sp.saobernardo.sispront.usuario.Unidade;

public interface Solicitacoes {

	void adicionaSolicitacao(Solicitacao solicitacao);

	List<Solicitacao> buscaSolicitacoes(Unidade unidade);
	
	

}
