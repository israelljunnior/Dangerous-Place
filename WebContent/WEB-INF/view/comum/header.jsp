<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	src="<%=request.getContextPath()%>/resources/jquery-validation-1.17.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/jquery-validation-1.17.0/dist/additional-methods.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/localization/messages_pt_BR.js"></script>

<title>Menu</title>

<style type="text/css">
.names {
	font-family: 'Montserrat', sans-serif;
	font-size: 16px;
	color: white;
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse names">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">DangerousPlace</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="/PP2-DangerousPlace/home">Home</a></li>
			<li><a href="#">Mapa</a></li>
			<li><a href="/PP2-DangerousPlace/forum">Fórum</a></li>
			<li><a href="#">Sobre nós</a></li>

			<c:if test="${usuarioLogado.nivel_acesso == 'admSup'}">
				<li><a type="submit" data-toggle="modal"
						data-target="#modalCadastroADM">Cadastrar ADM</a></li>
				<li><a href="#">Inserir Dados</a></li>
				
                                    </c:if>
             <c:if test="${usuarioLogado.nivel_acesso == 'adm'}">
				
				<li><a href="#">Inserir Dados</a></li></li>
				
                                    </c:if>
	
    
     
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<!-- <li><a href="/PP2-DangerousPlace/usuario/login " data-toggle="tooltip"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    	<li><a href="/PP2-DangerousPlace/usuario/cadastro" data-toggle="tooltip"><span class="glyphicon glyphicon-user"></span> Cadastre-se</a></li> -->


			<c:choose>
				<c:when test="${not empty usuarioLogado.nome}">
					<li><a href="/PP2-DangerousPlace/usuario/alterarDados">Bem Vindo, ${usuarioLogado.nome}</a></li>
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
						<p>${msg}</p>
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
	<div class="modal fade" id="modalCadastroADM" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" data-backdrop="static">
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
							<div class="form-group">
								<label for="inputNivel_acesso">Nivel de Acesso:</label> <select name="SelectNivel_acesso">
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
	</div>



</body>


<script>
	$(document)
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

					});
</script>