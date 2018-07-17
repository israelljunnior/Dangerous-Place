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

<title>Fórum</title>
</head>
<body>
	<center>Fórum</center>

	<center>
		<h1>Tópico 1</h1>
		<textarea placeholder="Escreva seu topico aqui:"
			style="width: 1000px; height: 50px;"></textarea>
	</center>
	<button type = "submit"  class = "btn btn-primary-black" style="margin-left: 1000px; margin-bottom: 850px;">Comente
		esse topico aqui</button>


	<button type = "submit" class = "btn btn-primary" style="margin-left: -1010px; margin-bottom: -850px;">Crie
		um novo tópico</button>

</body>
</html>