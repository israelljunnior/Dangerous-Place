<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	media="all">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	media="all"></script>

<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/additional-methods.min.js"></script>

<title>Menu</title>

<style type="text/css">
.names {
	font-family: 'Montserrat', sans-serif;
	font-size: 16px;
	color: white;
}
</style>
<body>


<script type="text/javascript"> var tam = 15;
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

	<nav class="navbar-inverse names">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">DangerousPlace</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="/PP2-DangerousPlace/home">Home</a></li>
				<li><a href="/PP2-DangerousPlace/forum">Fórum</a></li>
				<li><a href="/PP2-DangerousPlace/gerandoRelatorio">Gerar Relatório</a></li>
				<li><a href="#">Sobre nós</a></li>
				<button onClick="fonte('a');">+</button>
				<button onClick="fonte('d');">-</button>

				<c:if test="${usuarioLogado.nivel_acesso == 'admSup'}">
					<li><a type="submit" data-toggle="modal"
						data-target="#modalCadastroADM">Cadastrar ADM</a></li>
					<li><a href="#">Inserir Dados</a></li>

				</c:if>
				<c:if test="${usuarioLogado.nivel_acesso == 'adm'}">

					<li><a href="#">Inserir Dados</a></li>
					</li>

				</c:if>



			</ul>
			<ul class="nav navbar-nav navbar-right">
				<!-- <li><a href="/PP2-DangerousPlace/usuario/login " data-toggle="tooltip"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    	<li><a href="/PP2-DangerousPlace/usuario/cadastro" data-toggle="tooltip"><span class="glyphicon glyphicon-user"></span> Cadastre-se</a></li> -->


				<c:choose>
					<c:when test="${not empty usuarioLogado.nome}">
						<li><a type="submit" data-toggle="modal"
							data-target="#modalAlterarDados">Bem Vindo,
								${usuarioLogado.nome}</a></li>
						<li><a href="<%=request.getContextPath()%>/logout">Sair</a></li>
					</c:when>
					<c:otherwise>
						<li><a type="submit" data-toggle="modal"
							data-target="#modalLogin"><span
								class="glyphicon glyphicon-log-in"></span> Login</a></li>
						<li><a type="submit" data-toggle="modal"
							data-target="#modalCadastro"><span
								class="glyphicon glyphicon-user"></span> Cadastre-se</a></li>
					</c:otherwise>
				</c:choose>



			</ul>
		</div>
	</nav>

	<c:if test="${msg != null }">
		<script type="text/javascript">
			$(document).ready(function() {
				$('#modalLogin').modal('show');
			});
		</script>
	</c:if>


	<!-- Modal Login -->
	<div class="modal fade" id="modalLogin" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" media="all" data-backdrop="static">
		<div class="modal-dialog modal-xs" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<center>
						<h3>Login</h3>
						<c:if test="${msg ne null}">
							<div class="alert alert-danger" style="width: 80%;">${msg}
							</div>
						</c:if>
					</center>
				</div>
				<div class="modal-body">
					<form action="efetuarLogin" method="post">

						<center>

							<div class="form-group">
								<label for="email">Email:</label> <input type="text"
									id="emailLogin" class="form-control" name="email"
									style="width: 500px;" placeholder="Digite seu Email." />
							</div>
							<div class="form-group">
								<label for="senha">Senha:</label> <input type="password"
									id="senhaLogin" class="form-control" name="senha"
									style="width: 500px;" placeholder="Digite sua senha." />
							</div>

							<div class="btn-group btn-group-lg" style="text-align: center";>
								<button type="reset" class="btn btn-danger"
									style="background-color: #B22222; color: white"
									data-toggle="tooltip">Cancelar</button>
								</a>
							</div>
							<div class="btn-group btn-group-lg" style="text-align: center";>
								<button type="submit" class="btn btn-primary"
									style="background-color: #555555" data-toggle="tooltip">Entrar</button>
								</a>
							</div>
						</center>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal cadastro -->
	<div class="modal fade" id="modalCadastro" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" data-backdrop="static">
		<div class="modal-dialog modal-xs" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<center>
						<h3>Cadastre-se</h3>
					</center>
				</div>
				<div class="modal-body">

					<form action="save" method="post" id="formCadastro">
						<center>

							<div class="form-group">
								<label for="nome">Nome:</label> <input type="text" id="nome"
									class="form-control" name="nome" style="width: 500px;"
									placeholder="Digite seu nome." />
							</div>
							<div class="form-group">
								<label for="email">Email:</label> <input type="text" id="email"
									class="form-control" name="email" style="width: 500px;"
									placeholder="Digite seu Email..." />
							</div>
							<div class="form-group">
								<label for="senha">Senha:</label> <input type="password"
									id="senha" class="form-control" name="senha"
									style="width: 500px;" placeholder="Digite sua senha..." />
							</div>
							<div class="form-group">
								<label for="repetirSenha">Repita a senha:</label> <input
									type="password" id="repetirSenha" class="form-control"
									name="repetirSenha" style="width: 500px;"
									placeholder="Repita sua senha..." />
							</div>
							<div class="form-group">
								<label for="inputSexo">Sexo:</label> <select name="selectSexo">
									<option id="inputSexo" class="form-control" required="required"
										type="radio" value="F" name="sexo">Feminino</option>
									<br />
									<option type="radio" value="M" name="sexo">Masculino</option>
									<br />
								</select>
							</div>

							<div class="form-group">
								<label for="inputEndereco">CEP:</label> <input type="text"
									id="inputDescricao" class="form-control" name="endereco"
									style="width: 500px;" placeholder="Digite seu CEP" />
							</div>
							<input type="hidden" name="nivel_acesso" value="usuario">

							<button type="reset" class="btn btn-danger"
								style="background-color: #B22222; color: white">Cancelar</button>
							&nbsp;
							<button type="submit" class="btn btn-primary"
								style="background-color: black; color: white; margin-left: 10px">&nbsp;
								Inserir &nbsp;</button>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal cadastroADM -->
	<%-- <div class="modal fade" id="modalCadastroADM" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
		<div class="modal-dialog modal-xs" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<center>
						<h3>Cadastre</h3>
					</center>
				</div>
				<div class="modal-body">
					<form action="saveADM" method="post" id="formCadastro">
						<center>

							<div class="form-group">
								<label for="nome">Nome:</label> <input type="text" id="nome"
									class="form-control" name="nome" style="width: 500px;"
									placeholder="Digite seu nome." />
							</div>
							<div class="form-group">
								<label for="email">Email:</label> <input type="text" id="email"
									class="form-control" name="email" style="width: 500px;"
									placeholder="Digite seu Email..." />
							</div>
							<div class="form-group">
								<label for="senha">Senha:</label> <input type="password"
									id="senha" class="form-control" name="senha"
									style="width: 500px;" placeholder="Digite sua senha..." />
							</div>
							<div class="form-group">
								<label for="repetirSenha">Repita a senha:</label> <input
									type="password" id="repetirSenha" class="form-control"
									name="repetirSenha" style="width: 500px;"
									placeholder="Repita sua senha..." />
							</div>
							<div class="form-group">
								<label for="inputSexo">Sexo:</label> <select name="selectSexo">
									<option id="inputSexo" class="form-control" required="required"
										type="radio" value="F" name="sexo">Feminino</option>
									<br />
									<option type="radio" value="M" name="sexo">Masculino</option>
									<br />
								</select>
							</div>

							<div class="form-group">
								<label for="inputEndereco">CEP:</label> <input type="text"
									id="inputDescricao" class="form-control" name="endereco"
									style="width: 500px;" placeholder="Digite seu CEP" />
							</div>
							<div class="form-group">
								<label for="inputNivel_acesso">Nivel de Acesso:</label> <select
									name="selectNivel_acesso">
									<option id="inputSexo" class="form-control" required="required"
										type="radio" value="usuario" name="nivel_acesso">usuario</option>
									<br />
									<option type="radio" value="adm" name="nivel_acesso">adm</option>
									<br />
								</select>
							</div>

							<button type="reset" class="btn btn-danger"
								style="background-color: #B22222; color: white">Cancelar</button>
							&nbsp;
							<button type="submit" class="btn btn-primary"
								style="background-color: black; color: white; margin-left: 10px">&nbsp;
								Inserir &nbsp;</button>
					</form>
				</div>
			</div>
		</div>
	</div> --%>



	<!-- Modal AlterarDados -->
	<div class="modal fade" id="modalAlterarDados" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" media="all"
		data-backdrop="static">
		<div class="modal-dialog modal-xs" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<center>
						<h3>Alterar Dados</h3>
					</center>
				</div>
				<div class="modal-body">


					<form action="update" id="alterarDados" method="post">
						<fieldset class="modais">
							<center>

								<input type="hidden" name="id" value="${usuarioLogado.id}">

								<div class="form-group">
									<label for="inputNome">Nome:</label> <input type="text"
										id="inputNomeAlterar" class="form-control"
										name="inputNomeAlterar" value="${usuarioLogado.nome}"
										style="width: 500px;" />
								</div>
								<div class="form-group">
									<label for="inputEmail">Email:</label> <input type="text"
										id="inputEmailAlterar" class="form-control"
										name="inputEmailAlterar" value="${usuarioLogado.email}"
										style="width: 500px;" /> <label style="display: none;"
										id="mensagem">Este e-mail já existe</label>
								</div>
								<div class="form-group">
									<label for="inputSenha">Senha:</label> <input type="password"
										id="inputSenhaAlterar" class="form-control"
										name="inputSenhaAlterar" value="${usuarioLogado.senha}"
										style="width: 500px;"
										title="Deve ser Preenchido com pelo menos 8 caracteres, mínimo uma letra minúscula, uma letra Maiúsculo e um número" />
								</div>

								<div class="form-group">
									<label for="inputRepetirSenhaAlterar">Repita a senha:</label> <input
										type="password" id="inputRepetirAlterar" class="form-control"
										name="inputSenhaRepetirAlterar" style="width: 500px;"
										placeholder="Repita sua senha..." />
								</div>
								<div class="form-group">
									<label for="inputSexo">Sexo:</label> <select name="selectSexo">
										<option id="inputSexoAlterarF" class="form-control"
											type="radio" value="F" name="sexo">Feminino</option>
										<br />
										<option id="selectSexoAlterarM" type="radio" value="M"
											name="sexo">Masculino</option>
										<br />

									</select>
								</div>

								<div class="form-group">
									<label for="inputEndereco">CEP:</label> <input type="text"
										id="inputEnderecoAlterar" class="form-control"
										name="inputEnderecoAlterar" value="${usuarioLogado.endereco}"
										style="width: 500px;" />
								</div>

								<c:if test="${usuarioLogado.nivel_acesso == 'adm'}">
									<input type="hidden" name="nivel_acesso" value="adm">
								</c:if>

								<c:if test="${usuarioLogado.nivel_acesso == 'usuario'}">
									<input type="hidden" name="nivel_acesso" value="usuario">
								</c:if>

								<c:if test="${usuarioLogado.nivel_acesso == 'admSup'}">
									<input type="hidden" name="nivel_acesso" value="admSup">
								</c:if>

								<button type="reset" class="btn btn-danger"
									style="background-color: #B22222; color: white">Cancelar</button>
								&nbsp;

								<button type="submit" class="btn btn-primary"
									style="background-color: black; color: white; margin-left: 10px"
									onClick="validarSenha()">&nbsp; Inserir&nbsp;</button>
						</fieldset>
					</form>

				</div>
			</div>
		</div>
	</div>

	<!-- modal publicar -->

	<div class="modal fade" id="modalPublicar" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" media="all" data-backdrop="static">
		<div class="modal-dialog modal-xs" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<center>
						<h3>Publicar</h3>
					</center>
				</div>
				<div class="modal-body">
					<form action="publicar" id="formModalPublicar"method="post">
					
					
						<input type="hidden" id="idPublicar" name="usuario" value="${usuarioLogado.id }">
						<div class="form-group">
								<label for="inputTema">Tema da Publicação:</label> <select id="inputTema" name="Tema">
									<option  class="form-control" required="required"
										type="radio" value="Assaltos" name="Assaltos">Assaltos</option>
									<br />
									<option class="form-control" required="required" type="radio" value="Acidentes de Trânsito" name="Acidentes de Trânsito">Acidentes de Trânsito</option>
									<br />
								</select>
							</div>
						
						
						<div class="form-group">
					
							<label for="inputTema">Titulo:</label> <input type="text"
								id="inputTitulo" class="form-control" name="titulo"
								style="width: 100%;" placeholder="Digite o titulo de sua publicação" />
						</div>


						<div class="form-group">
							<textarea class="form-control" rows="5" form="formModalPublicar" name="textAreaPublicar" id="conteudo"
								placeholder="digite aqui o conteúdo de sua publicação"
								style="resize: none;"></textarea>
						</div>
						<button type="submit" class="btn btn-primary"
							style="background-color: #555555" data-toggle="tooltip">Enviar</button>
					


					</form>
				</div>
			</div>
		</div>
	</div>



