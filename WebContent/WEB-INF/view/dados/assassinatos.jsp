<%-- 
    Document   : assassinatos
    Created on : 01/08/2018, 20:36:32
    Author     : ATC-INFOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Escolha de tipos de dados de assassinatos</title>
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
      		 <input type="checkbox" name="assassinatos" value="todos_assassinatos" onclick="setChecks(this)">Todos assassinatos
   		 </label>
</div>

<div class="col-sm-2">
   		 <label class="checkbox-inline">
      		<input type ="checkbox" name="assassinatos" value="contra_homens" onclick="setChecks(this)">Contra homens
    	</label>
</div>

<div class="col-sm-2">
   		 <label class="checkbox-inline">
     		 <input type ="checkbox" name="assassinatos" value="contra_mulheres" onclick="setChecks(this)">Contra mulheres
    	</label> <br>
</div>


<div class="col-sm-2">
 		<label class="checkbox-inline">
        	<input type ="checkbox" name="assassinatos" value="conflitos_familiares" onclick="setChecks(this)">Conflitos familiares
    	</label>
</div>


<div class="col-sm-2">
    	<label class="checkbox-inline">
			<input type ="checkbox" name="assassinatos" value="conflitos_comunidade" onclick="setChecks(this)">Conflitos comunidade
   		</label>
</div>


	<div class="col-sm-2">
    	<label class="checkbox-inline">
      		<input type ="checkbox" name="assassinatos" value="criminais" onclick="setChecks(this)">Criminais
    	</label> <br>
</div>



<div class="col-sm-2">
   		<label class="checkbox-inline">
     		 <input type ="checkbox" name="assassinatos" value="homicidios" onclick="setChecks(this)">Homicídios
   		</label>
</div>



	<div class="col-sm-2">
    	<label class="checkbox-inline">
      		<input type ="checkbox" name="assassinatos" value="lesao_morte" onclick="setChecks(this)">Lesão e morte
   		</label>
</div>

	<div class="col-sm-2">
    	<label class="checkbox-inline">
      		<input type ="checkbox" name="assassinatos" value="arma_branca" onclick="setChecks(this)">Arma branca
    	</label> <br>
</div>


	<div class="col-sm-2">
    	<label class="checkbox-inline">
       		<input type ="checkbox" name="assassinatos" value="arma_fogo" onclick="setChecks(this)">Arma de fogo
    	</label>
</div>

	<div class="col-sm-2">
     	<label class="checkbox-inline">
       		<input type ="checkbox" name="assassinatos" value="13_17" onclick="setChecks(this)">Idade entre 13 a 17 
    	</label>
</div>

	<div class="col-sm-2">
     	<label class="checkbox-inline">
       		<input type ="checkbox" name="assassinatos" value="18_30" onclick="setChecks(this)">Idade entre 18 a 30 
    	</label> <br>
</div>


	
	<div class="col-sm-2">
     	<label class="checkbox-inline">
    	 	<input type ="checkbox" name="assassinatos" value="31_65" onclick="setChecks(this)">Idade entre 31 a 65 
    	</label>
</div>

	<div class="col-sm-2">
     	<label class="checkbox-inline">
    	 	<input type ="checkbox" name="assassinatos" value="acima_65" onclick="setChecks(this)">Acima de 65
    	</label>
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

			