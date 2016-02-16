package br.gov.sp.saobernardo.sispront.usuario;

import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.annotations.VisibleForTesting;

import br.gov.sp.saobernardo.sispront.papel.ConversorDePapeis;
import br.gov.sp.saobernardo.sispront.papel.Nomes;
import br.gov.sp.saobernardo.sispront.papel.Papeis;
import br.gov.sp.saobernardo.sispront.papel.Papel;
import br.gov.sp.saobernardo.sispront.papel.PedidoDePapeis;
import br.gov.sp.saobernardo.sispront.papel.PedidoDePapel;

@Controller
public class UsuarioController {

	@Autowired
	private Usuarios usuarios;

	@Autowired
	private Papeis papeis;

	@Autowired
	private ConversorDePapeis conversorDePapeis;

	@Autowired
	private MessageSource msgSource;

	@Autowired
	UsuarioAdaptador usuarioAdaptador;

	/**
	 * @deprecated Somente aos olhos do Spring
	 */
	@Deprecated
	UsuarioController() {
	}

	@VisibleForTesting
	UsuarioController(Usuarios usuarios, Papeis papeis, ConversorDePapeis conversorDePapeis, MessageSource msg) {
		this.usuarios = usuarios;
		this.papeis = papeis;
		this.conversorDePapeis = conversorDePapeis;
		this.msgSource = msg;
	}

	@Secured(Nomes.ROLE_ADMINISTRADOR)
	@RequestMapping(value = "/a/usuario/novo", method = RequestMethod.GET)
	public String mostraFormularioDeCadastro(Model model) {

		List<Papel> todosOsPapeis = papeis.todos();
		List<PedidoDePapel> pedidosDePapeis = conversorDePapeis.mostraTodos(todosOsPapeis);

		model.addAttribute("papeis", pedidosDePapeis);
		model.addAttribute("funcoes", Funcao.values());
		model.addAttribute("unidades", Unidade.values());
		return "usuario/formularioDeCadastro";
	}

	@Secured(Nomes.ROLE_ADMINISTRADOR)
	@Transactional
	@RequestMapping(value = "/a/usuario/novo", method = RequestMethod.POST)
	public String cadastra(@Valid UsuarioFormularioCadastro usuarioFormularioCadastro, BindingResult result,
			Model model, RedirectAttributes redirect) {

		Usuario usuario = usuarioFormularioCadastro.convertePara(new Usuario());
		Set<Papel> novosPapeis = conversorDePapeis.selecionaAtivos(usuarioFormularioCadastro.getPedidoPapeis());

		if (usuarios.buscaPorEmail(usuarioFormularioCadastro.getEmail()) != null) {
			String msg = msgSource.getMessage("usuario.cadastro.email.duplicado", null, "", new Locale("pt", "BR"));
			ObjectError error = new ObjectError("usuarioDuplicado", msg);
			result.addError(error);
		}

		if (usuarios.buscaPorRegistro(usuarioFormularioCadastro.getRegistro()) != null) {
			String msg = msgSource.getMessage("usuario.cadastro.registro.duplicado", null, "", new Locale("pt", "BR"));
			ObjectError error = new ObjectError("usuarioDuplicado", msg);
			result.addError(error);
		}

		usuario.setPapeis(novosPapeis);

		if (result.hasErrors()) {
			List<Papel> todosPapeis = papeis.todos();
			List<PedidoDePapel> pedidosDePapeis = conversorDePapeis.cruza(todosPapeis, usuario.getPapeis());
			model.addAttribute("papeis", pedidosDePapeis);
			model.addAttribute("funcoes", Funcao.values());

			return "usuario/formularioDeCadastro";
		}

		usuarios.adiciona(usuario);

		String msg = msgSource.getMessage("usuario.cadastro.sucesso", null, "", new Locale("pt", "BR"));
		redirect.addFlashAttribute("msgSucesso", msg);
		return "redirect:/a/usuario/todos";
	}

	@Secured(Nomes.ROLE_ADMINISTRADOR)
	@RequestMapping(value = "/a/usuario/todos", method = RequestMethod.GET)
	public String listar(Model model) {

		List<Usuario> todosUsuarios = usuarios.todos();

		model.addAttribute("usuarios", todosUsuarios);
		return "usuario/lista";
	}

