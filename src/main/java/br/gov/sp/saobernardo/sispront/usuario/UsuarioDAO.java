package br.gov.sp.saobernardo.sispront.usuario;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.annotations.VisibleForTesting;

import br.gov.sp.saobernardo.sispront.papel.Nomes;
import br.gov.sp.saobernardo.sispront.papel.Papel;

@Repository
public class UsuarioDAO implements Usuarios, UserDetailsService {

	private static final Logger LOGGER = Logger.getLogger(UsuarioDAO.class.getName());

	@PersistenceContext
	private EntityManager em;

	/**
	 * @deprecated Aos olhos do Spring somente
	 */
	@Deprecated
	UsuarioDAO() {
	}

	@VisibleForTesting
	public UsuarioDAO(EntityManager manager) {
		em = manager;
	}

	public void adiciona(Usuario usuario) {
		usuario.getPapeis().add(new Papel(Nomes.ROLE_LOGADO));
		em.persist(usuario);
	}

	public Usuario buscaPorId(Long id) {
		return em.find(Usuario.class, id);
	}

	public List<Usuario> todos() {
		return em.createQuery("select u from Usuario u", Usuario.class).getResultList();
	}

	@Transactional
	public void altera(Usuario usuario) {
		usuario.getPapeis().add(new Papel(Nomes.ROLE_LOGADO));
		em.merge(usuario);
	}

	@Transactional
	public void desativa(Usuario usuario) {
		usuario.setAtivado(false);
		em.merge(usuario);
	}

	@Transactional
	public void ativa(Usuario usuario) {
		usuario.setAtivado(true);
		em.merge(usuario);
	}

	@Transactional
	public void remove(Usuario usuario) {
		em.remove(usuario);
	}

	public Usuario buscaPorEmail(String email) {
		TypedQuery<Usuario> query = em.createQuery("select u from Usuario u where u.email = :email", Usuario.class);
		query.setParameter("email", email);
		try {
			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	public Usuario buscaPorEmail(String email, Long id) {
		TypedQuery<Usuario> query = em.createQuery("select u from Usuario u where u.email = :email and u.id <> :id",
				Usuario.class);
		query.setParameter("email", email);
		query.setParameter("id", id);
		try {
			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	public Usuario buscaPorRegistro(String registro, Long id) {
		TypedQuery<Usuario> query = em
				.createQuery("select u from Usuario u where u.registro = :registro and u.id <> :id", Usuario.class);
		query.setParameter("registro", registro);
		query.setParameter("id", id);
		try {
			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	public Usuario buscaPorRegistro(String registro) {
		TypedQuery<Usuario> query = em.createQuery("select u from Usuario u where u.registro = :registro",
				Usuario.class);
		query.setParameter("registro", registro);
		try {
			return query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	public Usuario buscaPor(String registro, String senha) {
		TypedQuery<Usuario> query = em.createQuery(
				"select u from Usuario u where u.registro = :registro and u.senha = :senha", Usuario.class);
		query.setParameter("registro", registro);
		query.setParameter("senha", senha);

		try {
			return query.getSingleResult();
		} catch (NoResultException e) {
			LOGGER.log(Level.WARNING, "Nenhum usuário foi encontrado para o registro " + registro + " com senha");
			return null;
		}
	}

	public UserDetails loadUserByUsername(String registro) throws UsernameNotFoundException {
		TypedQuery<Usuario> query = em.createQuery("select u from Usuario u where u.registro = :registro",
				Usuario.class);
		query.setParameter("registro", registro);
		try {
			return query.getSingleResult();
		} catch (NoResultException e) {
			throw new UsernameNotFoundException(
					"Usuário com registro " + registro + " não foi encontrado no banco de dados");
		}
	}

}
