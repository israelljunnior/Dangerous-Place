<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="http://www.chartjs.org/dist/2.7.2/Chart.bundle.js"></script>
<script src="http://www.chartjs.org/samples/latest/utils.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://rawgit.com/RobinHerbots/jquery.inputmask/3.x/dist/jquery.inputmask.bundle.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- google -->

<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="370392271351-agk25s6n5142efjgpi1ec0ms0mdpln9k.apps.googleusercontent.com">

<!-- /google -->
<!-- jspdf  -->
<script src="<%=request.getContextPath()%>/resources/jspdf.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/jspdf.debug.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.3.4/jspdf.plugin.autotable.js"></script>
<!-- /jspdf -->

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

div {
	font-family: 'Montserrat', sans-serif;
}

#inverterCores {
	font-size: 15px;
	color: #FFF;
	position: fixed;
	z-index: 123456789;
	padding: 5px 10px;
	background: rgba(60, 60, 60, .5);
	top: 50px;
	right: 10px;
}

.inverter {
	filter: invert(100%);
	-webkit-filter: invert(100%);
}

body.inverter {
	background: black;
}
</style>

<script>
	$(window).ready(function() {
		$("#inverterCores").click(function invertColors() {
			$("body").toggleClass("inverter");
		});
	});
</script>
<body>
	<script
		src="http://s.codigofonte.com.br/wp-content/js/codigofonte-bar.js"></script>
	<a id="inverterCores" href="#"><span>Inverter Cores</span></a>

	<nav class="navbar-inverse names">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/PP2-DangerousPlace/home">DangerousPlace</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="/PP2-DangerousPlace/home">Home</a></li>
				<li><a href="/PP2-DangerousPlace/forum">F�rum</a></li>

				<li><a href="/PP2-DangerousPlace/sobreNos">Sobre n�s</a></li>

				<c:if test="${usuarioLogado.nivel_acesso == 'admSup'}">
					<li><a type="submit" data-toggle="modal"
						data-target="#modalCadastroADM">Cadastrar ADM</a></li>
					

				</c:if>
				<c:if test="${usuarioLogado.nivel_acesso == 'adm'}">

					
					</li>

				</c:if>



			</ul>
			<ul class="nav navbar-nav navbar-right">
				<!-- <li><a href="/PP2-DangerousPlace/usuario/login " data-toggle="tooltip"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    	<li><a href="/PP2-DangerousPlace/usuario/cadastro" data-toggle="tooltip"><span class="glyphicon glyphicon-user"></span> Cadastre-se</a></li> -->


				<c:choose>
					<c:when test="${not empty usuarioLogado.nome}">
						<li><a data-toggle="modal" data-target="#modalPerfil">Bem
								Vindo, ${usuarioLogado.nome}</a></li>
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

	<c:if test="${msgNaoEncontrado != null }">
		<script type="text/javascript">
			$(document).ready(function() {
				$('#modalLogin').modal('show');
			});
		</script>
	</c:if>

	<c:if test="${msgPrecisaLogin != null }">
		<script type="text/javascript">
			$(document).ready(function() {
				$('#modalLogin').modal('show');
			});
		</script>
	</c:if>




	<!-- Modal Login -->
	<div class="modal fade" id="modalLogin" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" media="all" data-backdrop="static">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<center>
						<h3>
							<b>Login</b>
						</h3>
						<c:if test="${msgNaoEncontrado ne null}">
							<div class="alert alert-danger" style="width: 80%;">${msgNaoEncontrado}
							</div>
						</c:if>
						<c:if test="${msgPrecisaLogin ne null}">
							<div class="alert alert-danger" style="width: 80%;">${msgPrecisaLogin}
							</div>
						</c:if>
					</center>

				</div>
				<div class="modal-body">
					<form action="efetuarLogin" method="post">
						<center>

							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span> <input id="emailLogin"
									type="text" class="form-control" name="email"
									placeholder="Email">
							</div>
							<br>

							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span> <input id="senhaLogin"
									type="password" class="form-control" name="senha"
									placeholder="Senha">
							</div>
							<br> <br>


							<div class="btn-group btn-group" style="text-align: center";>
								<button type="submit" class="btn btn-danger"
									data-toggle="tooltip">Entrar</button>
								</a>
							</div>
							<br> <br> <a href="#modalCadastro" data-toggle="modal"
								data-target="#modalCadastro">Sem conta? Se cadastra aqui</a>

						</center>
						<br>
						<!--  	<div class="g-signin2" data-onsuccess="onSignIn"></div> -->

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
									class="form-control" name="nome" style="width: 85%;"
									placeholder="Digite seu nome." />
							</div>
							<div class="form-group">
								<label for="email">Email:</label> <input type="text" id="email"
									class="form-control" name="email" style="width: 85%;"
									placeholder="Digite seu Email..." />
							</div>
							<div class="form-group">
								<label for="senha">Senha:</label> <input type="password"
									id="senha" class="form-control" name="senha"
									style="width: 85%;" placeholder="Digite sua senha..." />
							</div>
							<div class="form-group">
								<label for="repetirSenha">Repita a senha:</label> <input
									type="password" id="repetirSenha" class="form-control"
									name="repetirSenha" style="width: 85%;"
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
									id="cep" class="form-control" name="endereco"
									style="width: 85%;" placeholder="Digite seu CEP" />
							</div>

							

							<input type="hidden" name="nivel_acesso" value="usuario">

							<button type="reset" class="btn btn-danger"
								style="background-color: #B22222; color: white"
								data-dismiss="modal" aria-label="Close">Cancelar</button>
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
	<div class="modal fade" id="modalCadastroADM" tabindex="-1"
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
					<form action="saveADM" method="post" id="formCadastroAdm">
						<center>

							<div class="form-group">
								<label for="nome">Nome:</label> <input type="text" id="nomeAdm"
									class="form-control" name="nomeAdm" style="width: 500px;"
									placeholder="Digite seu nome." />
							</div>
							<div class="form-group">
								<label for="email">Email:</label> <input type="text"
									id="emailAdm" class="form-control" name="emailAdm"
									style="width: 500px;" placeholder="Digite seu Email..." />
							</div>
							<div class="form-group">
								<label for="senha">Senha:</label> <input type="password"
									id="senhaAdm" class="form-control" name="senhaAdm"
									style="width: 500px;" placeholder="Digite sua senha..." />
							</div>
							<div class="form-group">
								<label for="repetirSenha">Repita a senha:</label> <input
									type="password" id="repetirSenhaAdm" class="form-control"
									name="repetirSenhaAdm" style="width: 500px;"
									placeholder="Repita sua senha..." />
							</div>
							<div class="form-group">
								<label for="inputSexo">Sexo:</label> <select
									name="selectSexoAdm">
									<option id="inputSexo" class="form-control" required="required"
										type="radio" value="F" name="sexo">Feminino</option>
									<br />
									<option type="radio" value="M" name="sexo">Masculino</option>
									<br />
								</select>
							</div>

							<div class="form-group">
								<label for="inputEndereco">CEP:</label> <input type="text"
									id="inputEnderecoAdm" class="form-control" name="enderecoAdm"
									style="width: 500px;" placeholder="Digite seu CEP" />
							</div>
							<div class="form-group">
								<label for="inputNivel_acesso">Nivel de Acesso:</label> <select
									name="selectNivel_acessoAdm">
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

	<!-- Modal Alterar Senha -->
	<div class="modal fade" id="modalAlterarSenha" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" media="all"
		data-backdrop="static">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<center>
						<h3>
							<b>Alterar Senha</b>
						</h3>
					</center>
				</div>
				<div class="modal-body">

					<form action="updateSenha" method="post" id="updateSenha">

						<div class="form-group">
							<input type="hidden" name="id" value="${usuarioLogado.id}">
							<input type="hidden" name="nome" value="${usuarioLogado.nome }">
							<input type="hidden" name="email" value="${usuarioLogado.email }">
							<input type="hidden" name="sexo" value="${usuarioLogado.sexo }">
							<input type="hidden" name="endereco"
								value="${usuarioLogado.endereco }"> <input type="hidden"
								name="nivel_acesso" value="${usuarioLogado.nivel_acesso }">
							<label for="inputSenha">Senha Atual:</label> <input
								type="password" id="inputSenhaAtual" class="form-control"
								name="inputSenhaAtual" />
						</div>

						<div class="form-group">
							<label for="inputNewSenha">Nova Senha:</label> <input
								type="password" id="inputNewSenha" class="form-control"
								name="senha" />
						</div>
						<div class="form-group">
							<label for="inputNewSenhaConfirm">Confirmar Nova Senha:</label> <input
								type="password" id="inputNewSenhaConfirm" class="form-control"
								name="senhaConfirm" />
						</div>
						<center>
							<button type="submit" class="btn btn-danger">Alterar</button>
						</center>
					</form>



				</div>


			</div>
		</div>
	</div>


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

								<input type="hidden" name="senha" value="${usuarioLogado.senha}">


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
										id="mensagem">Este e-mail j� existe</label>
								</div>



								<div class="form-group">
									<label for="inputSexo">Sexo:</label> <select name="selectSexo">

										<option id="inputSexoAlterarF" class="form-control"
											<c:if test="${usuarioLogado.sexo eq 'F' }">selected="selected"</c:if>
											type="radio" value="F" name="sexo">Feminino</option>

										<br />
										<option id="selectSexoAlterarM" type="radio" value="M"
											<c:if test="${usuarioLogado.sexo eq 'M' }">selected="selected"</c:if>
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



								<button type="submit" class="btn btn-danger"
									style="color: white; margin-left: 10px"
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
					<form action="publicar" id="formModalPublicar" method="post">


						<input type="hidden" id="idPublicar" name="usuario"
							value="${usuarioLogado.id }">
						<div class="form-group">
							<label for="inputTema">Tema da Publica��o:</label> <select
								id="inputTema" name="Tema">
								<option value="0">Selecionar</option>
								<c:forEach items="${listaTema}" var="tema">

									<option class="form-control" required="required"
										value="${tema.id}">${tema.tema}</option>

								</c:forEach>
							</select>
						</div>


						<div class="form-group">

							<label for="inputTema">Titulo:</label> <input type="text"
								id="inputTitulo" class="form-control" name="titulo"
								style="width: 100%;"
								placeholder="Digite o titulo de sua publica��o" />
						</div>


						<div class="form-group">
							<textarea class="form-control" rows="5" form="formModalPublicar"
								name="textAreaPublicar" id="conteudo"
								placeholder="digite aqui o conte�do de sua publica��o"
								style="resize: none;"></textarea>
						</div>
						<button type="submit" class="btn btn-primary"
							style="background-color: #555555" data-toggle="tooltip">Enviar</button>

					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal Perfil -->
	<div class="modal fade" id="modalPerfil" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" media="all" data-backdrop="static">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<center>
						<h3>
							<b>Perfil</b>
						</h3>
				</div>
				<div class="modal-body">



					<div class="card" style="width: 100%">
						<center>
							<c:if test="${usuarioLogado.sexo == 'M' }">
								<img class="card-img-top"
									src="https://www.w3schools.com/bootstrap4/img_avatar1.png"
									alt="Card image" style="width: 70%;">
							</c:if>
							<c:if test="${usuarioLogado.sexo == 'F' }">
								<img class="card-img-top"
									src="https://www.w3schools.com/bootstrap4/img_avatar5.png"
									alt="Card image" style="width: 70%;">
							</c:if>




							<div class="card-body">
								<h4 class="card-title">
									<b>${usuarioLogado.nome}</b>
								</h4>
								<c:if
									test="${usuarioLogado.nivel_acesso == 'admSup' or usuarioLogado.nivel_acesso == 'adm' }">
									<h5>Administrador</h5>
								</c:if>
								<c:if test="${usuarioLogado.nivel_acesso == 'usuario'}">
									<h5>Usuario</h5>
								</c:if>


								<div class="btn-group btn-group-xs">

									<button type="button" class="btn btn-danger"
										data-dismiss="modal" data-toggle="modal"
										data-target="#modalAlterarSenha">Alterar Senha</button>
									<button type="button" class="btn btn-primary"
										data-dismiss="modal" data-toggle="modal"
										data-target="#modalAlterarDados"
										Style="background-color: #555555;">Alterar Dados</button>

								</div>
						</center>
					</div>
				</div>


			</div>
		</div>
	</div>
	</div>




