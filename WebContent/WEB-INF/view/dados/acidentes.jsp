<%-- 
    Document   : acidentes
    Created on : 01/08/2018, 20:36:21
    Author     : ATC-INFOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Escolha de tipos de dados de acidentes</title>
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
      		 <input type="checkbox" name="acidentes" value="natureza" onclick="setChecks(this)">Natureza
   		 </label>
</div>

<div class="col-sm-2">
   		 <label class="checkbox-inline">
      		<input type ="checkbox" name="acidentes" value="tipo" onclick="setChecks(this)">Tipo
    	</label>
</div>

<div class="col-sm-2">
   		 <label class="checkbox-inline">
     		 <input type ="checkbox" name="acidentes" value="onibus" onclick="setChecks(this)">Ônibus
    	</label> <br>
</div>


<div class="col-sm-2">
 		<label class="checkbox-inline">
        	<input type ="checkbox" name="acidentes" value="viatura" onclick="setChecks(this)">Viatura
    	</label>
</div>


<div class="col-sm-2">
    	<label class="checkbox-inline">
			<input type ="checkbox" name="acidentes" value="vitima" onclick="setChecks(this)">Vítima
   		</label>
</div>


	<div class="col-sm-2">
    	<label class="checkbox-inline">
      		<input type ="checkbox" name="acidentes" value="ciclista" onclick="setChecks(this)">Ciclista
    	</label> <br>
</div>



<div class="col-sm-2">
   		<label class="checkbox-inline">
     		 <input type ="checkbox" name="acidentes" value="pedestre" onclick="setChecks(this)">Pedestre
   		</label>
</div>



	<div class="col-sm-2">
    	<label class="checkbox-inline">
      		<input type ="checkbox" name="acidentes" value="automovel" onclick="setChecks(this)">Automóvel
   		</label>
</div>

	<div class="col-sm-2">
    	<label class="checkbox-inline">
      		<input type ="checkbox" name="acidentes" value="moto" onclick="setChecks(this)">Moto
    	</label> <br>
</div>


<div class="col-sm-2">
      <label class="checkbox-inline">
          <input type ="checkbox" name="acidentes" value="caminha" onclick="setChecks(this)">Caminhão
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

			
