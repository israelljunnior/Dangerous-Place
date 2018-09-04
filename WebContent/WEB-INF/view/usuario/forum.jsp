<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon"  href="<%=request.getContextPath()%>/resources/assets/dp.jpg">

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
}
</style>
</head>

<c:import url="../comum/header.jsp"></c:import>

<body>

	<script type="text/javascript"> 
	var tam = 15;
 function fonte(e){
    var elemento = $("#todoBody");
    var fonte = elemento.css('font-size');
    if (e == 'a') {
        elemento.css("fontSize", parseInt(fonte) + 1);
    } else if('d'){
        elemento.css("fontSize", parseInt(fonte) - 1);
    }
}
</script>



	<div id="espacamento" style="padding: 10px; align: center">
		<div class="col-sm-2">
			<button type="button" class="btn" title="Aumentar zoom"
				onClick="fonte('a');">A +</button>

			<button type="button" class="btn" title="Diminuir zoom"
				onClick="fonte('d');">a -</button>
		</div>


		<div class="col-sm-8" id="todoBody"
			style="font-family: 'Montserrat', sans-serif;">

			<div class="container" style="width: 100%; background-color: black;">
				<center>
					<h2 id="titulo_forum">Fórum</h2>
				</center>

			</div>
			<br>
			<br>
			<form action="filtro" method="post">

				<div class="col-sm-4"  >
					<input type="text" id="filtro" class="form-control" name="titulo"
						style="width: 100%; height: 40px;" maxlength="100"
						placeholder="Pesquisar..." />
				
				</div>
				<div class="col-sm-5" style="right:2%;" >
					<button style="height: 40px;  " type="submit" class="btn btn-primary">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</form>
			<div class="col-sm-1" style="left:8%;" >
				<button class="btn btn-primary"  data-toggle="modal"
					data-target="#modalPublicar"
					style="height: 40px; font-size: 17px; width: 180px; background-color: #555555; color: white;">Criar Publicação</button>
			</div>

			<br> <br>
			<br>
			<br>

			<div class="row" style="font-family: 'Montserrat', sans-serif">

				<div class="col-sm-13">

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
														test="${usuarioLogado.nivel_acesso == 'admSup'}">

														<button type="button" class="btn btn-danger"
															data-toggle="modal" data-target="#modalExcluir">Excluir</button>

													</c:if>
													<c:if
														test="${usuarioLogado.nivel_acesso == 'adm' }">

														<button type="button" class="btn btn-danger"
															data-toggle="modal" data-target="#modalExcluir">Excluir</button>

													</c:if>

												</c:otherwise>

											</c:choose>
										</div>


										<td>Tema: ${publicacao.tema.tema}</td>
										<br>
										<td><b>${publicacao.usuario.nome}</b></td>
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
													style="background-color: #555555; color: white">Ver
													Comentários</button></td> <br> <br>

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
											<form action="publicarEdit"
												id="formModalPublicarEdit${publicacao.id}" method="post">

												<input type="hidden" id="idPublicacaoEdit${publicacao.id}"
													name="idPublicacaoEdit" value="${publicacao.id }">
												<input type="hidden" id="idPublicarEdit${publicacao.id}"
													name="usuarioPubEdit" value="${publicacao.usuario.id }">
												<div class="form-group">
													<label for="inputTema">Tema da Publicação:</label> <select
														id="inputTemaEdit${publicacao.id}" name="TemaEdit">
														<option value="0">Selecionar</option>
														<c:forEach items="${listaTema}" var="tema">
															<option class="form-control" required="required"
																<c:if test="${tema.id eq publicacao.tema.id}">selected="selected"</c:if>
																value="${tema.id}">${tema.tema}</option>
														</c:forEach>
													</select>
												</div>


												<div class="form-group">

													<label for="inputTitulo">Titulo:</label> <input type="text"
														id="inputTituloEdit${publicacao.id}" class="form-control"
														name="tituloEdit" style="width: 100%;"
														value="${publicacao.titulo }" />
												</div>

												<!-- ESSE AQUIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII -->
												<div class="form-group">
													<textarea class="form-control" rows="5"
														form="formModalPublicarEdit${publicacao.id}"
														name="textAreaPublicarEdit"
														id="conteudoEdit${publicacao.id}" style="resize: none;">${publicacao.conteudo}</textarea>
												</div>

												<button type="submit" class="btn btn-primary"
													style="background-color: #555555" data-toggle="tooltip">Enviar</button>



											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- /miOdal EDIATAR -->

<!-- validacao editar publicacao -->
<script>
$(document) 
.ready(
		function() {

			$("#formModalPublicarEdit${publicacao.id}")
					.validate(
							{
								rules : {
									TemaEdit: {
										required : true,
										min:1
										
									},
									
									tituloEdit: { 
										required : true,
										maxlength : 300
									},
									
									textAreaPublicarEdit: {
										required : true,
										maxlength : 4000
									}
								
								
								
								
								},
								messages : {
									TemaEdit: {
										required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
										min: "<div class='alert alert-danger alert-dismissible fade in' style=''>Selecione um Tema</div>"
									},
									
									tituloEdit: {
										required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
										maxlength :"<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter no máximo 300 letras</div>"
									},
									
									
									textAreaPublicarEdit: {
										required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
										maxlength :"<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter no máximo 4000 letras</div>"
									}
								
									
								
								}
								
									
									
									
									
								
							});
			
		});

