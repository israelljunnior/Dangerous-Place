<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inserindo...</title>
</head>
<body>

	<form action="save" method="post" enctype="multipart/form-data">

		<p>
			Código: <br /> <input type="text" name="codigo" />
		</p>
		<p>
			Descrição: <br /> <input type="text" name="descricao" />
		</p>
		<p>
			Preco de Custo: <br /> <input type="text" name="precoCusto" />
		</p>
		<p>
			Preço de Venda: <br /> <input type="text" name="precoVenda" />
		</p>
		<p>
			Garantia: <br /> <input type="text" name="garantia" />
		</p>
		<p>
			Quantidade: <br /> <input type="text" name="quantidade" />
		</p>
		<p>
			Foto do Produto: <br /> <input type="file" name="file">
		</p>

		<br /> <input type="submit" value="Confirmar"> <input
			type="reset" value="Limpar">

	</form>

</body>
</html>