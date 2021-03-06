package br.com.ifpe.dangerous.controller;

import java.util.List;

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
import br.com.ifpe.dangerous.converters.TemaConverter;
import br.com.ifpe.dangerous.converters.UsuarioConverter;
import br.com.ifpe.dangerous.model.Comentario;
import br.com.ifpe.dangerous.model.ComentarioDao;
import br.com.ifpe.dangerous.model.DadosMunicipio;
import br.com.ifpe.dangerous.model.DadosRegiao;
import br.com.ifpe.dangerous.model.MunicipioAssaltos;
import br.com.ifpe.dangerous.model.MunicipioAssaltosDao;
import br.com.ifpe.dangerous.model.MunicipioAssassinatos;
import br.com.ifpe.dangerous.model.MunicipioAssassinatosDao;
import br.com.ifpe.dangerous.model.MunicipioViolenciaSexual;
import br.com.ifpe.dangerous.model.MunicipioViolenciaSexualDao;
import br.com.ifpe.dangerous.model.Publicacao;
import br.com.ifpe.dangerous.model.PublicacaoDao;
import br.com.ifpe.dangerous.model.RegiaoAssaltos;
import br.com.ifpe.dangerous.model.RegiaoAssaltosDao;
import br.com.ifpe.dangerous.model.RegiaoAssassinatos;
import br.com.ifpe.dangerous.model.RegiaoAssassinatosDao;
import br.com.ifpe.dangerous.model.RegiaoViolenciaSexual;
import br.com.ifpe.dangerous.model.RegiaoViolenciaSexualDao;
import br.com.ifpe.dangerous.model.Tema;
import br.com.ifpe.dangerous.model.TemaDao;
import br.com.ifpe.dangerous.model.Usuario;
import br.com.ifpe.dangerous.model.UsuarioDao;
import br.com.ifpe.dangerous.util.Criptografia;

@Controller
public class SistemaController {

	@RequestMapping("")
	public String homePagee() {
		System.out.println("Dangerous Places Running");
		return "home";
	}
	
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
		usuario.setSenha(Criptografia.criptografar(usuario.getSenha()));
		dao.salvar(usuario);
		
