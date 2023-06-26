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
	The changes have been made to this customer user.
	<%
	    ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String firstName = request.getParameter("first_name"); 
		String lastName = request.getParameter("last_name");
		String query;

		
		if (!request.getParameter("editPassword").isEmpty()) {
			query = "UPDATE customers SET password = '" + request.getParameter("editPassword") + "' WHERE username = '" + username + "'";
		    stmt.executeUpdate(query);
		}
		
		if (!request.getParameter("editFirstName").isEmpty()) {
			query = "UPDATE customers SET first_name = '" + request.getParameter("editFirstName") + "' WHERE username = '" + username + "'";
		    stmt.executeUpdate(query);
		}
		
		if (!request.getParameter("editLastName").isEmpty()) {
			query = "UPDATE customers SET last_name = '" + request.getParameter("editLastName") + "' WHERE username = '" + username + "'";
		    stmt.executeUpdate(query);
		}
	%>
</body>
</html>