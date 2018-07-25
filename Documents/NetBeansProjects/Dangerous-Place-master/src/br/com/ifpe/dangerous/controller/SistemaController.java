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
	
	@RequestMapping("check")
	@ResponseBody
	public String validarEmail(@RequestParam("email") String email, UsuarioDao user) {
		
		Boolean disponivel = user.buscarPorEmail(email) == null;
		
		return disponivel.toString();
	}
	

	@RequestMapping("save")
	public String save(Usuario usuario, @RequestParam("selectSexo") String sexo) {
		UsuarioDao dao = new UsuarioDao();
		usuario.setSexo(sexo);
		dao.salvar(usuario);
		
		return "usuario/cadastroSucesso";
	}
	
	@RequestMapping("efetuarLogin")
	public String efetuarLogin(Usuario usuario, HttpSession session, Model model) {
	UsuarioDao dao = new UsuarioDao();
	Usuario usuarioLogado = dao.buscarUsuario(usuario);
	if (usuarioLogado != null) {
	 session.setAttribute("usuarioLogado", usuarioLogado);
	 return "home";
	}
	model.addAttribute("msg", "Não foi encontrado um usuário com o login e senha informados.");
	return "usuario/loginUsuario";
	}

	@RequestMapping("usuario/alterarDados")
	public String alterar() {
		System.out.println("Dangerous Places login");
		return "usuario/alterarDadosUsuario";
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
        //Deletar o comentário.
        @RequestMapping("/produto/delete")
	public String delete(@RequestParam("id") Integer id, Model model) {
		UsuarioDao dao = new UsuarioDao();
		dao.remover(id);
		model.addAttribute("mensagem", "Comentário Removido com Sucesso");
		return "forward:list";
	}
        
	@RequestMapping("logout")
	public String logout(HttpSession session) {
	session.invalidate();
	return "usuario/home";
	}
}