		return "usuario/cadastroSucesso";
	}

	@RequestMapping("saveADM")
	public String saveADM(Usuario usuario, @RequestParam("nomeAdm") String nome, @RequestParam("emailAdm") String email,
			@RequestParam("senhaAdm") String senha, @RequestParam("selectSexoAdm") String sexo,
			@RequestParam("enderecoAdm") String endereco, @RequestParam("selectNivel_acessoAdm") String nivel_acesso) {
		UsuarioDao dao = new UsuarioDao();
		usuario.setNome(nome);
		usuario.setEmail(email);
		usuario.setSenha(senha);
		usuario.setSexo(sexo);
		usuario.setEndereco(endereco);
		usuario.setNivel_acesso(nivel_acesso);
		dao.salvar(usuario);

		return "usuario/cadastroSucesso";
	}

	@RequestMapping("efetuarLogin")
	public String efetuarLogin(Usuario usuario, HttpSession session, Model model) {
		UsuarioDao dao = new UsuarioDao();
		usuario.setSenha(Criptografia.criptografar(usuario.getSenha()));
		Usuario usuarioLogado = dao.buscarUsuario(usuario);
		if (usuarioLogado != null) {
			session.setAttribute("usuarioLogado", usuarioLogado);
			return "forward:home";
			 
		}
		model.addAttribute("msgNaoEncontrado", "Não foi encontrado um usuário com o login e senha informados.");
		return "home";
	}
	
	@RequestMapping("acesso")
	public String tentarAcessar(Usuario usuario, HttpSession session, Model model) {

		model.addAttribute("msgPrecisaLogin", "Faça Login para Acessar o Recurso");
		return "home";
	}

	@RequestMapping("usuario/alterarDados")
	public String alterar() {
		System.out.println("Dangerous Places login");
		return "usuario/alterarDadosUsuario";
	}

	@RequestMapping("update")
	public String update(Usuario usuario, Model model,HttpSession session,@RequestParam("inputNomeAlterar") String nome,
			@RequestParam("inputEmailAlterar") String email, 
			@RequestParam("inputEnderecoAlterar") String endereco, @RequestParam("selectSexo") String sexo) {
		UsuarioDao dao = new UsuarioDao();
		usuario.setNome(nome);
		usuario.setEmail(email);
		usuario.setEndereco(endereco);
		usuario.setSexo(sexo);
		dao.alterar(usuario);
		Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
				usuarioLogado.setNome(nome);
				usuarioLogado.setEmail(email);
				usuarioLogado.setEndereco(endereco);
				usuarioLogado.setSexo(sexo);
				session.setAttribute("usuarioLogado", usuarioLogado);
		
		model.addAttribute("mensagem", "Usuario Alterado com Sucesso !");
		return "home";
	}
	
	@RequestMapping("updateSenha")
	public String updateSenha(Usuario usuario,HttpSession session,Model model,@RequestParam("inputSenhaAtual") String senhaAtual) {
		
		
		UsuarioDao dao = new UsuarioDao();
		Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
		System.out.println(usuarioLogado.getSenha());
		
		if (usuarioLogado.getSenha().equals(Criptografia.criptografar(senhaAtual)) ) {
		    usuario.setSenha(Criptografia.criptografar(usuario.getSenha()));
	
		    dao.alterar(usuario);
		} 
		
		
		
		
		return "home";
	}
	
	
	@RequestMapping("/forum")
	public String listarPublicacao(Model model) {

		PublicacaoDao dao = new PublicacaoDao();
		List<Publicacao> listaPublicacao = dao.listar(null);

		ComentarioDao daoComen = new ComentarioDao();
		List<Comentario> listaComentario = daoComen.listar();
		
		TemaDao daoTema= new TemaDao();
		List<Tema> listaTema =  daoTema.listar();

		model.addAttribute("listaPublicacao", listaPublicacao);
		model.addAttribute("listaTema", listaTema);
		model.addAttribute("listaComentario", listaComentario);

		return "usuario/forum";
	}

	// Deletar o comentário .
	@RequestMapping("deletePub")
	public String delete(@RequestParam("id") Integer id, Model model) {

		ComentarioDao dao1 = new ComentarioDao();
		dao1.removerPorPub(id);

		PublicacaoDao dao = new PublicacaoDao();
		dao.removerPub(id);

		model.addAttribute("mensagem", "Comentário Removido com Sucesso");

		return "forward:forum";
	}

	@RequestMapping("deleteComent")
	public String deleteComent(@RequestParam Integer id, Model model) {

		ComentarioDao dao1 = new ComentarioDao();
		dao1.remover(id);

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
			@RequestParam("textAreaPublicar") String conteudo, @RequestParam("usuario") String id) {
		PublicacaoDao dao = new PublicacaoDao();
		TemaConverter tc =  new TemaConverter();
		publicacao.setTema(tc.convert(tema));
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

	@RequestMapping("sobreNos")
	public String sobreNos() {
		System.out.println("Nosso sobre nós");
		return "sobreNos";
	}

	@RequestMapping(value = "dadosMunicipio", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String pegarMunicipio(@RequestParam String municipio) {
		MunicipioAssassinatosDao assassinatosDao = new MunicipioAssassinatosDao();
		List<MunicipioAssassinatos> municipioAssassinatos = assassinatosDao.buscarPorNome(municipio);
		
		MunicipioViolenciaSexualDao violenciaSexual = new MunicipioViolenciaSexualDao();
		List<MunicipioViolenciaSexual> municipioViolenciaSexual = violenciaSexual.buscarPorNome(municipio);
		
		MunicipioAssaltosDao assaltosDao = new MunicipioAssaltosDao();
		List<MunicipioAssaltos> municipioAssaltos = assaltosDao.buscarPorNome(municipio);

		DadosMunicipio data = new DadosMunicipio(municipioAssaltos, municipioAssassinatos,municipioViolenciaSexual);

		return new Gson().toJson(data);
	}

	@RequestMapping(value = "dadosRegiao", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String pegarRegiao(@RequestParam String regiao) {
		System.out.println("to pegando os dados");
		RegiaoAssassinatosDao assassinatosDao = new RegiaoAssassinatosDao();
		List<RegiaoAssassinatos> regiaoAssassinatos = assassinatosDao.buscarPorNome(regiao);

		
		RegiaoViolenciaSexualDao violenciaSexual = new RegiaoViolenciaSexualDao();
		List<RegiaoViolenciaSexual> regiaoViolenciaSexual = violenciaSexual.buscarPorNome(regiao);
		
		RegiaoAssaltosDao assaltosDao = new RegiaoAssaltosDao();
		List<RegiaoAssaltos> regiaoAssaltos = assaltosDao.buscarPorNome(regiao);
		DadosRegiao data = new DadosRegiao(regiaoAssaltos, regiaoAssassinatos,regiaoViolenciaSexual);

		return new Gson().toJson(data);
	}

	@RequestMapping("comentar")
	public String saveComent(Comentario comentario, @RequestParam("conteudoComent") String conteudo,
			@RequestParam("idUsuComent") String id, @RequestParam("idPubComent") String publicacao) {

		System.out.print("id user" + id);
		System.out.print("id public" + publicacao);
		UsuarioConverter convert = new UsuarioConverter();

		comentario.setUsuario(convert.convert(id));

		PublicacaoConverter convert1 = new PublicacaoConverter();

		comentario.setPublicacao(convert1.convert(publicacao));
		comentario.setConteudo(conteudo);
		ComentarioDao dao = new ComentarioDao();
		dao.salvar(comentario);

		return "usuario/PublicarSucesso";
	}

	@RequestMapping(value = "/google", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String googleLogin(@RequestParam("googleNome") String googleNome,
			@RequestParam("googleId") Integer googleId, HttpSession session) {

		System.out.println(googleNome);
		Usuario usuario = new Usuario();
		usuario.setId(googleId);
		usuario.setNome(googleNome);

		session.setAttribute("usuarioLogado", usuario);

		return "home";
	}
	@RequestMapping("publicarEdit")
	public String publicarEdit(@RequestParam("TemaEdit") String tema,
            @RequestParam("tituloEdit") String titulo, @RequestParam("textAreaPublicarEdit") String conteudo,
            @RequestParam("idPublicacaoEdit") String id ) {

        PublicacaoDao dao = new PublicacaoDao();
        PublicacaoConverter convert1 = new PublicacaoConverter();
        Publicacao publicacao = convert1.convert(id);
        TemaConverter tc =  new TemaConverter();
        publicacao.setTema(tc.convert(tema));
        publicacao.setTitulo(titulo);
        publicacao.setConteudo(conteudo);
        System.out.println(publicacao.getConteudo());
		System.out.println(publicacao.getTitulo());
		System.out.println(publicacao.getTema());
		System.out.println(publicacao.getId());
        dao.alterar(publicacao);

        return "usuario/PublicarSucesso";
    }

	@RequestMapping("comentarEdit")
	public String comentarEdit(@RequestParam("id") int id,@RequestParam("idPubComentEdit") String id_publicacao,@RequestParam("idUsuComentEdit") String id_usuario,
			@RequestParam("conteudoComentEdit") String conteudo, Model model) {
		
		System.out.println(id);
		System.out.println(conteudo);
		
		
		Comentario comentario = new Comentario();
		ComentarioDao dao = new ComentarioDao();
		UsuarioConverter uc =  new UsuarioConverter();
		PublicacaoConverter pc = new PublicacaoConverter();
		
		comentario.setPublicacao(pc.convert(id_publicacao));
		comentario.setUsuario(uc.convert(id_usuario));
		comentario.setId(id);
		comentario.setConteudo(conteudo);
		dao.alterar(comentario);
		
		model.addAttribute("msgComentEdit", "Comentário Editado com Sucesso");
		
		return "forward:forum";
	}
	
	@RequestMapping("filtro")
	public String filtrar(Publicacao publicacao, Model model) { 
		System.out.println(publicacao.getTitulo());
	
		PublicacaoDao dao = new PublicacaoDao();
		List<Publicacao> listaPublicacao = dao.filtrar(publicacao);
		
		TemaDao daoTema= new TemaDao();
		List<Tema> listaTema =  daoTema.listar();
		
		model.addAttribute("listaPublicacao", listaPublicacao);
		model.addAttribute("listaTema", listaTema);
		return "usuario/forum";
	}


	@RequestMapping("checkSenhaAtual")	
	public @ResponseBody String validarSenha(HttpSession session ,@RequestParam("inputSenhaAtual") String senhaAtual, UsuarioDao user) {
		Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
		Boolean atual = Criptografia.criptografar(senhaAtual).equals(usuarioLogado.getSenha());

		System.out.println(senhaAtual);
		System.out.println(usuarioLogado.getSenha());
		return atual.toString();
	}

}
