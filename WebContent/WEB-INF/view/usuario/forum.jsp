<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<title>Fórum</title>

<style type="text/css">
#titulo_forum {
	color: white;
	font-size: 3.5em;
	font-family: 'Montserrat', sans-serif;
}

#conteudo_publicacao {
	font-size: 1em;
	text-indent: 0.4em;
	text-align: justify;
	word-wrap: break-word;
}

#mostrar_comentario {
	background-color: rgba(0, 191, 255, 0.2);
}

.tam {
	height: 25em;
}




}

</style>
</head>

<c:import url="../comum/header.jsp"></c:import>

<body>

	<script type="text/javascript"> 
	var tam = 15;
 function fonte(e){
    var elemento = $("#container");
    var fonte = elemento.css('font-size');
    if (e == 'a') {
        elemento.css("fontSize", parseInt(fonte) + 1);
    } else if('d'){
        elemento.css("fontSize", parseInt(fonte) - 1);
    }
}
</script>

	<button onClick="fonte('a');">+</button>
	<button onClick="fonte('d');">-</button>

<div  class="container" style=" width:82%; background-color:black;">
	<center>
		<h2 id="titulo_forum">Fórum</h2>
	</center>
</div>
<br>
<table id="tablefilter" border="0" align="center" ">
				<tr>
					<!-- filtro -->
					<form action="filtro">

						<td><input type="text" id="filtro" class="form-control"
							name="filtro" style="width: 500px; height: 40px;" maxlength="100" placeholder="Pesquisar..." /></td>

						<td><button style="height: 40px;" type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-search"></i></button></td>

					</form>
					<!-- /filtro -->
