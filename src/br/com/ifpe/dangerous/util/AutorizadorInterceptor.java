package br.com.ifpe.dangerous.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
	    throws Exception {

	String uri = request.getRequestURI();
	if (uri.contains("bootstrap") 
		|| uri.contains("css") 
		|| uri.contains("img") 
		|| uri.contains("js") 	
		|| uri.contains("jquery-validation-1.17.0")
		|| uri.contains("localization")
		|| uri.contains("jquery.validate.min")
		|| uri.endsWith("save")
		|| uri.endsWith("check")
		|| uri.endsWith("dadosMunicipio")
		|| uri.endsWith("dadosRegiao")
		|| uri.endsWith("home")
		|| uri.endsWith("efetuarLogin")) {	
	    return true;
	}

	if (request.getSession().getAttribute("usuarioLogado") != null) {
	    return true;
	}

	response.sendRedirect("home");
	return false; 
    }
	
}
