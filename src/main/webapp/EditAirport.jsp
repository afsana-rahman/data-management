<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Airport</title>
</head>
<body>
	<%
		String airportId = request.getParameter("airport_id");
	%>
	<h1>Editing Airport</h1>
	<form action="ProcessAirportEdit.jsp" method="POST">
		Edit airport
		<input type="text" name="editAirportId" placeholder=<%out.print(airportId);%> />
       	<input type="submit" value="Save Changes"/>
   		<input type="hidden" name=airport_id value="<%=airportId%>">
	</form>
</body>
</html>