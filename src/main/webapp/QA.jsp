<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Q & A</title>
</head>
<body>
	Q&A Section
	<br>
		<form method="post" action="FilteredQuestions.jsp">
			<table>
				<tr>    
					<td>Search for a question:</td><td><input type="text" name="questionfilter"/></td>
				</tr>
				<tr>
					<td>Search for an answer:</td><td><input type="text" name="answerfilter"/></td>
				</tr>
			</table>
			<input type="submit" value="Search">
		</form>
	<p><a href="AllQA.jsp">View All Question and Answers</a></p>
	<p><a href="AskQuestion.jsp">Ask a Question to a Customer Representative.</a></p>
	<p><a href="CustLoginSuccess.jsp">Go to main menu.</a></p>
</body>
</html>