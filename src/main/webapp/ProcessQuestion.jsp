<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%	
    String newQuestion = request.getParameter("newquestion");
	
    ApplicationDB db = new ApplicationDB();	
    Connection con = db.getConnection();	
    Statement stmt = con.createStatement();
    
    ResultSet rs1;
    rs1 = stmt.executeQuery("SELECT * FROM qa WHERE question = '" + newQuestion + "'");
    
    if (rs1.next())
    {
		out.println("This question has already been asked. Please ask a different one.");
    }
    else
    {
    	stmt.executeUpdate("INSERT INTO qa (question) VALUES ('" + newQuestion + "')");
		out.println("Your question has been submitted! Please wait for a response from a customer reprsentative.");
    }
%>
</body>
</html>