<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<title>F�rum</title>

<style type="text/css">
#titulo_forum {
	color: black;
	font-size: 3.5em;
	font-family: 'Montserrat',sans-serif;
}

#tabel_publicacao {
	width: 100%;
	border-style: solid;
	border-color: red;
}

#assunto_publicacao {
	margin-left: 5px;
	font-size: 1.2em;
}

#div_space {
	margin-bottom: 50px;
}

#nome_usuaro_publicacao {
	font-size: 15px;
	margin-left: 50px;
}

#titulo_publicacao {
	font-size: 1.4em;
}

#conteudo_publicacao {
	font-size: 1.2em;
	text-indent: 2.5em;
	margin-top: 30px;
}

#mostrar_comentario {
	background-color: rgba(0, 191, 255, 0.2);
}
</style>
</head>

<c:import url="../comum/header.jsp"></c:import>

<body>
	
<script type="text/javascript"> var tam = 15;
 function fonte(e){
    var elemento = $("#container");
    var fonte = elemento.css('font-size');
    if (e == 'a') {
        elemento.css("fontSize", parseInt(fonte) + 1);
    } else if('d'){
        elemento.css("fontSize", parseInt(fonte) - 1);
    }
}
</script>
<button onClick="fonte('a');">+</button>
	<button onClick="fonte('d');">-</button>

			<center><h2 id="titulo_forum">F�rum</h2></center>

<div class="row"  style="margin-top: 20px;margin-bottom: 20px;font-family: 'Montserrat',sans-serif">

	<div class="col-sm-2"></div>
	
	<div id="container" class="col-sm-8" style="box-shadow: 0 6px 10px 6px rgba(0,0,0,0.6), 0 6px 14px 0 rgba(0,0,0,0.6);">		

		<table border="0" style="margin-top: 20px;">
			<tr>
				<td colspan="5" style="width:100%;"><input class="form-control" id="myInput" type="text"
					style="width: 300px;" placeholder="Search.." /></td>
				
				
				<td>
					<button type="button" class="btn btn-primary"  data-toggle="modal"
						data-target="#modalPublicar"
						 style="align:rigth; background-color: #555555; color: white">Publicar</button>
					 
				</td>
			</tr>
		</table>
		<br><br>

<c:forEach var="publicacao" items="${listaPublicacao}">

		
		<table id="tabel_publicacao" border="0">

			<tr>
				<td id="assunto_publicacao" colspan="3"><b>Tema: </b>
					${publicacao.tema}</td>
			</tr>

			<tr style="margin-left: 4px">

	<!-- Foto do usu�rio que publicou
				<td><a data-toggle="modal" data-target="#modal"><img
				class='img-thumbnail' src="" alt='Foto de exibi��o' width='55px'
				height='40px' />"</a></td> -->

				<!-- Nome do usu�rio que publicou-->
				<td id="nome_usuaro_publicacao"><a data-toggle="modal"
			data-target="#modal"> ${publicacao.usuario.nome}</td>

				<!-- Data da p�blica��o-->
				<td><b>Publicado em:</b> <fmt:formatDate value="${publicacao.data}" pattern="dd/MM/yyyy" /></td>
		
		
							<td><button class="btn btn-danger" data-toggle="modal"
						data-target="#modalExcluir" style="float:right;" >Excluir</button></td>       				
	       			
				
		   
			</tr>

			<tr>

				<!-- T�tulo da publica��o -->
				<td colspan="3" id="titulo_publicacao"><br> <b>Titulo:</b>
					${publicacao.titulo}</td>
			
	<tr>
				<!-- O conte�do em si do publica��o -->
				<td colspan="3">
					<p id="conteudo_publicacao">${publicacao.conteudo}</p>
				</td>
				<td><br> <br> <br> <br></td>
			</tr>

				<tr>
				<td colspan="3"><br> 
				<!-- Bot�o que  ir� exibir todos coment�rios -->
					<button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#modalComentario${ publicacao.id}"
						 style="background-color: #555555; color: white">Coment�rios</button>
					
					<!--  <label style="margin-left: 4px;">Quantidade de coment�rios: 0 </label> <br> -->
					<br> <br> <br>
					
					
					
					<!-- Modal -->
  <div class="modal fade" id="modalComentario${ publicacao.id}" role="dialog" >
    <div class="modal-dialog" style="width:60%;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h2 class="modal-title">Coment�rios</h2>
        </div>
        <div class="modal-body">
          <table  border="0" style="width: 100%;" >
          
							<c:forEach var="comentario" items="${listaComentario}">
							<c:if test="${ comentario.publicacao.id == publicacao.id}">
							<tr>
								<!-- Foto do usu�rio que postou o coment�rio -->
								<td>Foto do usu�rio</td>

								<!--Espa�o -->
								<td><br> <br> <br> <br> <br></td>

								<!-- Nome do usu�rio que postou o coment�rio -->
								<td><b>${comentario.usuario.nome }</b></td>

								<!-- Data que coment�rio foi postado -->

								<td><fmt:formatDate value="${comentario.data}" pattern="dd/MM/yyyy" /></td>
								
	      <c:choose> 
	       				<c:when test="${comentario.usuario.id == usuarioLogado.id}">
	       				<!-- Op��o de apagar o coment�rio -->
								<td><button class="btn btn-danger">Apagar</button></td>
	       				
	       				</c:when>  
	       				<c:otherwise>
	       				<c:if test="${comentario.usuario.nivel_acesso == 'adm' || 'admSup' }">
	       				<!-- Op��o de apagar o coment�rio -->
								<td><button class="btn btn-danger">Apagar</button></td>
	       				</c:if>
	       				
	       				</c:otherwise>
	       				
	       				</c:choose>
							</tr>
							
							<tr>
								<!-- O coment�rio em si est� aqui -->
								<td  colspan="6"><p>${comentario.conteudo}</p><<br> <br>
								<!-- Colocando uma linha para separar cada coment�rio -->
									<hr />
								</td>
							</tr>
					</c:if>
						</c:forEach>
						</table>
        
        
    
        
        
  
        </div>
        
        <div class="modal-footer">
