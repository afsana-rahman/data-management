<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Answering a Question</title>
</head>
<body>
	You are currently answering the question:
	<br>
	<%
		String questionToAnswer = request.getParameter("question");
		out.print(questionToAnswer);
	%>
	<br>
	
	 <form action="ProcessAnswer.jsp" method="POST">
		<input type="hidden" name=question value="<%=questionToAnswer%>">
		<input type="text" name=repanswer placeholder="Your answer"> 
		<input type="submit" value="Submit Your Answer"/>
     </form>
</body>
</html>