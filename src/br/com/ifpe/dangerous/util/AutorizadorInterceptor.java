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
		|| uri.endsWith("save")
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
