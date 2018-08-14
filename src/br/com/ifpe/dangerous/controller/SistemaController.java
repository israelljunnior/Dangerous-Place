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
import br.com.ifpe.dangerous.model.Municipio;
import br.com.ifpe.dangerous.model.MunicipioCvliDao;
import br.com.ifpe.dangerous.model.MunicipioDao;
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
	
	@RequestMapping(value = "dadosMuncipios", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String pegarMunicipio(@RequestParam String data) {
		
		System.out.println("pegando dados municipio");
		
		MunicipioDao dao = new MunicipioDao();
		Municipio municipio = dao.buscarPorNome(data);
		
		if(municipio != null) {
		System.out.println(municipio.getNomeMunicipio());
		}		else System.out.println("jooj");
		
		
		return  new Gson().toJson(municipio);
	}

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
	String relatorio = "";
	JasperPrint jasperprint = jasperprint = JasperFillManager.fillReport(relatorio, parametro);
	JasperViewer view = new JasperViewer(jasperprint,false);
	view.setVisible(true);
	return relatorio;
	}
}
