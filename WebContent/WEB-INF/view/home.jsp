<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="initial-scale=1.0">

<title>Insert title here</title>
<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 90%;
        
      }
       html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      /* Optional: Makes the sample page fill the window. */
    </style>
</head>
<body>
	<c:import url="./comum/header.jsp"></c:import>

    <c:import url="./maps/googlemaps.jsp"></c:import>	

</body>
</html>
