package br.gov.sp.saobernardo.sispront.resposta;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class RespostaDAO implements Respostas {

	@PersistenceContext
	private EntityManager em;

	public List<Resposta> todas() {
		return em.createQuery("select p from Resposta p", Resposta.class).getResultList();
	}

	@Transactional
	public void adcionaResposta(Resposta resposta) {
		em.persist(resposta);
	}


}
