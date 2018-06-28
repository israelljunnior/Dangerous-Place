<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>

<title>Insert title here</title>


</head>
<body>

	<c:import url="../comum/cabecalho.jsp" />	

	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">Código</th>
				<th scope="col">Descrição</th>
				<th scope="col">Imagem</th>
				<th scope="col">Preço Custo</th>
				<th scope="col">Preço Venda</th>
				<th scope="col">Garantia</th>
				<th scope="col">Quantidade</th>
				<th scope="col">Ações</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="produto" items="${listaProduto}">
	<tr>
					<th>#</th>
					<c:choose>
						<c:when test="${not empty produto.codigo }">
							<td scope ="row">${produto.codigo}</td>
						</c:when>
						<c:otherwise>
							<td scope ="row">Código não informado</td>
						</c:otherwise>
					</c:choose>
					
					
					
					<c:choose>
						<c:when test="${not empty produto.descricao }">
							<td scope ="row">${produto.descricao}</td>
						</c:when>
						<c:otherwise>
							<td scope ="row">Descrição não informada</td>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${not empty produto.imagem}">
							<td scope ="row">
							<img src = "<%=request.getContextPath()%>/resources/img/${produto.imagem}" style = width:30%;>
							</td>
						</c:when>
						<c:otherwise>
							<td scope ="row">Imagem nao informada</td>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${not empty produto.precoCusto}">
							<td scope ="row">${produto.precoCusto}</td>
						</c:when>
						<c:otherwise>
							<td scope="row">Preço Custo nao informada</td>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${not empty produto.precoVenda}">
							<td scope="row">${produto.precoVenda}</td>
						</c:when>
						<c:otherwise>
							<td scope="row">Preço de venda não informada</td>
						</c:otherwise>
					</c:choose>
					
						<c:choose>
						<c:when test="${not empty produto.garantia}">
							<td scope="row">${produto.garantia}</td>
						</c:when>
						<c:otherwise>
							<td scope="row">Garantia não informada</td>
						</c:otherwise>
					</c:choose>
					
						<c:choose>
						<c:when test="${not empty produto.quantidade}">
							<td scope="row">${produto.quantidade}</td>
						</c:when>
						<c:otherwise>
							<td scope="row">Quantidade não informada</td>
						</c:otherwise>
					</c:choose>
					
					<td style="vertical-align: middle; text-align: center;">
				<a href="edit?id=${produto.id}">Alterar</a> &nbsp; &nbsp;
				<a href="delete?id=${produto.id}">Remover</a> &nbsp; &nbsp;
					</td>				
	</tr>
				
	
			</c:forEach>
		</tbody>
	</table>
</body>
</html>