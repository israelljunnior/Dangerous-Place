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
		return "home";
	}
	
	@RequestMapping("home")
	public String home() {
		System.out.println("Dangerous Places Running");
		return "usuario/home";
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
	
	@RequestMapping("usuario/check")
	@ResponseBody
	public String validarCep(@RequestParam("endereco") String cep){
		
		return "";
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

	@RequestMapping("usuario/alterarDados")
	public String alterar() {
		System.out.println("Dangerous Places login");
		return "usuario/alterarDadosUsuario";
	}

	@RequestMapping("usuario/deletarConta")
	public String deletar() {
		System.out.println("Dangerous Places login");
		return "usuario/deletarConta";
	} 
		
	@RequestMapping("/usuario/update")
	public String update(Usuario usuario, Model model, @RequestParam("selectSexo") String sexo) {
	UsuarioDao dao = new UsuarioDao();
	usuario.setSexo(sexo);
	dao.alterar(usuario);
	model.addAttribute("mensagem", "Usuario Alterado com Sucesso !");
	return "usuario/home";
	}
	
	
	@RequestMapping("usuario/forum")
	public String comentando() {
		System.out.println("Comentando no fórum do Dangerous Places");
		return "usuario/forum";
	}
	
	@RequestMapping("/usuario/delete")
	public String delete(@RequestParam("id") Integer id, Model model) {
	UsuarioDao dao = new UsuarioDao();
	dao.remover(id);
	model.addAttribute("mensagem", "Usuario Removido com Sucesso");
	return "usuario/menu";
	}
	
	
}
