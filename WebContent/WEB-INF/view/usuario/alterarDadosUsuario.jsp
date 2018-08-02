<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<style>
.inputs {
	font-size: 15px;
}
.modais{

		padding: 20px 14px;
		border: 1px solid #696969;
		font-family: 'Montserrat', sans-serif;
		font-size: 16px;
		height: 720px;
		width: 550px;
	}
</style>

<title>Alterar Dados</title>
</head>

<body>

	<c:import url="../comum/header.jsp"></c:import>
	<div class="row">
		<div class="col-sm-4"></div>

		<div class="col-sm-4">

	<form action="update" method="post">
	<fieldset class="modais">
	  <center>
        <legend>Alterar Dados</legend>
			<input type="hidden" name="id" value="${usuarioLogado.id}"> 
		
		<div class="form-group">
			<label for="inputNome">Nome:</label> <input type="text"
				id="inputNome" class="form-control" name="nome" value="${usuarioLogado.nome}"
				style="width: 500px;" />
		</div>
		<div class="form-group">
			<label for="inputEmail">Email:</label> <input type="text"
				id="inputEmail" class="form-control" name="email"	value="${usuarioLogado.email}"
				style="width: 500px;" />
				<label style="display: none;" id="mensagem">Este e-mail já existe</label>
		</div>
		<div class="form-group">
			<label for="inputSenha">Senha:</label> <input type="password"
				id="inputSenha" class="form-control" name="senha" value="${usuarioLogado.senha}"
				style="width: 500px;"  
			title="Deve ser Preenchido com pelo menos 8 caracteres, mínimo uma letra minúscula, uma letra Maiúsculo e um número" />
		</div>

		<div class="form-group">
			<label for="inputRepetirSenha">Repita a senha:</label> <input
				type="password" id="inputRepetir" class="form-control"
				name="repetirSenha" style="width: 500px;"  placeholder="Repita sua senha..." />
		</div>
		<div class="form-group">
			<label for="inputSexo">Sexo:</label>
				 <select name="selectSexo">
				<option id="inputSexo" class="form-control" 
				type="radio" value="F" name="sexo">Feminino</option>
				<br />
				<option type="radio" value="M" name="sexo">Masculino</option>
				<br />

			</select>
		</div>

		<div class="form-group">
			<label for="inputEndereco">CEP:</label> <input type="text"
				id="inputDescricao" class="form-control" name="endereco" value="${usuarioLogado.endereco}"
				style="width: 500px;" />
		</div>
			<input type="hidden" name="nivel_acesso" value="usuario"  >
		<button type="reset" class="btn btn-danger" style="background-color:#B22222;color: white">Cancelar</button>
		&nbsp; 

		<button type="submit" class="btn btn-primary" style="background-color: black;color: white;margin-left:10px" onClick = "validarSenha()" >&nbsp;
			Inserir&nbsp;</button>
 </fieldset>
	</form>
	
	</div>
	
	</div>
	

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
</body>
</html>