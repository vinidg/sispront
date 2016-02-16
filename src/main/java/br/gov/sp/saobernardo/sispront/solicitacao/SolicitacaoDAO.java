package br.gov.sp.saobernardo.sispront.solicitacao;

import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import br.gov.sp.saobernardo.sispront.usuario.Unidade;

@Repository
public class SolicitacaoDAO implements Solicitacoes{
	
	@PersistenceContext
	private EntityManager manager;
	
	/**
	 * @deprecated Aos olhos do spring
	 */
	
	@Deprecated
	SolicitacaoDAO(){
		
	}

	@Override
	@Transactional
	public void adicionaSolicitacao(Solicitacao solicitacao){
		manager.persist(solicitacao);
	}

	@Override
	public List<Solicitacao> buscaSolicitacoes(Unidade unidade){
		try {
			TypedQuery<Solicitacao> query = manager.createQuery(
					"select s from Solicitacao s where s.unidade in :unidade and s.status in :status",
					Solicitacao.class);
			query.setParameter("unidade", unidade);
			query.setParameter("status", Arrays.asList(Status.Aguardando_Levantamento_de_Ficha, Status.Aguardando_Retirada));
			return query.getResultList();

		} catch (Exception e) {
			return null;
		}
	}
}