<table border="0" style="width: 100%; ">
						<tr>
							<td><br> <br> <br></td>
						</tr>
						
						<tr>
							<td>
								<!-- Campo de formul�rio pra enviar um novo coment�rio -->
								<form action="comentar" id="formComent${publicacao.id}" method="post"">
			
								<input type="hidden" id="idUsuComent${publicacao.id } " name="idUsuComent" value="${usuarioLogado.id}" />
								<input type="hidden" id="idPubComent${publicacao.id }" name="idPubComent" value="${publicacao.id}" />
			
									<textarea style="resize: none;" rows="6" cols="5"
										class="form-control" minlength="1" form="formComent${publicacao.id}" name="conteudoComent"
										placeholder="Escreva um coment�rio "></textarea>
									
									<br> <input class="btn btn-primary" type="submit"
										 value="Enviar Coment�rio" style=" float: right; background-color: #555555;"> <br>
									<br>
									
								</form>

							</td>
						</tr>
					</table> <!-- Fim de �rea de enviar coment�ro-->



        </div>
      </div>
      
    </div>
  </div>
  



			

						
						
						 
											
</c:forEach>

			<!-- *************************************************************************************** -->

			<!-- Modal para perfil no f�rum -->
			<div class="modal fade" id="modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<center>
								<h3 class="modal-title">Perfil</h3>
							</center>
							<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<ul type="none">
								<li><center>Foto</center></li>
								<br>
								<br>
								<li><label>N�mero de postagem que o usu�rio j� fez:
								</label><br> 0</li>
								<br>

								<li><label>Nome:&nbsp;&nbsp;</label> Diego</li>
								<br>

								<li><label>Sexo:&nbsp;&nbsp;</label> Masculino</li>
								<br>

								<li><label>Data de nascimento:&nbsp;&nbsp;</label>
									23/32/1333</li>

								<br>
								<li><label>Descri��o do usu�rio:&nbsp;&nbsp;</label> Minha
									descri��o</li>
						
				</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
						</div>
					</div>
				</div>
			</div>
</table>



<!-- modal excluir -->

<!-- Modal -->
  <div class="modal fade" id="modalExcluir" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div>
        <div class="modal-body">
          <center>
          <h4><p>Voc� tem certeza que deseja excluir?</p></h4>
          <button type="button" class="btn btn-danger">Sim</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">N�o</button>
        	</center>
        </div>
        <div class="modal-footer">
         
        </div>
      </div>
      
    </div>
  </div>
  
</div>
  
</body>
</html>