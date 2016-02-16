package br.gov.sp.saobernardo.sispront.solicitacao;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.gov.sp.saobernardo.sispront.papel.Nomes;
import br.gov.sp.saobernardo.sispront.usuario.Usuario;
import br.gov.sp.saobernardo.sispront.usuario.UsuarioAdaptador;
import br.gov.sp.saobernardo.sispront.usuario.Usuarios;

@Controller
public class HomeController {
	
	@Autowired
	private UsuarioAdaptador usuarioAdaptador;
	
	@Autowired
	private Solicitacoes solicitacoes;
	
	@Autowired
	private Usuarios usuarios;
	
	/** 
	 * @Deprecated Somente aos olhos do Spring
	 */
	
	@Deprecated
	HomeController(){
		
	}
	
	@RequestMapping(value = "/a/solicitacao/home" , method = RequestMethod.GET)
	public String mostraHome() {
		return "solicitacao/home";
	}
	
	@Secured(Nomes.ROLE_SOLICITANTE)
	@RequestMapping(value = "/a/solicitacao/nova" , method = RequestMethod.GET)
	public String mostraFormularioDeCadastro(Model model) {
		return "solicitacao/formularioNovaSolicitacao";
	}
	
	@Secured(Nomes.ROLE_SOLICITANTE)
	@RequestMapping(value = "/a/solicitacao/nova" , method = RequestMethod.POST)
	public String salvarCadastro(@Valid Solicitacao solicitacao, Model model,
			BindingResult result, RedirectAttributes redirect) {

		if(result.hasErrors()){
			return mostraFormularioDeCadastro(model);
		}

		Usuario usuario = usuarioAdaptador.obterUsuarioLogado();
		solicitacao.setAutor(usuario);
		solicitacao.setStatus(Status.Aguardando_Levantamento_de_Ficha);

		solicitacoes.adicionaSolicitacao(solicitacao);

		return "redirect:/a/solicitacao/home";
	}
	
	@Secured({ Nomes.ROLE_SOLICITANTE, Nomes.ROLE_MONITOR })
	@RequestMapping(value = "/a/solicitacao/todos", method = RequestMethod.GET)
	public String mostraListaTodos(Model model){
		Usuario usuario = usuarioAdaptador.obterUsuarioLogado();
		usuario = usuarios.buscaPorId(usuario.getId());
		
		List<Solicitacao> novasSolicitacoes = solicitacoes.buscaSolicitacoes(usuario.getUnidade());
		model.addAttribute("novasSolicitacoes", novasSolicitacoes);
		
		return "solicitacao/listaAbertas";
	}
	
	
}
