<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:import url="../comum/header.jsp"></c:import>

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

#linha {
	height: 1px;
	border: none;
	color: #606060;
	background-color: white;
	margin-top: 0px;
	margin-bottom: 0px;
	border-style: inset;
}
</style>



</head>
<body>
	<!--  ANTIGO FÓRUM

	<center>
		<h1>Fórum</h1>
	</center>
	<br />
		
		<div class="col-sm-3"></div>
		
		<div class="col-sm-6" style="align:center">
		
		<h3>Tópico 1</h3>
			
		<textarea placeholder="Escreva seu topico aqui:"style="padding:15px; width: 600px; height: 200px;"></textarea>
		<br>
		<br>
	
	
	<button type="submit" class="btn btn-primary"
		style="align:rigth; background-color: black; color: white">Publicar</button>
	
 
	<button type="submit" class="btn btn-primary"
		style="align:rigth; background-color: black; color: white">Crie</button>
		
	<button type="submit" class="btn btn-primary"
		style="align:rigth; background-color: black; color: white">Comente esse topico aqui</button>
              
        <button type="submit" class="btn btn-primary" style="align:rigth; background-color: black; color: white" value="delete?id=${produto.id}">Remover comentário</button>
	 </div>
	 <div class="col-sm-3"></div>
	  -->




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
<p>${publicacao.tema}</p>
<p>${publicacao.titulo}</p>
<p>${publicacao.conteudo}</p>
<p>${publicacao.id}</p>
<p>${publicacao.usuario}</p>
<p>${publicacao.data}</p>


		<table id="tabel_publicacao" border="0">

			<tr id="coluna_assunto">
				<!-- assunto da publicacção-->
				<td id="assunto_publicacao" colspan="3"><b>Assunto: </b>
					Assunto vai aqui <td><div id="div_space"></div></td>
	</td>
			</tr>

			<tr style="margin-left: 4px">

				<!-- Foto do usuário que publicou-->
				<td><a data-toggle="modal" data-target="#modal"><img
				class='img-thumbnail' src="" alt='Foto de exibição' width='55px'
				height='40px' />"</a></td>

				<!-- Nome do usuário que publicou-->
				<td id="nome_usuaro_publicacao"><a data-toggle="modal"
			data-target="#modal"> Diego Passos</td>

				<!-- Data da públicação-->
				<td><b>Publicado na data:</b> 23/03/1199</td>

				<td><button class="btn btn-danger" style="float:right;" >Apagar</button></td>

			</tr>



			<tr>

				<!-- Título da publicação -->
				<td colspan="3" id="titulo_publicacao"><br> <b>Titulo:</b>
					Título aqui</td>
			
	<tr>
				<!-- O conteúdo em si do comentário -->
				<td colspan="3">
					<p id="conteudo_publicacao">Conteúdo aqui</p>
				</td>
				<td><br> <br> <br> <br></td>
			</tr>

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
</c:forEach>
			<!-- Fim modal -->
			<!-- *************************************************************************************** -->


			<tr>
				<td colspan="3"><br> 
				<!-- Botão que irá iniciar uma função do bootstrap collapse e irá exibir todos comentários -->
					<button id="mostrar_comentario" type="button"
				class="btn btn-default" data-toggle="collapse"
				data-target="#comentario" >Mostrar comentários</button> <label
			style="margin-left: 4px;">Quantidade de comentários: 0 </label> <br>
					<br> <br> <br>

					<div id="comentario" class="collapse">
						<table border="0" style="width: 70%; float: right;">
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
								<td colspan="6">Comentário fica aqui <br> <br> <!-- Colocando uma linha para separar cada comentário -->
									<hr id="linha" />
								</td>
							</tr>
						</table>

						
<!-- Área de enviar comentáro-->
					<table border="0" style="width: 70%; float: right;">
						<tr>
							<td><br> <br> <br></td>
						</tr>
						<tr>
							<td>
								<!-- Campo de formulário pra enviar um novo comentário -->
								<form action="" method="post"">

									<textarea style="resize: none;" rows="6" cols="5"
										class="form-control" minlength="1" required="" name="conteudo"
										placeholder="Escreva um comentário "></textarea>
									<br> <input class="btn btn-primary" type="submit"
										value="Enviar Comentário" style="float: right;"> <br>
									<br>
								</form>

							</td>
						</tr>
					</table> <!-- Fim de Área de enviar comentáro--> 
					
					
					
					<!-- Modal publicar  está no header -->
					



		

	</body>
</html>