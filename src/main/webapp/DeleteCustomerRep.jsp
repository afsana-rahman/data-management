<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete Rep</title>
</head>
<body>
	<h1>Rep Deleted</h1>
<%@ page import ="java.sql.*" %>
<% 
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
   
    String username = request.getParameter("repuser");
    String password = request.getParameter("reppass");
    
   	int x = stmt.executeUpdate("DELETE FROM customerreps WHERE repuser = '" + username + "' AND reppass= '" + password+ "'  "); 
 %>

</body>
</html>