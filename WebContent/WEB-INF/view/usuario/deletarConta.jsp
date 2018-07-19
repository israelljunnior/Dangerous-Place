<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



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
		height: 300px;
		width: 550px;
	}
</style>

<title>Deletar Conta</title>
</head>

<body>

<c:import url="../comum/header.jsp"></c:import>
	<div class="row">
		<div class="col-sm-4"></div>

		<div class="col-sm-4">

	<form action="delete" method="post">
	<fieldset class="modais">
	  <center>
        <legend>Deletar Conta</legend>
			<input type="hidden" name="id" value="${usuarioLogado.id}"> 
		
		
	
		<div class="form-group">
			Deseja realmente deletar sua conta?
		</div>
		

	
		<button type="reset" class="btn btn-danger" style="background-color:#B22222;color: white">N�o</button>
		&nbsp; 

		<button type="submit" class="btn btn-primary" style="background-color: black;color: white;margin-left:10px" onClick = "validarSenha()" >&nbsp;
			Sim&nbsp;</button>
 </fieldset>
	</form>
	
	</div>
	
	</div>

</body>
</html>