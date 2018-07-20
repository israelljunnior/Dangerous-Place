<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
</script>


<title>Menu</title>
<style type="text/css">
.names{
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
      <li><a href="/PP2-DangerousPlace/usuario/forum">Fórum</a></li>
      <li><a href="#">Sobre nós</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    	<li><a href="/PP2-DangerousPlace/usuario/login " data-toggle="tooltip"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    	<li><a href="/PP2-DangerousPlace/usuario/cadastro" data-toggle="tooltip"><span class="glyphicon glyphicon-user"></span> Cadastre-se</a></li>
    </ul>
  </div>
</nav> 

<br/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery-validation-1.17.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery-validation-1.17.0/dist/additional-methods.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/localization/messages_pt_BR.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<link type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js">
