<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fórum</title>

<style type="text/css">
#titulo_forum {
	color: black;
	font-size: 3.5em;
	text-align: center;
}

#container {
	margin-bottom: 20px;
	margin-top: -14px;
	left: 14%;
}

#tabel_publicacao {
	width: 100%;
	border-style: solid;
	border-color: red;
}

#assunto_publicacao {
	margin-left: 5px;
	font-size: 1.2em;
}

#div_space {
	margin-bottom: 50px;
}

#nome_usuaro_publicacao {
	font-size: 15px;
	margin-left: 50px;
}

#titulo_publicacao {
	font-size: 1.4em;
}

#conteudo_publicacao {
	font-size: 1.2em;
	text-indent: 2.5em;
	margin-top: 30px;
}

#mostrar_comentario {
	background-color: rgba(0, 191, 255, 0.2);
}
</style>



</head>

<c:import url="../comum/header.jsp"></c:import>


<body>
	
	<div id="container" class="container col-sm-8">

		<h2 id="titulo_forum">Fórum</h2>

		<table border="0">
			<tr>
				<td colspan="5" style="width:100%;"><input class="form-control" id="myInput" type="text"
					style="width: 300px;" placeholder="Search.." /></td>
				
				
				<td>
					<button type="button" class="btn btn-primary"  data-toggle="modal"
						data-target="#modalPublicar"
						 style="align:rigth; background-color: #555555; color: white">Publicar</button>
					 
				</td>
			</tr>
		</table>

<c:forEach var="publicacao" items="${listaPublicacao}">



<p>${publicacao.id}</p>



		<table id="tabel_publicacao" border="0">

			<tr id="coluna_assunto">
				<!-- assunto da publicacção-->
				<td id="assunto_publicacao" colspan="3"><b>Assunto: </b>
					${publicacao.tema} <td><div id="div_space"></div></td>
	</td>
			</tr>

			<tr style="margin-left: 4px">

				<!-- Foto do usuário que publicou-->
				<td><a data-toggle="modal" data-target="#modal"><img
				class='img-thumbnail' src="" alt='Foto de exibição' width='55px'
				height='40px' />"</a></td>

				<!-- Nome do usuário que publicou-->
				<td id="nome_usuaro_publicacao"><a data-toggle="modal"
			data-target="#modal"> ${publicacao.usuario.nome}</td>

				<!-- Data da públicação-->
				<td><b>Publicado na data:</b> ${publicacao.data}</td>
		
						<c:if test="${usuarioLogado.id == publicacao.usuario.id}">
        
				<td><button class="btn btn-danger" style="float:right;" >Excluir</button></td>
		    </c:if>	
			</tr>



			<tr>

				<!-- Título da publicação -->
				<td colspan="3" id="titulo_publicacao"><br> <b>Titulo:</b>
					${publicacao.titulo}</td>
			
	<tr>
				<!-- O conteúdo em si do publicação -->
				<td colspan="3">
					<p id="conteudo_publicacao">${publicacao.conteudo}</p>
				</td>
				<td><br> <br> <br> <br></td>
			</tr>

				<tr>
				<td colspan="3"><br> 
				<!-- Botão que  irá exibir todos comentários -->
					<a  data-toggle="modal" data-target="#modalComentario">Mostrar Comentários</a>
					
					 <label style="margin-left: 4px;">Quantidade de comentários: 0 </label> <br>
					<br> <br> <br>



			

						
						
						 
											
</c:forEach>

			<!-- *************************************************************************************** -->

			<!-- Modal para perfil no fórum -->
			<div class="modal fade" id="modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<center>
								<h3 class="modal-title">Perfil</h3>
							</center>
							<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<ul type="none">
								<li><center>Foto</center></li>
								<br>
								<br>
								<li><label>Número de postagem que o usuário já fez:
								</label><br> 0</li>
								<br>

								<li><label>Nome:&nbsp;&nbsp;</label> Diego</li>
								<br>

								<li><label>Sexo:&nbsp;&nbsp;</label> Masculino</li>
								<br>

								<li><label>Data de nascimento:&nbsp;&nbsp;</label>
									23/32/1333</li>

								<br>
								<li><label>Descrição do usuário:&nbsp;&nbsp;</label> Minha
									descrição</li>
						
				</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
						</div>
					</div>
				</div>
			</div>
</table>

			<!-- Fim modal -->
			<!-- *************************************************************************************** -->


			<!-- Modal publicar  está no header -->
					

<!-- modal comentario -->


  <a  data-toggle="modal" data-target="#modalComentario">Mostrar Comentários</a>

  <!-- Modal -->
  <div class="modal fade" id="modalComentario" role="dialog" >
    <div class="modal-dialog" style="width:60%;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h2 class="modal-title">Comentários</h2>
        </div>
        <div class="modal-body">
          <table border="0" style="width: 100%;" >
							
							<tr>
								<!-- Foto do usuário que postou o comentário -->
								<td>Foto do usuário</td>

								<!--Espaço -->
								<td><br> <br> <br> <br> <br></td>

								<!-- Nome do usuário que postou o comentário -->
								<td><b>Diego</b></td>

								<!-- Data que comentário foi postado -->

								<td>23/03/3232</td>
								
							
								<!-- Opção de apagar o comentário -->
								<td><button class="btn btn-danger">Apagar</button></td>

							</tr>

							<tr>
								<!-- O comentário em si está aqui -->
								<td colspan="6">Comentário fica aqui <br> <br> 
								<!-- Colocando uma linha para separar cada comentário -->
									<hr />
								</td>
							</tr>
						</table>
        
        
    
        
        
        
        </div>
        <div class="modal-footer">
<table border="0" style="width: 100%; ">
						<tr>
							<td><br> <br> <br></td>
						</tr>
						
						<tr>
							<td>
								<!-- Campo de formulário pra enviar um novo comentário -->
								<form action="comentar" id="formComent" method="post"">
			
								<input type="hidden" id="idUsuComent" name="idUsuComent" value="${usuarioLogado.id }">
								<input type="hidden" id="idPubComent" name="idPubComent" value="${publicacao.id }">
			
									<textarea style="resize: none;" rows="6" cols="5"
										class="form-control" minlength="1" form="formComent" name="conteudoComent"
										placeholder="Escreva um comentário "></textarea>
									
									<br> <input class="btn btn-primary" type="submit"
										 value="Enviar Comentário" style=" float: right; background-color: #555555;"> <br>
									<br>
									
								</form>

							</td>
						</tr>
					</table> <!-- Fim de Área de enviar comentáro-->



        </div>
      </div>
      
    </div>
  </div>
  
</body>
</html>