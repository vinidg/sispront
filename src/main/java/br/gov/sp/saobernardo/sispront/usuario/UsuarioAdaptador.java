package br.gov.sp.saobernardo.sispront.usuario;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Component
public class UsuarioAdaptador {

	private static final Logger LOGGER = Logger
			.getLogger(UsuarioAdaptador.class.getName());

	public Usuario obterUsuarioLogado() {

		try {
			return (Usuario) SecurityContextHolder.getContext()
					.getAuthentication().getPrincipal();

		} catch (Exception e) {
			LOGGER.log(Level.WARNING,
					"Ocorreu um erro ao recuperar o usuário logado", e);
			return null;
		}
	}
}