</script>



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

							<!-- Modal comentario -->
							<div class="modal fade" id="modalComentario${ publicacao.id}"
								role="dialog">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h2 class="modal-title">Comentários</h2>
										</div>
										<div class="modal-body">
											<table border="0" style="width: 100%;">

												<c:forEach var="comentario" items="${listaComentario}">

													<c:if test="${comentario.publicacao.id == publicacao.id}">
														<tr>
															<td><br> <br> <br></td>
															<td><b>${comentario.usuario.nome }</b></td>

															<!-- Data que comentário foi postado -->

															<td><fmt:formatDate value="${comentario.data}"
																	pattern="dd/MM/yyyy" /> <br> <fmt:formatDate
																	value="${comentario.data}" pattern="HH:mm:ss" /></td>
<td>
															<div class="btn-group btn-group-xs" style="float: right;">
																<c:choose>
																	<c:when
																		test="${comentario.usuario.id == usuarioLogado.id}">
																		<!-- Opção de apagar o comentário -->
																		<button type="button" class="btn btn-primary"
																			data-toggle="modal"
																			data-target="#modalEditComent${publicacao.id}${comentario.id}">Editar</button>
																		<button type="button" class="btn btn-danger"
																			data-toggle="modal"
																			data-target="#modalExcluirComent${publicacao.id}${comentario.id}">Excluir</button>

																	</c:when>
																	<c:otherwise>
												
																		
																		<c:if
																			test="${usuarioLogado.nivel_acesso == 'admSup'}">
																			<!-- Opção de apagar o comentário -->
																			                                                                 
																			<button type="button" class="btn btn-danger"                     
																				data-toggle="modal"
																				data-target="#modalExcluirComent${comentario.id}"
																				onclick="apagarComentario(${comentario.id})">Excluir</button>
																		</c:if>
																		<c:if
																			test="${usuarioLogado.nivel_acesso == 'adm'}">
																			<!-- Opção de apagar o comentário -->
																			                                                                 
																			<button type="button" class="btn btn-danger"                     
																				data-toggle="modal"
																				data-target="#modalExcluirComent${comentario.id}"
																				onclick="apagarComentario(${comentario.id})">Excluir</button>
																		</c:if>
															
															</c:otherwise>
															</c:choose>
																</div>
															</td>
														</tr>

														<tr>
															<!-- O comentário em si está aqui -->
															<td colspan="6"><p>${comentario.conteudo}</p> <!-- Colocando uma linha para separar cada comentário -->
																<hr /></td>
														</tr>
													</c:if>


													<!-- Modal excluir comementario -->

													<div class="modal fade"
														id="modalExcluirComent${publicacao.id}${comentario.id}"
														role="dialog">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header"></div>
																<div class="modal-body">
																	<center>
																		<h4>
																			<p>Você tem certeza que deseja excluir?</p>
																		</h4>
																		<p>${comentario.id}</p>
																		<a method="post"
																			href="deleteComent?id=${comentario.id}"><button
																				type="button" class="btn btn-danger">Sim</button></a>
																		<button type="button" class="btn btn-danger"
																			data-dismiss="modal">Não</button>
																	</center>
																</div>
																<div class="modal-footer"></div>
															</div>
														</div>
													</div>
													<!-- Modal Editar comentario -->

													<div class="modal fade"
														id="modalEditComent${publicacao.id}${comentario.id}"
														role="dialog">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<h4>Editar Comentário</h4>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																</div>
																<div class="modal-body">
																	<form action="comentarEdit"
																		id="formComentEdit${publicacao.id}${comentario.id}"
																		method="post">

																		<input type="hidden"
																			id="idComent${publicacao.id}${comentario.id}"
																			name="id" value="${comentario.id}"> <input
																			type="hidden"
																			id="idUsuComentEdit${publicacao.id}${comentario.id} "
																			name="idUsuComentEdit" value="${usuarioLogado.id}" />
																		
																		<input type="hidden"
																			id="idPubComentEdit${publicacao.id}${comentario.id}"
																			name="idPubComentEdit" value="${publicacao.id}" />

																		
																		<textarea style="resize: none;" rows="5" cols="5"
																			class="form-control" 
																			form="formComentEdit${publicacao.id}${comentario.id}"
																			
																			name="conteudoComentEdit"
																			placeholder="Escreva um comentário ">${comentario.conteudo}</textarea>

																		<br> <input class="btn btn-primary" type="submit"
																			value="Enviar Comentário"
																			style="float: right; background-color: #555555;">
																		<br> <br>

																	</form>




																</div>
																<div class="modal-footer"></div>
															</div>
														</div>
													</div>



<!--  Validacao editar comentario -->

<script> /*
$(document) 
.ready(
		function() {  

			$("#formComentEdit${publicacao.id}${comentario.id}")
					.validate(
							{
								rules : {
									conteudoComentEdit: {
										required : true,
										maxlength : 300
									}
									
									
								
								
								},
								messages : {
									conteudoComentEdit: {
										required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
										maxlength :"<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter no máximo 300 letras</div>"
									}
								
									
								
								}
								
									
									
									
									
								
							});
			
		});*/</script>



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
															method="post">

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


<!--  validaçao do comentario -->
<script>
	$(document) 
			.ready(
					function() {

						$("#formComent${publicacao.id}")
								.validate(
										{
											rules : {
												conteudoComent: {
													required : true,
													maxlength : 300
												}
												
												
											
											
											},
											messages : {
												conteudoComent: {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													maxlength :"<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter no máximo 300 letras</div>"
												}
											
												
											
											}
											
												
												
												
												
											
										});
						
					});
	
	
	
</script>



						</c:forEach>

					</div>
				</div>
			</div>
		</div>

		<div class="col-sm-2"></div>

	</div>

	<!-- Modal para perfil no fórum 
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
						<br />
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
-->
	</div>
	</div>
</body>
</html>

