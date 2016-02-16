package br.gov.sp.saobernardo.sispront.solicitacao.historico;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Embeddable
public class Historico {

	@OneToMany(cascade = CascadeType.MERGE)
	@JoinColumn(name = "solicitacao_id")
	private Set<Alteracao> alteracoes = new HashSet<Alteracao>();

	public void adiciona(Alteracao alteracao) {
		alteracoes.add(alteracao);
	}

	public Set<Alteracao> getAlteracoes() {
		return Collections.unmodifiableSet(alteracoes);
	}

	public void setAlteracoes(Set<Alteracao> alteracoes) {
		this.alteracoes = alteracoes;
	}

}
