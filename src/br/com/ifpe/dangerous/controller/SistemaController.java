package br.com.ifpe.dangerous.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.ifpe.dangerous.model.Usuario;
import br.com.ifpe.dangerous.model.UsuarioDao;

@Controller
public class SistemaController {
	
	 
	
	@RequestMapping("")
	public String homePage() {
		System.out.println("Dangerous Places Running");
		return "usuario/menu";
	}

	@RequestMapping("usuario/login")
	public String loginUsuario() {
		System.out.println("Dangerous Places login");
		return "usuario/loginUsuario";
	}

	@RequestMapping("usuario/cadastro")
	public String cadastroUsuario() {
		System.out.println("Dangerous Places cadastro");
		return "usuario/cadastroUsuario";
	}
	
	@RequestMapping("usuario/check")
	@ResponseBody
	public String validarEmail(@RequestParam("email") String email, UsuarioDao user) {
		
		Boolean disponivel = user.buscarPorEmail(email) == null;
		
		return disponivel.toString();
	}
	

	@RequestMapping("/usuario/save")
	public String save(Usuario usuario, @RequestParam("selectSexo") String sexo) {
		UsuarioDao dao = new UsuarioDao();
		usuario.setSexo(sexo);
		dao.salvar(usuario);
		
		return "usuario/menu";
	}
	
	@RequestMapping("/usuario/efetuarLogin")
	public String efetuarLogin(Usuario usuario, HttpSession session, Model model) {
	UsuarioDao dao = new UsuarioDao();
	Usuario usuarioLogado = dao.buscarUsuario(usuario);
	if (usuarioLogado != null) {
	 session.setAttribute("usuarioLogado", usuarioLogado);
	 return "usuario/home";
	}
	model.addAttribute("msg", "Não foi encontrado um usuário com o login e senha informados.");
	return "usuario/loginUsuario";
	}

}