</body>
<script type="text/javascript">
$(document).ready(function() {

            function limpa_formul�rio_cep() {
                // Limpa valores do formul�rio de cep.
                $("#rua").val("");
                $("#bairro").val("");
                $("#cidade").val("");
            }
            
            //Quando o campo cep perde o foco.
            $("#cep").blur(function() {

                //Nova vari�vel "cep" somente com d�gitos.
                var cep = $(this).val().replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Express�o regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if(validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        $("#rua").val("...");
                        $("#bairro").val("...");
                        $("#cidade").val("...");

                        //Consulta o webservice viacep.com.br/
                        $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

                            if (!("erro" in dados)) {
                                //Atualiza os campos com os valores da consulta.
                                $("#rua").val(dados.logradouro);
                                $("#bairro").val(dados.bairro);
                                $("#cidade").val(dados.localidade);
                            } //end if.
                            else {
                                //CEP pesquisado n�o foi encontrado.
                                limpa_formul�rio_cep();
                                alert("CEP n�o encontrado.");
                            }
                        });
                    } //end if.
                    else {
                        //cep � inv�lido.
                        limpa_formul�rio_cep();
                        alert("Formato de CEP inv�lido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formul�rio.
                    limpa_formul�rio_cep();
                }
            });
        });

    </script>




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
													minlength : "<div class='alert alert-danger alert-dismissible fade in' style=''>� necess�rio no m�nimo duas letras</div>",
													maxlength : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter no m�ximo 50 letras</div>",
													pattern : "<div class='alert alert-danger alert-dismissible fade in' style=''>� necess�rio Conter Somente Letras</div>"
												},
												email : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													maxlength : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve no m�ximo 130 caracteres</div>",
													email : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter o formato 'exemplo@exemplo.com'</div>",
													remote : "<div class='alert alert-danger alert-dismissible fade in' style=''>Email n�o Est� dispon�vel</div>"
												},
												senha : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													pattern : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter pelo menos 1 letra mai�scula, 1 letra min�scula, numeros e pelo menos 8 caracteres. </div>",
												},
												repetirSenha : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													equalTo : "<div class='alert alert-danger alert-dismissible fade in' style=''>As duas senhas devem ser iguais</div>",
												},
												endereco : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													pattern : "<div class='alert alert-danger alert-dismissible fade in' style=''> Deve Conter Formato V�lido</div>"
												}

											}

										});

					});

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
													minlength : "<div class='alert alert-danger alert-dismissible fade in' style=''>� necess�rio no m�nimo duas letras</div>",
													maxlength : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter no m�ximo 50 letras</div>",
													pattern : "<div class='alert alert-danger alert-dismissible fade in' style=''>� necess�rio Conter Somente Letras</div>"
												},
												inputEmailAlterar : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													maxlength : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve no m�ximo 130 caracteres</div>",
													email : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter o formato 'exemplo@exemplo.com'</div>",
													remote : "<div class='alert alert-danger alert-dismissible fade in' style=''>Email n�o Est� dispon�vel</div>"
												},
												inputSenhaAlterar : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													pattern : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter pelo menos 1 letra mai�scula, 1 letra min�scula, numeros e pelo menos 8 caracteres. </div>",
												},
												inputEnderecoAlterar : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													equalTo : "<div class='alert alert-danger alert-dismissible fade in' style=''>As duas senhas devem ser iguais</div>",
												},
												inputEnderecoAlterar : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													pattern : "<div class='alert alert-danger alert-dismissible fade in' style=''> Deve Conter Formato V�lido</div>"
												}

											}
										});

					});

	$(document)
			.ready(
					function() {

						$("#formModalPublicar")
								.validate(
										{
											rules : {
												Tema : {
													required : true,
													min : 1

												},

												titulo : {
													required : true,
													maxlength : 300
												},

												textAreaPublicar : {
													required : true,
													maxlength : 4000
												}

											},
											messages : {
												Tema : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													min : "<div class='alert alert-danger alert-dismissible fade in' style=''>Selecione um Tema</div>"
												},

												titulo : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													maxlength : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter no m�ximo 300 letras</div>"
												},

												textAreaPublicar : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													maxlength : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter no m�ximo 4000 letras</div>"
												}

											}

										});

					});

	$(document)
			.ready(
					function() {

						$("#formCadastroAdm")
								.validate(
										{
											rules : {
												nomeAdm : {
													required : true,
													minlength : 2,
													maxlength : 50,
													pattern : /^[a-zA-Z\s]+$/
												},
												emailAdm : {
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
												senhaAdm : {
													required : true,
													minlength : 2,
													maxlength : 10,
													pattern : /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/,
												},

												repetirSenhaAdm : {
													required : true,
													minlength : 2,
													maxlength : 10,
													equalTo : "#senha"
												},

												enderecoAdm : {
													required : true,
													pattern : /[0-9]{8}/,

												}

											},
											messages : {
												nomeAdm : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													minlength : "<div class='alert alert-danger alert-dismissible fade in' style=''>� necess�rio no m�nimo duas letras</div>",
													maxlength : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter no m�ximo 50 letras</div>",
													pattern : "<div class='alert alert-danger alert-dismissible fade in' style=''>� necess�rio Conter Somente Letras</div>"
												},
												emailAdm : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													maxlength : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve no m�ximo 130 caracteres</div>",
													email : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter o formato 'exemplo@exemplo.com'</div>",
													remote : "<div class='alert alert-danger alert-dismissible fade in' style=''>Email n�o Est� dispon�vel</div>"
												},
												senhaAdm : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													pattern : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter pelo menos 1 letra mai�scula, 1 letra min�scula, numeros e pelo menos 8 caracteres. </div>",
												},
												repetirSenhaAdm : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													equalTo : "<div class='alert alert-danger alert-dismissible fade in' style=''>As duas senhas devem ser iguais</div>",
												},
												enderecoAdm : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													pattern : "<div class='alert alert-danger alert-dismissible fade in' style=''> Deve Conter Formato V�lido</div>"
												}

											}

										});

					});

	$(document)
			.ready(
					function() {

						$("#updateSenha")
								.validate(
										{
											rules : {

												senha : {
													required : true,

													pattern : /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/,
												},

												senhaConfirm : {
													required : true,

													equalTo : "#inputNewSenha"

												},

												inputSenhaAtual : {
													required : true,

													remote : {

														type : "post",
														url : "checkSenhaAtual",
														data : {
															inputSenhaAtual : function() {
																return $(
																		"#inputSenhaAtual")
																		.val();
															}

														}
													}
												}

											},
											messages : {

												senha : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													pattern : "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve conter pelo menos 1 letra mai�scula, 1 letra min�scula, numeros e pelo menos 8 caracteres. </div>"
												},
												senhaConfirm : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													equalTo : "<div class='alert alert-danger alert-dismissible fade in' style=''>As duas senhas devem ser iguais</div>"
												},
												inputSenhaAtual : {
													required : "<div class='alert alert-danger alert-dismissible fade in' style=''>Campo deve ser preenchido</div>",
													remote : "<div class='alert alert-danger alert-dismissible fade in' style=''>Senha Atual incorreta</div>"

												}

											}

										});

					});
</script>