<td>&nbsp;</td>
					<td align="rigth">
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#modalPublicar"
							style="height: 40px;; width:100%; background-color: #555555; color: white">Publicar</button>
					</td>
				</tr>
				
				
				
			</table>
			<br> <br>


	<div class="row" style="font-family: 'Montserrat', sans-serif">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			
			<div class="row" id="container">

				<c:forEach var="publicacao" items="${listaPublicacao}">

					<div class="col-sm-6">
						<div class="w3-container">
							<div class="w3-card-4 tam">
								<header class="w3-container w3-black"> <br>
								<div class="btn-group btn-group-xs" style="float: right;">

									<c:choose>
										<c:when test="${publicacao.usuario.id == usuarioLogado.id}">
											<button type="button" class="btn btn-primary"
												data-toggle="modal"
												data-target="#modalPublicarEdit${publicacao.id}">Editar</button>
											<button type="button" class="btn btn-danger"
												data-toggle="modal" data-target="#modalExcluir">Excluir</button>

										</c:when>
										<c:otherwise>
											<c:if
												test="${usuarioLogado.nivel_acesso == 'admSup'|| 'adm' }">

												<button type="button" class="btn btn-danger"
													data-toggle="modal" data-target="#modalExcluir">Excluir</button>

											</c:if>

										</c:otherwise>

									</c:choose>


								</div>
								<td>Tema: ${publicacao.tema}</td>
								<br>
								<td><a data-toggle="modal" data-target="#modal">
										${publicacao.usuario.nome}</a></td>
								<br>
								<td>Publicado em: <fmt:formatDate
										value="${publicacao.data}" pattern="dd/MM/yyyy" /></td>
								<br>
								<td>Título: ${publicacao.titulo}</td>

								<br>
								<br>
								</header>

								<div class="w3-container" style="height: 12em;">
									<td><br>
										<p id="conteudo_publicacao">${publicacao.conteudo}</p> <br></td>
								</div>
								<tr></tr>
								<div class="w3-container" style="height: 5em;">


									<td><button type="button" class="btn btn-primary"
											data-toggle="modal"
											data-target="#modalComentario${publicacao.id}"
											style="background-color: #555555; color: white">Ver Comentários</button></td>
									<br> <br>

								</div>
							</div>
							<br> <br>
						</div>
					</div>

					<!--  Modal Editar -->
					<div class="modal fade" id="modalPublicarEdit${publicacao.id}"
						tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
						media="all" data-backdrop="static">
						<div class="modal-dialog modal-xs" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<center>
										<h3>Editar Publicação</h3>
									</center>
								</div>
								<div class="modal-body">
									<form action="publicarEdit" id="formModalPublicarEdit"
										method="post">


										<input type="hidden" id="idPublicarEdit" name="usuarioPubEdit"
											value="${publicacao.usuario.id }">
										<div class="form-group">
											<label for="inputTema">Tema da Publicação:</label> <select
												id="inputTemaEdit" name="TemaEdit">
												<option class="form-control" required="required"
													type="radio" value="Assaltos" name="Assaltos">Assaltos</option>
												<br />
												<option class="form-control" required="required"
													type="radio" value="Acidentes de Trânsito"
													name="Acidentes de Trânsito">Acidentes de Trânsito</option>
												<br />
												<option class="form-control" required="required"
													type="radio" value="Assassinatos" name="Assassinatos">Assassinatos</option>

											</select>
										</div>


										<div class="form-group">

											<label for="inputTitulo">Titulo:</label> <input type="text"
												id="inputTituloEdit" class="form-control" name="tituloEdit"
												style="width: 100%;" value="${publicacao.titulo }" />
										</div>

										<!-- ESSE AQUIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII -->
										<div class="form-group">
											<textarea class="form-control" rows="5"
												form="formModalPublicarEdit" name="textAreaPublicarEdit"
												id="conteudoEdit" style="resize: none;">${publicacao.conteudo}</textarea>
										</div>

										<button type="submit" class="btn btn-primary"
											style="background-color: #555555" data-toggle="tooltip">Enviar</button>



									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- /miOdal EDIATAR -->

					<!-- Modal excluir -->
					<div class="modal fade" id="modalExcluir" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body">
									<center>
										<h4>
											<p>Você tem certeza que deseja excluir?</p>
										</h4>
										<a method="post" href="deletePub?id=${publicacao.id}"><button
												type="button" class="btn btn-danger">Sim</button></a>
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">Não</button>
									</center>
								</div>
								<div class="modal-footer"></div>
							</div>
						</div>
					</div>

					<!-- Modal -->
					<div class="modal fade" id="modalComentario${ publicacao.id}"
						role="dialog">
						<div class="modal-dialog" style="width: 60%;">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h2 class="modal-title">Comentários</h2>
								</div>
								<div class="modal-body">
									<table border="0" style="width: 100%;">

										<c:forEach var="comentario" items="${listaComentario}">

											<c:if test="${ comentario.publicacao.id == publicacao.id}">
												<tr>
													<td><br> <br> <br></td>
													<td><b>${comentario.usuario.nome }</b></td>

													<!-- Data que comentário foi postado -->

													<td><fmt:formatDate value="${comentario.data}"
															pattern="dd/MM/yyyy" /></td>

													<c:choose>
														<c:when
															test="${comentario.usuario.id == usuarioLogado.id}">
															<!-- Opção de apagar o comentário -->
															<td><button class="btn btn-danger">Apagar</button></td>

														</c:when>
														<c:otherwise>
															<c:if
																test="${usuarioLogado.nivel_acesso == 'adm' || 'admSup' }">
																<!-- Opção de apagar o comentário -->
																<td><button class="btn btn-danger"
																		onclick="apagarComentario(${comentario.id})">Apagar</button></td>
															</c:if>

														</c:otherwise>

													</c:choose>
												</tr>

												<tr>
													<!-- O comentário em si está aqui -->
													<td colspan="6"><p>${comentario.conteudo}</p> <!-- Colocando uma linha para separar cada comentário -->
														<hr /></td>
												</tr>
											</c:if>
										</c:forEach>
									</table>

								</div>

								<div class="modal-footer">
									<table border="0" style="width: 100%;">
										<tr>
											<td><br> <br> <br></td>
										</tr>

										<tr>
											<td>
												<!-- Campo de formulário pra enviar um novo comentário -->
												<form action="comentar" id="formComent${publicacao.id}"
													method="post"">

													<input type="hidden" id="idUsuComent${publicacao.id } "
														name="idUsuComent" value="${usuarioLogado.id}" /> <input
														type="hidden" id="idPubComent${publicacao.id }"
														name="idPubComent" value="${publicacao.id}" />

													<textarea style="resize: none;" rows="6" cols="5"
														class="form-control" minlength="1"
														form="formComent${publicacao.id}" name="conteudoComent"
														placeholder="Escreva um comentário "></textarea>

													<br> <input class="btn btn-primary" type="submit"
														value="Enviar Comentário"
														style="float: right; background-color: #555555;">
													<br> <br>

												</form>

											</td>
										</tr>
									</table>

								</div>
							</div>

						</div>
					</div>





				</c:forEach>
			</div>
		</div>
	</div>
	</div>

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
						<br>
						<li><label>Nome:&nbsp;&nbsp;</label> Diego</li>
						<br>

						<li><label>Sexo:&nbsp;&nbsp;</label> Masculino</li>
						<br>

						<li><label>Data de nascimento:&nbsp;&nbsp;</label> 23/32/1333</li>

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
	<div class="col-sm-1"></div>

	</div>
</body>
</html>

<script>
/*
function apagarComentario(id) {
	
	$.post("apagarComentario",{"id": id}, function(newList){
		
	
	});
}	
*/
</script>