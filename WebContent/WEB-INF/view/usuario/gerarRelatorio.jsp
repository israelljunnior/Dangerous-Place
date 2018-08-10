<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<c:import url="../comum/header.jsp"></c:import>
</head>

<body>
  <div>
        <div class='container'>
            <div class='row'>
            <header style="margin: 30px 0; padding: 30px;"> Selecione qual tipo que você deseja gerar um relatório:</header>
                <div class='col-sm-3'>
                    <button type='button' id='Assassinatos' class='btn btn-danger'
                        style='margin: 20px 0; padding: 10px; padding: 3px 8px;'>Assassinatos</button>
                </div>
                <div class='col-sm-3'>
                    <button type='button' id='Assaltos' class='btn btn-danger'
                        style='margin: 20px 0; padding: 10px; padding: 3px 8px;'>Assaltos</button>
                </div>
                <div class='col-sm-3'>
                    <button type='button' id='Acidentes' class='btn btn-danger'
                        style='margin: 20px 0; padding: 10px; padding: 3px 8px;'>Acidentes</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>