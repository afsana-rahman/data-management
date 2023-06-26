<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Login</title>
</head>
<body>
	<h1>Customer Login</h1>
	<form action="ValidateCustLogin.jsp" method="POST">
	       Username: <input type="text" name="Username" required/> <br/>
	       Password: <input type="password" name="Password" required/> <br/>
	       <input type="submit" value="Login"/>
	</form>
	<p><a href="Welcome.jsp">Back to Home Page</a></p>
</body>
</html>