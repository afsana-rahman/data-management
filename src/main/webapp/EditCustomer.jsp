<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Customer</title>
</head>
<body>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String firstName = request.getParameter("first_name"); 
		String lastName = request.getParameter("last_name");
	%>
	<h1>Editing user <%out.print(username); %></h1>
	<form action="ProcessCustomerEdit.jsp" method="POST">
		Password
		<input type="text" name="editPassword" placeholder=<%out.print(password);%> />
		<br>
		First Name
		<input type="text" name="editFirstName" placeholder=<%out.print(firstName);%> />
		<br>
		Last Name
		<input type="text" name="editLastName" placeholder=<%out.print(lastName);%>/>
		<br>
       	<input type="submit" value="Save Changes"/>
   		<input type="hidden" name=username value="<%=username%>">
    	<input type="hidden" name=password value="<%=password%>">
    	<input type="hidden" name=first_name value="<%=firstName%>">
    	<input type="hidden" name=last_name value="<%=lastName%>">
	</form>
</body>
</html>