<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:import url="../comum/header.jsp"></c:import>

<title>Fórum</title>
</head>
<body>



	<center>Fórum</center>

	<center>
		<h1>Tópico 1</h1>
		<textarea placeholder="Escreva seu topico aqui:"
			style="width: 1000px; height: 500px;"></textarea>
			<br><br>
	</center>
	<button type = "submit"  class = "btn btn-primary" style="margin-left: 1000px;">Comente
		esse topico aqui</button>


	<button type = "submit" class = "btn btn-primary" style="margin-left: -1010px; margin-right:500px;">Crie
		um novo tópico</button>

</body>
</html>