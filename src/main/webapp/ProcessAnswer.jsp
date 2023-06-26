<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success!</title>
</head>
<body>
	<%
		out.println("Your answer has been successfully submitted into the system!");
    	String repAnswer = request.getParameter("repanswer");
    	String question = request.getParameter("question");
	    ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
 	    stmt.executeUpdate("UPDATE qa SET answer = '" + repAnswer + "' WHERE question = '" + question + "'");
	%>
	<p><a href="CustRepLoginSuccess.jsp">Go back to main menu.</a></p>
</body>
</html>