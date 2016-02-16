package br.gov.sp.saobernardo.sispront.login;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.annotations.VisibleForTesting;

import br.gov.sp.saobernardo.sispront.usuario.Usuario;
import br.gov.sp.saobernardo.sispront.usuario.UsuarioLogado;
import br.gov.sp.saobernardo.sispront.usuario.Usuarios;

@Controller
public class LoginController {

	@Autowired
	private Usuarios usuarios;

	@Autowired
	private UsuarioLogado usuarioLogado;

	@Autowired
	MessageSource msgSource;

	/**
	 * @deprecated Aos olhos do Spring somente
	 */
	@Deprecated
	LoginController() {
	}

	@VisibleForTesting
	LoginController(Usuarios usuarios, UsuarioLogado usuarioLogado) {
		this.usuarios = usuarios;
		this.usuarioLogado = usuarioLogado;
	}

	@RequestMapping(value = { "/", "/log-in" }, method = RequestMethod.GET)
	public String mostraFormularioDeLogin() {
		return "formularioDeLogin";
	}

	@RequestMapping(value = "/a/log-out", method = RequestMethod.GET)
	public String logOut(HttpSession session) {
		usuarioLogado.logOut();
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/a/login/senhanova", method = RequestMethod.GET)
	public String senhaNova(Long id, Model model) {
		Usuario usuario = usuarios.buscaPorId(id);
		model.addAttribute("usuario", usuario);
		return "login/senhanova";
	}

	@RequestMapping(value = "/a/login/senhanova", method = RequestMethod.POST)
	public String senhaNovamente(Usuario usuario, RedirectAttributes redirect) {
		usuarios.altera(usuario);
		String msg = msgSource.getMessage("usuario.cadastro.senha.sucesso", null, "", new Locale("pt", "BR"));
		redirect.addFlashAttribute("msgSucesso", msg);

		return "redirect:/a/login/senhanova?id=" + usuario.getId();
	}

}