	@Secured(Nomes.ROLE_ADMINISTRADOR)
	@RequestMapping(value = "/a/usuario/{id}/altera", method = RequestMethod.GET)
	public String mostraFormularioDeAlteracao(@PathVariable("id") Long id, Model model) {
		Usuario usuario = usuarios.buscaPorId(id);
		if (usuario == null) {
			throw new UsuarioNaoEncontradoException(id);
		}
		model.addAttribute("usuario", usuario);
		model.addAttribute("funcoes", Funcao.values());
		model.addAttribute("unidades",Unidade.values());
		return "usuario/formularioDeAlteracao";
	}

	@Secured(Nomes.ROLE_ADMINISTRADOR)
	@RequestMapping(value = "/a/usuario/{id}/altera", method = RequestMethod.POST)
	public String alteraUsuario(@PathVariable("id") Long id, @Valid UsuarioFormulario usuarioFormulario,
			BindingResult result, Model model, RedirectAttributes redirect) {

		Usuario usuario = usuarios.buscaPorId(id);
		usuario = usuarioFormulario.convertePara(usuario);

		if (usuarios.buscaPorRegistro(usuario.getRegistro(), usuario.getId()) != null) {
			String msg = msgSource.getMessage("usuario.cadastro.registro.duplicado", null, "", new Locale("pt", "BR"));
			ObjectError error = new ObjectError("usuarioDuplicado", msg);
			result.addError(error);
		}

		if (result.hasErrors()) {
			model.addAttribute("usuario", usuario);
			model.addAttribute("funcoes", Funcao.values());
			return "usuario/formularioDeAlteracao";
		}

		usuarios.altera(usuario);

		String msg = msgSource.getMessage("usuario.atualiza.sucesso", null, "", new Locale("pt", "BR"));
		redirect.addFlashAttribute("msgSucesso", msg);
		return "redirect:/a/usuario/" + id + "/altera";
	}

	@Secured(Nomes.ROLE_ADMINISTRADOR)
	@RequestMapping(value = "/a/usuario/{id}/papeis", method = RequestMethod.GET)
	public String mostraFormularioDePapeis(@PathVariable("id") Long id, Model model) {
		Usuario usuario = usuarios.buscaPorId(id);
		if (usuario == null) {
			throw new UsuarioNaoEncontradoException(id);
		}
		List<Papel> todosOsPapeis = papeis.todos();
		List<PedidoDePapel> pedidosDePapeis = conversorDePapeis.cruza(todosOsPapeis, usuario.getPapeis());

		model.addAttribute("papeis", pedidosDePapeis);
		model.addAttribute("usuario", usuario);

		return "usuario/formularioDePapeis";
	}

	@Secured(Nomes.ROLE_ADMINISTRADOR)
	@RequestMapping(value = "/a/usuario/{id}/papeis", method = RequestMethod.POST)
	public String alteraPapeis(@PathVariable("id") Long id, PedidoDePapeis pedido, RedirectAttributes redirect) {
		Usuario usuario = usuarios.buscaPorId(id);
		if (usuario == null) {
			throw new UsuarioNaoEncontradoException(id);
		}
		Set<Papel> novosPapeis = conversorDePapeis.selecionaAtivos(pedido.getPedidos());
		usuario.setPapeis(novosPapeis);
		usuarios.altera(usuario);
		String msg = msgSource.getMessage("usuario.alteracao.papel.sucesso", null, "", new Locale("pt", "BR"));
		redirect.addFlashAttribute("msgSucesso", msg);
		return "redirect:/a/usuario/todos";
	}

