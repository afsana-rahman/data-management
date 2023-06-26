<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Flight</title>
</head>
<body>
	<%
		String aircraftId = request.getParameter("aircraft_id");
	%>
	<h1>Editing Aircraft</h1>
	<form action="ProcessAircraftEdit.jsp" method="POST">
		Edit airline
		<input type="text" name="editAircraftId" placeholder=<%out.print(aircraftId);%> />
       	<input type="submit" value="Save Changes"/>
   		<input type="hidden" name=aircraft_id value="<%=aircraftId%>">
	</form>
</body>
</html>