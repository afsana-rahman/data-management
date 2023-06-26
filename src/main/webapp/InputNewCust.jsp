<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="CreateCustAcc.jsp" method="POST">
	       Enter a Username: <input type="text" name="Username" required/> <br/>
	       Enter a Password: <input type="password" name="Password" required/> <br/>
	       Enter your first name: <input type="text" name="first_name" required/> <br/>
	       Enter your last name: <input type="password" name="last_name" required/> <br/>
	       <input type="submit" value="Submit"/>
	</form>
</body>
</html>