package br.com.ifpe.dangerous.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import br.com.ifpe.dangerous.converters.PublicacaoConverter;
import br.com.ifpe.dangerous.converters.UsuarioConverter;
import br.com.ifpe.dangerous.model.Comentario;
import br.com.ifpe.dangerous.model.ComentarioDao;
import br.com.ifpe.dangerous.model.DadosMunicipio;
import br.com.ifpe.dangerous.model.MunicipioAssaltos;
import br.com.ifpe.dangerous.model.MunicipioAssaltosDao;
import br.com.ifpe.dangerous.model.MunicipioAssassinatos;
import br.com.ifpe.dangerous.model.MunicipioAssassinatosDao;
import br.com.ifpe.dangerous.model.Publicacao;
import br.com.ifpe.dangerous.model.PublicacaoDao;
import br.com.ifpe.dangerous.model.Usuario;
import br.com.ifpe.dangerous.model.UsuarioDao;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;

@Controller
public class SistemaController {
	
	 
	
	@RequestMapping("home")
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
	
	
	@RequestMapping("saveADM")
	public String saveADM(Usuario usuario, @RequestParam("selectSexo") String sexo,@RequestParam("selectNivel_acesso") String nivel_acesso) {
		UsuarioDao dao = new UsuarioDao();
		usuario.setSexo(sexo);
		usuario.setNivel_acesso(nivel_acesso);
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
	model.addAttribute("msg","Não foi encontrado um usuário com o login e senha informados.");
	return "home";
	}

	@RequestMapping("usuario/alterarDados")
	public String alterar() {
		System.out.println("Dangerous Places login");
		return "usuario/alterarDadosUsuario";
	}

		
	@RequestMapping("update")
	public String update(Usuario usuario, Model model,@RequestParam("inputNomeAlterar") String nome,
			@RequestParam("inputEmailAlterar") String email,@RequestParam("inputSenhaAlterar") String senha	
			, @RequestParam("inputEnderecoAlterar") String endereco ,@RequestParam("selectSexo") String sexo) {
	UsuarioDao dao = new UsuarioDao();
	usuario.setNome(nome);
	usuario.setEmail(email);
	usuario.setSenha(senha);
	usuario.setEndereco(endereco);
	usuario.setSexo(sexo);
	dao.alterar(usuario);
	
	model.addAttribute("mensagem", "Usuario Alterado com Sucesso !");
	return "home";
	}
	
	
	@RequestMapping("/forum")
	public String listarPublicacao(Model model) {
	
		PublicacaoDao dao = new PublicacaoDao();
		List<Publicacao> listaPublicacao = dao.listar(null);
		
		ComentarioDao daoComen = new ComentarioDao();
		List<Comentario> listaComentario = daoComen.listar();
		
		
		model.addAttribute("listaPublicacao", listaPublicacao);
		model.addAttribute("listaComentario", listaComentario);
	
		
		return "usuario/forum";
	}
        //Deletar o comentário .
        @RequestMapping("deletePub")
	public String delete(@RequestParam("id") Integer id, Model model) {
		
        ComentarioDao dao1 = new ComentarioDao();
    	dao1.removerPorPub(id);
        	
        
        PublicacaoDao dao = new PublicacaoDao();
		dao.removerPub(id);
		
		
		
		model.addAttribute("mensagem", "Comentário Removido com Sucesso");
		
		
		return "forward:forum";
	}
        
	@RequestMapping("logout")
	public String logout(HttpSession session) {
	session.invalidate();
	return "home";
	}


	@RequestMapping("publicar")
	public String savePublic(Publicacao publicacao, @RequestParam("Tema") String tema,
			@RequestParam("textAreaPublicar") String conteudo,  @RequestParam("usuario") String id) {
		PublicacaoDao dao = new PublicacaoDao();
		publicacao.setTema(tema);
		UsuarioConverter convert = new UsuarioConverter();
		publicacao.setUsuario(convert.convert(id));
		publicacao.setConteudo(conteudo);
		dao.salvar(publicacao);
		
		return "usuario/PublicarSucesso";
	}
	
	@RequestMapping(value = "apagarComentario", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String apagarComentario(@RequestParam Integer id) {
		
		ComentarioDao dao = new ComentarioDao();
		dao.remover(id);
		
		
		
		
		
		return new Gson().toJson(dao.listar());
		
	}
	
	@RequestMapping("/gerandoRelatorio")
	public String novoRelatorio() {
		System.out.println("Mostrando a página de geração de relatórios");
		return "usuario/gerarRelatorio";
	}

	@RequestMapping("sobreNos")
	public String sobreNos() {
		System.out.println("Nosso sobre nós");
		return "sobreNos";
	}
	
	@RequestMapping(value = "dadosMunicipio", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String pegarMunicipio(@RequestParam String municipio) {
		
		MunicipioAssassinatosDao assassinatosDao = new MunicipioAssassinatosDao();
		List<MunicipioAssassinatos> municipioAssassinatos = assassinatosDao.buscarPorNome(municipio);
		
		MunicipioAssaltosDao assaltosDao = new MunicipioAssaltosDao();
		List<MunicipioAssaltos> municipioAssaltos = assaltosDao.buscarPorNome(municipio);
		if(municipioAssaltos != null) {
		
		System.out.println("jooj1");
		} else {System.out.println("jooj2");}
		
		if(municipioAssassinatos != null) {
			System.out.println("jooj4");
		} else {System.out.println("jooj3");}
		
		DadosMunicipio data = new DadosMunicipio(municipioAssaltos, municipioAssassinatos);
		
		return  new Gson().toJson(data);
		
	}
	
	
	/*@RequestMapping(value = "dadosRegiao", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String pegarRegiao(@RequestParam String regiao) {
		System.out.println("to pegando os dados");
		RegiaoAssassinatosDao assassinatosDao = new RegiaoAssassinatosDao();
		RegiaoAssassinatos regiaoAssassinatos = assassinatosDao.buscarPorNome(regiao);
		
		RegiaoAssaltosDao assaltosDao = new RegiaoAssaltosDao();
		RegiaoAssaltos regiaoAssaltos = assaltosDao.buscarPorNome(regiao);
		DadosRegiao data = new DadosRegiao(regiaoAssaltos, regiaoAssassinatos);
		
		
		return  new Gson().toJson(data);
	}*/
	
	@RequestMapping("comentar")
	public String saveComent(Comentario comentario ,@RequestParam("conteudoComent") String conteudo,
			@RequestParam("idUsuComent") String id,@RequestParam("idPubComent") String publicacao) {
		
		System.out.print("id user"+id);
		System.out.print("id public"+publicacao);
		UsuarioConverter convert = new UsuarioConverter();
		
		comentario.setUsuario(convert.convert(id));
		
		PublicacaoConverter convert1 = new PublicacaoConverter();
		
		comentario.setPublicacao(convert1.convert(publicacao));
		comentario.setConteudo(conteudo);
		ComentarioDao dao = new ComentarioDao();
		dao.salvar(comentario);
		
		return "usuario/PublicarSucesso";
	}
	
	@RequestMapping("gerarPDF")
	public String gerarRelatorio() throws JRException {
	@SuppressWarnings("rawtypes")
	Map parametro = new HashMap();
	parametro.put("nome:", "YURI");
	String relatorio = "/Desktop/Relatorio_sem_nome.jasper";
	JasperPrint jasperprint = jasperprint = JasperFillManager.fillReport(relatorio, parametro);
	JasperViewer view = new JasperViewer(jasperprint,false);
	view.setVisible(true);
	return relatorio;
	}

	
	

}
