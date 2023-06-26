<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success!</title>
</head>
<body>
	<h1>Success!</h1>
	<br>
	The changes have been made to this customer representative.
	<%
	    ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		
		String repUser = request.getParameter("repuser");
		String repPass = request.getParameter("reppass");
		String query;
		
		if (!request.getParameter("editPassword").isEmpty()) {
			query = "UPDATE customerreps SET reppass = '" + request.getParameter("editPassword") + "' WHERE username = '" + repUser + "'";
		    stmt.executeUpdate(query);
		}
	%>
</body>
</html>