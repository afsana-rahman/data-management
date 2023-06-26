<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Answer Questions</title>
</head>
<body>
		<%  
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
						
			String str = "SELECT * FROM qa";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			//Make columns
			out.print("<table>");
			out.print("<tr>");
			
			out.print("<td>");
			out.print("Question");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Questions That Have not Been Answered Yet");
			out.print("</td>");
			
			out.print("<td>");
			out.print("</tr>");

			
			//parse out the results
			while (result.next()) {
				
				String questionToAnswer = result.getString("question");
				out.print("<tr>");
				out.print("<td>");
				out.print(questionToAnswer);
				out.print("</td>");
				out.print("<td>");

				if (result.getString("answer") == null)
				{
					%>
					<form action="AnswerQ.jsp" method="POST">
						<input type="hidden" name=question value="<%=questionToAnswer%>">
						<input type="submit" name="answer" value="Answer This Question">
					</form>

				<%}
				else
				{
					out.print(result.getString("answer"));
				}

				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>
</body>
</html>