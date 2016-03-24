package br.gov.sp.saobernardo.sispront.papel;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

@Repository
public class PapelDAO implements Papeis {

	@PersistenceContext
	private EntityManager em;

	public List<Papel> todos() {
		return em.createQuery("select p from Papel p where p.nome <> 'ROLE_LOGADO'", Papel.class).getResultList();
	}

}
