<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<link type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js">
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">


</script>

</head>

<body style="margin-left: 5%; margin-right: 5%;">
<br />
<c:import url="/WEB-INF/view/comum/loginUsuario.jsp" />

<div align="right" style="color: #6E6E6E; marginright:
2%;">
 Bem vindo, ${usuarioLogado.nome}


</div>
</body>
</html>