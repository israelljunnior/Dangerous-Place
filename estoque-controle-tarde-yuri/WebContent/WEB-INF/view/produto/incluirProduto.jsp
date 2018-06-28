<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Incluir produtos JAVA + SPRING</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>


</head>
<body>

	<c:import url="../comum/cabecalho.jsp" />


	<div>
		<form action="filter">
			<div class="form-group">
				<label for="inputCodigo">Código</label> <input type="text"
					id="inputCodigo" class="form-control" name="codigo"
					style="width: 100px;" maxlength="5" />
			</div>
			<div class="form-group">
				<label for="inputDescricao">Descrição</label> <input type="text"
					id="inputDescricao" class="form-control" name="descricao"
					style="width: 500px;" maxlength="100" />
			</div>
			<div class="form-group">
				<button type="reset" class="btn btn-default">&nbsp; Limpar
					&nbsp;</button>
				&nbsp;
				<button type="submit" class="btn btn-primary">&nbsp;
					Filtrar &nbsp;</button>
			</div>
		</form>
	</div>

	<hr>
	<h3>Incluir Produto</h3>
	<hr>

	<div style="text-align: center; color: red;">${mensagem}</div>

	<form action="save" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="inputDescricao">Código</label> <input type="text"
				id="inputCodigo" class="form-control" name="codigo"
				style="width: 500px;" maxlength="100" />
		</div>
		<div class="form-group">
			<label for="inputDescricao">Descrição:</label> <input type="text"
				id="inputDescricao" class="form-control" name="descricao"
				style="width: 500px;" maxlength="100" />
		</div>

		<div class="form-group">
			<label for="inputPrecoCusto">Preco de Custo:</label> <input
				type="text" id="idPrecoCusto" class="form-control" name="precoCusto"
				style="width: 500px;" maxlength="100" />
		</div>
		<div class="form-group">
			<label for="inputPrecoVenda">Preco de Venda:</label> <input
				type="text" id="idPrecoVenda" class="form-control" name="precoVenda"
				style="width: 500px;" maxlength="100" />
		</div>

		<div class="form-group">
			<label for="inputGarantia">Garantia:</label> <input type="text"
				id="idGarantia" class="form-control" name="garantia"
				style="width: 500px;" maxlength="100" />
		</div>

		<div class="form-group">
			<label for="inputQuantidade">Quantidade:</label> <input type="text"
				id="idQuantidade" class="form-control" name="quantidade"
				style="width: 500px;" maxlength="100" />
		</div>
		<div class="form-group">
			<label for="inputImagem">Imagem:</label> <input type="file"
				id="idImagem" class="form-control" name="file" style="width: 500px;"
				maxlength="100" />
		</div>
		<a href="listarProduto" class="btn btn-danger"> Cancelar</a> &nbsp;
		<button type="reset" class="btn btn-default">&nbsp; Limpar
			&nbsp;</button>
		&nbsp;
		<button type="submit" class="btn btn-primary">&nbsp; Inserir
			&nbsp;</button>
	</form>
</body>
</html>