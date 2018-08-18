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
	color: black;
	font-size: 3.5em;
	font-family: 'Montserrat', sans-serif;
}

#conteudo_publicacao {
	font-size: 1.1em;
	text-indent: 1em;
	text-align: justify;
}

#mostrar_comentario {
	background-color: rgba(0, 191, 255, 0.2);
}

.tam{	
	height:20em;
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

	<center>
		<h2 id="titulo_forum">Fórum</h2>
	</center>

	<div class="row" style="font-family: 'Montserrat', sans-serif">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<table>
				<tr>
					<td colspan="5" style="width: 100%;"><input
						class="form-control" id="myInput" type="text"
						style="width: 300px;" placeholder="Search.." /></td>
					<td>
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#modalPublicar"
							style="align: rigth; background-color: #555555; color: white">Publicar</button>
					</td>
				</tr>
			</table>
			<br><br>
			<div class="row" id="container">
		
			<c:forEach var="publicacao" items="${listaPublicacao}">						
				
						<div class="col-sm-6">	
							<div class="w3-container">
							<div class="w3-card-4 tam" >			
						<header class="w3-container w3-black"><br>	
						<td>Tema: ${publicacao.tema}</td><br>
						<td><a data-toggle="modal" data-target="#modal"> ${publicacao.usuario.nome}</a></td><br>
						<td>Publicado em: <fmt:formatDate value="${publicacao.data}" pattern="dd/MM/yyyy" /></td><br>
						<td>Título: ${publicacao.titulo}</td>
						<br><br>
						</header>

						<div class="w3-container">
						<td><br><p id="conteudo_publicacao">${publicacao.conteudo}</p><br></td>					
						</div>
						<tr></tr>
						<footer class="w3-container">
							<td><button class="btn btn-danger" data-toggle="modal"
								data-target="#modalExcluir" style="float: right;">Excluir</button></td>
								<td><button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#modalComentario${publicacao.id}"
								style="background-color: #555555; color: white">Comentários</button></td>
								<br><br>
						</footer>
						</div><br><br></div></div>
					
								
				<!-- Modal excluir -->
				<div class="modal fade" id="modalExcluir" role="dialog">
					<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
						<center><h4><p>Você tem certeza que deseja excluir?</p></h4>
							<a method="post" href="deletePub?id=${publicacao.id}"><button type="button" class="btn btn-danger">Sim</button></a>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Não</button>
						</center>
						</div>
							<div class="modal-footer"></div></div></div>
							</div> <!-- Modal -->
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
																		test="${comentario.usuario.nivel_acesso == 'adm' || 'admSup' }">
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
							</div> </c:forEach></div></div></div> </div>

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

												<li><label>Data de nascimento:&nbsp;&nbsp;</label>
													23/32/1333</li>

												<br>
												<li><label>Descrição do usuário:&nbsp;&nbsp;</label>
													Minha descrição</li>
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

function apagarComentario(id) {
	
	$.post("apagarComentario",{"id": id}, function(newList){
		
	
	});
}	

</script>