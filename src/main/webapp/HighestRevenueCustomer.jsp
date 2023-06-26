<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Highest Revenue Customer</title>
</head>
<body>
<h1>Highest Revenue-Generating Customer</h1>
	<%
		try {
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT first_name, last_name, SUM(totalfare) AS Revenue FROM tickets ORDER BY Revenue DESC LIMIT 1");	
				
				//Make columns
				out.print("<table>");
				out.print("<tr>");
				
				out.print("<td>");
				out.print("First Name");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Last Name");
				out.print("</td>");
				
				out.print("<td>");
				out.print("Revenue");
				out.print("</td>");
				
				out.print("<td>");
				out.print("</tr>");

				
				//parse out the rss
				while (rs.next()) {
					
					out.print("<tr>");
					out.print("<td>");
					out.print(rs.getString("first_name"));
					out.print("</td>");
					out.print("<td>");
					
					out.print(rs.getString("last_name"));
					out.print("</td>");
					out.print("<td>");
					
					
					out.print("$" + rs.getString("Revenue"));
					out.print("</td>");
					out.print("<td>");

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