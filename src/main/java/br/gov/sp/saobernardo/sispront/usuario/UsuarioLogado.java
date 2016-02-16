package br.gov.sp.saobernardo.sispront.usuario;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

@Component
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class UsuarioLogado {

	@Autowired
	private Usuarios usuarios;

	private Long id;

	public Usuario get() {
		return usuarios.buscaPorId(id);
	}

	public void logIn(Usuario usuario) {
		id = usuario.getId();
	}

	public void logOut() {
		id = null;
	}

	public boolean isLogged() {
		return id != null;
	}
}
