<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" media="all">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login | Login Usuário</title>
<style type="text/css">
		
	.modais{
		padding: 20px 14px;
		border: 1px solid #696969;
		font-family: 'Montserrat', sans-serif;
		font-size: 27px;
		height: 500px;
		width: 450px;
	}
	.inputs{
		font-size: 15px;
	}
	.input{
		width: 350px;
		height: 29px;
		border: 0.5px solid #696969;
		border-radius: 7px 7px 7px 7px;
	}
	.button{
		width: 350px;
		height: 50px;
		border-radius: 20px 20px 20px 20px;
		font-size: 14px;
		font-family: 'Montserrat', sans-serif;
		
		color: white; 
	}
	
	</style>
</head>
<body>
<c:import url="menu.jsp" />

<c:import url="login.jsp" />



<div class="row">
		<div class="col-sm-4"></div>

		<div class="col-sm-4">
		
		<form action="save" method="post">

		<fieldset class="modais">
        <center><legend>Login</legend>


  <fb:login-button scope="public_profile,email"
		onlogin="checkLoginState();">
	</fb:login-button>
        
       <c:import url="loginGoogle.jsp" />
      
        
      

    </center>  

			
			<p class="inputs">E-mail: <br/><input class="input" type="text" name="email"></p>
			<p class="inputs">Senha: <br/><input class="input" type="password" name="senha"></p>
			<p style="font-size: 15px;"><a href="#">Esqueceu sua senha?</a></p>
			
				 <center><button class="button" style="background-color: black;color: white" >Entrar</button><br/><br/></center>
				 <br/>
		</center>
			

			 </fieldset>
			 </form>	

</div>

<div class="col-sm-4"></div>
</div>

</body>
</html>