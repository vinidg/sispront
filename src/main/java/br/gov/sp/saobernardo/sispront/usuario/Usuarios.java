package br.gov.sp.saobernardo.sispront.usuario;

import java.util.List;

public interface Usuarios {

	void adiciona(Usuario usuario);

	void altera(Usuario usuario);

	void remove(Usuario usuario);

	void desativa(Usuario usuario);

	void ativa(Usuario usuario);

	List<Usuario> todos();

	Usuario buscaPorId(Long id);

	Usuario buscaPor(String registro, String senha);

	Usuario buscaPorEmail(String email);

	Usuario buscaPorRegistro(String registro);

	Usuario buscaPorRegistro(String registro, Long id);

	Usuario buscaPorEmail(String email, Long id);

}
