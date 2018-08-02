<%-- 
    Document   : assaltos
    Created on : 01/08/2018, 20:36:02
    Author     : ATC-INFOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Escolha de tipos de dados de assaltos</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>

<div class="container">
  <form name="pegarDepois" id="pegarDepois" onsubmit=" return checkbox_checker();">
   
<div class="col-sm-2">
    	<label class="checkbox-inline">
      		 <input type="checkbox" name="assaltos" value="pedestre" onclick="setChecks(this)">Pedestre
   		 </label>
</div>

<div class="col-sm-2">
   		 <label class="checkbox-inline">
      		<input type ="checkbox" name="assaltos" value="veiculo" onclick="setChecks(this)">Veículo
    	</label>
</div>

<div class="col-sm-2">
   		 <label class="checkbox-inline">
     		 <input type ="checkbox" name="assaltos" value="estabelecimento" onclick="setChecks(this)">Estabelecimento
    	</label> <br>
</div>


<div class="col-sm-2">
 		<label class="checkbox-inline">
        	<input type ="checkbox" name="assaltos" value="extorsao" onclick="setChecks(this)">Extorsão
    	</label>
</div>


<div class="col-sm-2">
    	<label class="checkbox-inline">
			<input type ="checkbox" name="assaltos" value="instituicao_financeira" onclick="setChecks(this)">Instituição financeira
   		</label>
</div>


	<div class="col-sm-2">
    	<label class="checkbox-inline">
      		<input type ="checkbox" name="assaltos" value="carga" onclick="setChecks(this)">Carga
    	</label> <br>
</div>



<div class="col-sm-2">
   		<label class="checkbox-inline">
     		 <input type ="checkbox" name="assaltos" value="motoneta" onclick="setChecks(this)">Motoneta
   		</label>
</div>



	<div class="col-sm-2">
    	<label class="checkbox-inline">
      		<input type ="checkbox" name="assaltos" value="onibus" onclick="setChecks(this)">Ônibus
   		</label>
</div>

	<div class="col-sm-2">
    	<label class="checkbox-inline">
      		<input type ="checkbox" name="assaltos" value="residencias" onclick="setChecks(this)">Residências
    	</label> <br>
</div>

    <button type="button" class="btn btn-danger">Pronto</button>
   <button type="button" class="btn btn-default">Cancelar</button>

     <span id="qtdCheck"></span>

  </form>
</div>

<script Language='JavaScript'>
<!--
var qtdCheck=0; //número máximo permitido de caixas marcadas
var maxChecks=3;

var form = document.getElementById('pegarDepois');
function setChecks(obj) {
if(obj.checked){
qtdCheck++;
document.getElementById('qtdCheck').innerHTML = 'marcadas: ' + qtdCheck;
}else{
qtdCheck=qtdCheck-1
}

if (qtdCheck > maxChecks){
	obj.checked=false
	qtdCheck--
	document.getElementById('qtdCheck').innerHTML = 'marcadas: ' + qtdCheck;
	alert('Você só pode escolher até '+maxChecks+'  opções')
} document.getElementById('qtdCheck').innerHTML = 'marcadas: ' + qtdCheck;
}
function checkbox_checker(){
var checkbox_choices = 0;
for (counter = 0; counter < checkbox_form.songs.length; counter++){
if (checkbox_form.songs[counter].checked){ 
	checkbox_choices++; }
}if (checkbox_choices < 1 ){
alert('Marque pelo menos uma opção');
return (false);
}return (true);
}
</script>


</body>
</html>

			