</body>


<script>
/*	$(document) 
			.ready(
					function() {

						$("#formCadastro")
								.validate(
										{
											rules : {
												nome : {
													required : true,
													minlength : 2,
													maxlength : 50,
													pattern : /^[a-zA-Z\s]+$/
												},
												email : {
													required : true,
													maxlength : 130,
													email : true,
													remote : {
														url : "check",
														type : "post",
														data : {
															email : function() {
																return $(
																		"#email")
																		.val();
															}
														}
													}
												},
												senha : {
													required : true,
													minlength : 2,
													maxlength : 10,
													pattern : /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/,
												},

												repetirSenha : {
													required : true,
													minlength : 2,
													maxlength : 10,
													equalTo : "#senha"
												},
												endereco : {
													required : true,
													pattern : /[0-9]{8}/,

												}

											},
											messages : {
												nome : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													minlength : "<div class='alert alert-danger alert-dismissible fade in' style=''>É necessário no mínimo duas letras</div>",
													maxlength : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter no máximo 50 letras</div>",
													pattern : "<div class='alert alert-danger alert-dismissible fade in' style=''>É necessário Conter Somente Letras</div>"
												},
												email : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													maxlength : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve no máximo 130 caracteres</div>",
													email : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter o formato 'exemplo@exemplo.com'</div>",
													remote : "<div class='alert alert-danger alert-dismissible fade in' style=''>Email não Está disponível</div>"
												},
												senha : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													pattern : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter pelo menos 1 letra maiúscula, 1 letra minúscula, numeros e pelo menos 8 caracteres. </div>",
												},
												repetirSenha : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													equalTo : "<div class='alert alert-danger alert-dismissible fade in' style=''>As duas senhas devem ser iguais</div>",
												},
												endereco : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													pattern : "<div class='alert alert-danger alert-dismissible fade in' style=''> Deve Conter Formato Válido</div>"
												}

											}

										});

						//Validação Login

					}); */

	$(document)
			.ready(
					function() {
						$("#alterarDados")
								.validate(
										{

											rules : {
												inputNomeAlterar : {
													required : true,
													minlength : 2,
													maxlength : 50,
													pattern : /^[a-zA-Z\s]+$/
												},
												inputEmailAlterar : {
													required : true,
													maxlength : 130,
													email : true,
												},
												inputSenhaAlterar : {
													required : true,
													minlength : 2,
													maxlength : 10,
													pattern : /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/,
												},

												inputSenhaRepetirAlterar : {
													required : true,
													minlength : 2,
													maxlength : 10,
													equalTo : "#inputSenhaAlterar"
												},
												inputEnderecoAlterar : {
													required : true,
													pattern : /[0-9]{8}/,

												}

											},
											messages : {
												inputNomeAlterar : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													minlength : "<div class='alert alert-danger alert-dismissible fade in' style=''>É necessário no mínimo duas letras</div>",
													maxlength : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter no máximo 50 letras</div>",
													pattern : "<div class='alert alert-danger alert-dismissible fade in' style=''>É necessário Conter Somente Letras</div>"
												},
												inputEmailAlterar : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													maxlength : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve no máximo 130 caracteres</div>",
													email : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter o formato 'exemplo@exemplo.com'</div>",
													remote : "<div class='alert alert-danger alert-dismissible fade in' style=''>Email não Está disponível</div>"
												},
												inputSenhaAlterar : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													pattern : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter pelo menos 1 letra maiúscula, 1 letra minúscula, numeros e pelo menos 8 caracteres. </div>",
												},
												inputEnderecoAlterar : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													equalTo : "<div class='alert alert-danger alert-dismissible fade in' style=''>As duas senhas devem ser iguais</div>",
												},
												inputEnderecoAlterar : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													pattern : "<div class='alert alert-danger alert-dismissible fade in' style=''> Deve Conter Formato Válido</div>"
												}

											}
										});

					});
</script>
