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

<title>Cadastro | Dangerous Place</title>
</head>

<body>

	<c:import url="../comum/header.jsp"></c:import>
	<div class="row">
		<div class="col-sm-4"></div>

		<div class="col-sm-4">

	<form action="save" method="post" id="formCadastro">
	<fieldset class="modais">
	  <center>
        <legend>Cadastre-se</legend>
		<div class="form-group">
			<label for="nome">Nome:</label> <input type="text"
				id="nome" class="form-control" name="nome" style="width: 500px;" placeholder="Digite seu nome..."/>
		</div>
		<div class="form-group">
			<label for="email">Email:</label> <input type="text"
				id="email" class="form-control" name="email" style="width: 500px;" placeholder="Digite seu Email..." />
		</div>
		<div class="form-group">
			<label for="senha">Senha:</label> <input type="password"
				id="senha" class="form-control" name="senha" style="width: 500px;" placeholder="Digite sua senha..." />
		</div>
		<div class="form-group">
			<label for="repetirSenha">Repita a senha:</label> <input
				type="password" id="repetirSenha" class="form-control"
				name="repetirSenha" style="width: 500px;"  placeholder="Repita sua senha..." />
		</div>
		<div class="form-group">
			<label for="inputSexo">Sexo:</label>
				 <select name="selectSexo">
				<option id="inputSexo" class="form-control" required="required"
				type="radio" value="F" name="sexo">Feminino</option>
				<br />
				<option type="radio" value="M" name="sexo">Masculino</option>
				<br />

			</select>
		</div>

		<div class="form-group">
			<label for="inputEndereco">CEP:</label> <input type="text"
				id="endereco" class="form-control" name="endereco"
				style="width: 500px;" placeholder="Digite seu CEP" />
		</div>

		<button type="reset" class="btn btn-danger" style="background-color:#B22222;color: white">Cancelar</button>
		&nbsp; 

		<button type="submit" class="btn btn-primary" style="background-color: black;color: white;margin-left:10px">&nbsp;
			Inserir&nbsp;</button>
 </fieldset>
	</form>
	
	</div>
	
	</div>
	
	<script>

$(document).ready(function(){
		
		$("#formCadastro").validate({
			
			rules: {
				nome: {
					required: true,
					minlength:2,
					maxlength:50,
					pattern: /^[a-zA-Z\s]*$/
				},
				email: {
					required:true,
					maxlength:130,
					email:true,
					remote:{
						url:"check",
						type:"post",
						data:{
							email: function(){
								return $("#email").val();
								}
							}
						}
				},
				senha: {
					required: true,
					pattern: /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/,
				},
				
				repetirSenha: {
					required: true,
					equalTo : "#senha"
				},
				endereco: {
					required: true,
					pattern: /[0-9]{8}/,
					/*remote: {
						url: "https://viacep.com.br/ws/"+$("#endereco").val()+"/json/",
						type: "post",
						data: {
							endereco: function(data){
								if(data != null){
									return $("#endereco").val();
								}
							}
						}
					}*/
				}
				
			}, messages:{
				nome: {
					required:"<div class='alert alert-danger alert-dismissible fade in' style=''>É necessário preencher o campo</div>",
					minlength: "<div class='alert alert-danger alert-dismissible fade in' style=''>É necessário Pelo menos duas letras</div>",
					maxlength: "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve Conter menos que 50 Letras</div>",
					pattern: "<div class='alert alert-danger alert-dismissible fade in' style=''>É necessário Conter Somente Letras</div>"
				},
				email: {
					required: "<div class='alert alert-danger alert-dismissible fade in' style=''>É necessário preencher o campo</div>",
					maxlength: "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve Conter Menos de 130 caracteres</div>",
					email: "<div class='alert alert-danger alert-dismissible fade in' style=''>Deve ter Formato válido de Email</div>",
					remote: "<div class='alert alert-danger alert-dismissible fade in' style=''>Email não Está disponível</div>"
				},
				senha: {
					required: "<div class='alert alert-danger alert-dismissible fade in' style=''>É necessário preencher o campo</div>",
					pattern: "<div class='alert alert-danger alert-dismissible fade in' style=''>Senha deve Conter pelo menos 1 Letra Maiúscula, Minúscula, Numeros e pelo menos 8 caracteres </div>",
					
				},
				repetirSenha: {
					required: "<div class='alert alert-danger alert-dismissible fade in' style=''>É necessário preencher o campo</div>",
					equalTo: "<div class='alert alert-danger alert-dismissible fade in' style=''>As duas senhas devem ser iguais</div>", 					
				},
				endereco: {
					required:"<div class='alert alert-danger alert-dismissible fade in' style=''>É necessário preencher o campo</div>",
					pattern: "<div class='alert alert-danger alert-dismissible fade in' style=''> Deve Conter Formato Válido</div>",
					//remote: "<div class='alert alert-danger alert-dismissible fade in' style=''> Cep inválido</div>"
					
				
				}
				
				
				
			}
			
		});
		
	});
</script> 


	
	
</body>
</html>