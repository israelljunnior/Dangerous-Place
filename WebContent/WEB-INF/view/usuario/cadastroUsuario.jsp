<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js">
	
</script>
<script>

	function validarSenha() {
		Senha = document.getElementById("senha").value;
		Confirmar = document.getElementById("repetir_senha").value
		if (Senha = !Confirmar) {
			alert("Senha diferentes. Por favor repita a senha corretamente.");

		}

	}
</script>

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

<title>Cadastro | Dangerous Place</title>
</head>

<body>

	<c:import url="menu.jsp"></c:import>
	<div class="row">
		<div class="col-sm-4"></div>

		<div class="col-sm-4">

	<form action="save" method="post">
	<fieldset class="modais">
	  <center>
        <legend>Cadastre-se</legend>
		<div class="form-group">
			<label for="inputNome">Nome:</label> <input type="text"
				id="inputDescricao" class="form-control" name="nome"
				style="width: 500px;" maxlength="100" required="required" pattern="^[a-zA-Z\u00C0-\u00FF\s]*$" placeholder="Digite seu nome..." />
		</div>
		<div class="form-group">
			<label for="inputEmail">Email:</label> <input type="text"
				id="inputDescricao" class="form-control" name="email"
				style="width: 500px;" maxlength="100" required="required" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" placeholder="Digite seu Email..." />
		</div>
		<div class="form-group">
			<label for="inputSenha">Senha:</label> <input type="password"
				id="inputDescricao" class="form-control" name="senha"
				style="width: 500px;" maxlength="100" required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" placeholder="Digite sua senha..."
			title="Deve ser Preenchido com pelo menos 8 caracteres, mínimo uma letra minúscula, uma letra Maiúsculo e um número" />
		</div>

		<div class="form-group">
			<label for="inputRepetirSenha">Repita a senha:</label> <input
				type="password" id="inputDescricao" class="form-control"
				name="repetirSenha" style="width: 500px;" maxlength="100"
				required="required" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" placeholder="Repita sua senha..." />
		</div>
		<div class="form-group">
			<label for="inputSexo">Sexo:</label>
				 <select name="selectSexo">
				<option id="inputSexo" class="form-control" required="required"
				type="radio" value="F" name="sexo">Feminino</option>
				<br />
				<option type="radio" value="M" name="sexo">Masculino</option>
				<br />
				<option type="radio" value="O" name="sexo">Outro</option>
				

			</select>
		</div>

		<div class="form-group">
			<label for="inputEndereco">CEP:</label> <input type="text"
				id="inputDescricao" class="form-control" name="endereco"
				style="width: 500px;" required="required" pattern="[0-9]{8}" placeholder="Digite seu CEP" />
		</div>

		<button type="reset" class="btn btn-danger" style="background-color:#B22222;color: white">Cancelar</button>
		&nbsp; 

		<button type="submit" class="btn btn-primary" style="background-color: black;color: white;margin-left:10px" onClick = "validarSenha()" >&nbsp;
			Inserir&nbsp;</button>
 </fieldset>
	</form>
	
	</div>
	
	</div>
</body>
</html>