<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Questions</title>
</head>
<body>
		<%  
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
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
			out.print("Customer Representative's Answer");
			out.print("</td>");
			
			out.print("<td>");
			out.print("</tr>");

			
			//parse out the results
			while (result.next()) {
				
				out.print("<tr>");
				out.print("<td>");
				out.print(result.getString("question"));
				out.print("</td>");
				out.print("<td>");

				if (result.getString("answer") == null)
				{
					out.print("There is no answer from a customer representative yet.");
				}
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