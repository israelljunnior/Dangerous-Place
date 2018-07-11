<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js">
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
	<nav class="navbar navbar-inverse" style="background: #1C1C1C;">
		<div class="collapse navbar-collapse" style="margin-top: 3px" >
				<ul class="nav navbar-nav" >
					
				<li><a href="#" data-toggle="tooltip"><p class="names">Home</p></a></li>

				<li><a href="#" data-toggle="tooltip"><p class="names">Fórum</p></a></li>

				<li><a href="#" data-toggle="tooltip"><p class="names">Mapa</p></a></li>

				<li><a href="#" data-toggle="tooltip"><p class="names">Sobre Nós</p></a></li>

				<li><a href="#" data-toggle="tooltip"><p class="names">Gerar Relatório</p></a></li>


			</ul>
		</div>
	</div>
</nav>

<br/>
</body>
</html>