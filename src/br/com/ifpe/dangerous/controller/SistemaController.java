package br.com.ifpe.dangerous.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@RequestMapping("/usuario/save")
	public String save(Usuario usuario, @RequestParam("selectSexo") String sexo) {
		UsuarioDao dao = new UsuarioDao();
		usuario.setSexo(sexo);
		dao.salvar(usuario);
		return "usuario/menu";
	}

}
