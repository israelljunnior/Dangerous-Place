<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:import url="../comum/header.jsp"></c:import>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<link type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js">

<title>Fórum</title>
</head>
<body>


	<center>
		<h1>Fórum</h1>
	</center>
	<br />
		
		<div class="col-sm-3"></div>
		
		<div class="col-sm-6" style="align:center">
		
		<h3>Tópico 1</h3>
			
		<textarea placeholder="Escreva seu topico aqui:"style="padding:15px; width: 600px; height: 200px;"></textarea>
		<br>
		<br>
	
	
	<button type="submit" class="btn btn-primary"
		style="align:rigth; background-color: black; color: white">Publicar</button>
	
 
	<button type="submit" class="btn btn-primary"
		style="align:rigth; background-color: black; color: white">Crie</button>
		
		<button type="submit" class="btn btn-primary"
		style="align:rigth; background-color: black; color: white">Comente
			esse topico aqui</button>
	 
	 </div>
	 <div class="col-sm-3"></div>
	 
</body>
</html>