	@Secured(Nomes.ROLE_ADMINISTRADOR)
	@RequestMapping(value = "/a/usuario/desativa", method = RequestMethod.POST)
	public String desativaUsuario(Long id, RedirectAttributes redirect) {
		Usuario usuario = usuarios.buscaPorId(id);
		if (usuario == null) {
			throw new UsuarioNaoEncontradoException(id);
		}

		Usuario usuarioLogado = usuarioAdaptador.obterUsuarioLogado();
		if (usuario.equals(usuarioLogado)) {
			String msg = msgSource.getMessage("usuario.desativacao.naoPermitida", null, "", new Locale("pt", "BR"));
			redirect.addFlashAttribute("msgAviso", msg);

			return "redirect:/a/usuario/todos";
		}

		usuarios.desativa(usuario);
		String msg = msgSource.getMessage("usuario.desativacao.sucesso", null, "", new Locale("pt", "BR"));
		redirect.addFlashAttribute("msgSucesso", msg);

		return "redirect:/a/usuario/todos";
	}

	@Secured(Nomes.ROLE_ADMINISTRADOR)
	@RequestMapping(value = "/a/usuario/ativa", method = RequestMethod.POST)
	public String ativaUsuario(Long id, RedirectAttributes redirect) {
		Usuario usuario = usuarios.buscaPorId(id);
		if (usuario == null) {
			throw new UsuarioNaoEncontradoException(id);
		}
		usuarios.ativa(usuario);
		String msg = msgSource.getMessage("usuario.ativacao.sucesso", null, "", new Locale("pt", "BR"));
		redirect.addFlashAttribute("msgSucesso", msg);

		return "redirect:/a/usuario/todos";
	}

	@Secured(Nomes.ROLE_LOGADO)
	@RequestMapping(value = "/a/usuario/altera-senha", method = RequestMethod.GET)
	public String mostraFormularioDeAlteracaoDeSenha(Model model) {

		Usuario usuario = usuarioAdaptador.obterUsuarioLogado();
		model.addAttribute("usuario", usuario);

		return "usuario/formularioDeAlteracaoDeSenha";
	}

	@Secured(Nomes.ROLE_LOGADO)
	@RequestMapping(value = "/a/usuario/altera-senha", method = RequestMethod.POST)
	public String alteraSenha(@Valid SenhaParaFormulario senhaParaFormulario, BindingResult result, Model model,
			RedirectAttributes redirect) {

		if (result.hasErrors()) {
			return mostraFormularioDeAlteracaoDeSenha(model);
		}

		Usuario usuarioLogado = usuarioAdaptador.obterUsuarioLogado();
		usuarioLogado.setSenha(senhaParaFormulario.getSenha());

		usuarios.altera(usuarioLogado);

		String msg = msgSource.getMessage("usuario.cadastro.senha.sucesso", null, "", new Locale("pt", "BR"));
		redirect.addFlashAttribute("msgSucesso", msg);

		return "redirect:/a/usuario/altera-senha";
	}

	@Secured(Nomes.ROLE_ADMINISTRADOR)
	@RequestMapping(value = "/a/usuario/{id}/altera-senha-adm", method = RequestMethod.GET)
	public String mostraFormularioDeAlteracaoDeSenhaAdm(@PathVariable("id") Long id, Model model) {
		Usuario usuario = usuarios.buscaPorId(id);
		if (usuario == null) {
			throw new UsuarioNaoEncontradoException(id);
		}

		model.addAttribute("usuario", usuario);

		return "usuario/formularioDeAlteracaoDeSenhaAdm";
	}

	@Secured(Nomes.ROLE_ADMINISTRADOR)
	@RequestMapping(value = "/a/usuario/{id}/altera-senha-adm", method = RequestMethod.POST)
	public String alteraSenhaAdm(@PathVariable("id") Long id, @Valid SenhaParaFormulario senhaParaFormulario,
			BindingResult result, Model model, RedirectAttributes redirect) {
		if (result.hasErrors()) {
			return mostraFormularioDeAlteracaoDeSenhaAdm(id, model);
		}

		Usuario usuario = usuarios.buscaPorId(id);
		usuario.setSenha(senhaParaFormulario.getSenha());
		usuarios.altera(usuario);

		String msg = msgSource.getMessage("usuario.cadastro.senha.sucesso", null, "", new Locale("pt", "BR"));
		redirect.addFlashAttribute("msgSucesso", msg);

		return "redirect:/a/usuario/" + id + "/altera-senha-adm";
	}

}
