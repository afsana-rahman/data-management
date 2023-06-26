<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ask a Question</title>
</head>
<body>
	Ask a Question to be Answered by a Customer Representative
	<br>
	<form method="post" action="ProcessQuestion.jsp">
		<table>
			<tr>    
				<td>Question:</td><td><input type="text" name="newquestion" required/></td>
			</tr>
		</table>
		<input type="submit" value="Submit">
	</form>
</body>
</html>