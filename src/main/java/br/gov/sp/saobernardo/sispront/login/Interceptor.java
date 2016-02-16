package br.gov.sp.saobernardo.sispront.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import br.gov.sp.saobernardo.sispront.usuario.UsuarioLogado;

public class Interceptor extends HandlerInterceptorAdapter {

	@Autowired
	private UsuarioLogado usuarioLogado;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		String uri = request.getRequestURI();

		if (uri.contains("/resources/") || uri.contains("log-in")
				|| uri.equals("/sispront/")) {
			return true;
		}

		if (usuarioLogado.isLogged()) {
			return true;
		}

		response.sendRedirect("/sispront/");
		return false;
	}

}
