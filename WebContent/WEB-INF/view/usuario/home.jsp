<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
</head>
<body>
	<c:import url="../comum/header.jsp"></c:import>

Bem Vindo, ${usuarioLogado.nome} <a href="<%=request.getContextPath()%>/logout">Logout</a>



 
<a href="/PP2-DangerousPlace/usuario/alterarDados">Alterar Dados</a> &nbsp; &nbsp;
 
 
 <br/>

<a href="/PP2-DangerousPlace/usuario/deletarConta" >Remover minha conta</a>



</body>
</html>
