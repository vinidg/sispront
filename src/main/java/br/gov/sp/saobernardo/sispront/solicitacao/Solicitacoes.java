package br.gov.sp.saobernardo.sispront.solicitacao;

import java.util.List;

public interface Solicitacoes {

	void adicionaSolicitacao(Solicitacao solicitacao);

	List<Solicitacao> buscaSolicitacoes(String unidade);

	Solicitacao buscaPorId(Long id);
	
	

}
