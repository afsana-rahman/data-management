<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Customer Representative</title>
</head>
<body>
	<%
		String repUser = request.getParameter("repuser");
		String repPass = request.getParameter("reppass");

	%>
	<h1>Editing user <%out.print(repUser); %></h1>
	<form action="ProcessCustomerRepEdit.jsp" method="POST">
		Password
		<input type="text" name="editPassword" placeholder=<%out.print(repPass);%> />
		<br>
       	<input type="submit" value="Save Changes"/>
   		<input type="hidden" name=repuser value="<%=repUser%>">
    	<input type="hidden" name=reppass value="<%=repPass%>">
	</form>
</body>
</html>