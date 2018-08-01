<%-- 
    Document   : tipos
    Created on : 31/07/2018, 22:10:43
    Author     : ATC-INFOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <style type="text/css">

#h4{
    margin-right: 685px;
}
.balao2{
    background:  #ffffff;
    border-radius: 15px;
    width: 500px;
    height: 150px;
    margin-top: 100px;
    margin-bottom: 100px;
    margin-right: 150px;
    margin-left: 80px;
    text-align: center;
    position: relative;
}
.balao2:after{

    content: "";

    width: 50px;
    height: 0px;
 
    position: absolute;

    border-left: 20px solid transparent;
    border-right: 20px solid transparent;
    border-top: 20px solid #ffffff;

    bottom: -20px;
    left: 30%;
}
 	</style>



<div class="balao2">
	<div class="container">
  <div class="row">
    <h4 id="h4">Selecione os tipos de dados que você deseja:</h4>
    <div class="col-sm-2" >
         <button type="button" id="Assassinatos" class="btn btn-danger" style="margin-top: 50px; color:#000000 ">Assassinatos</button>
    </div>
    <div class="col-sm-1">
        <button type="button" id="Assaltos" class="btn btn-danger" style="margin-top: 50px;" >Assaltos</button>
    </div>

    <div class="col-sm-2">
        <button type="button" id="Acidentes" class="btn btn-danger" style="margin-top: 50px;" >Acidentes</button>
    </div>
  </div>
</div>
    
</div>

        
    </body>
</html>
