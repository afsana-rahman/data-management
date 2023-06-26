<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Customers</title>
</head>
<body>
		<%  
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery("SELECT * FROM customers");
			
			//Make columns
			out.print("<table>");
			out.print("<tr>");
			
			out.print("<td>");
			out.print("Username");
			out.print("</td>");
			
			out.print("<td>");
			out.print("First Name");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Last Name");
			out.print("</td>");
			
			out.print("<td>");
			out.print("</tr>");

			
			//parse out the rss
			while (rs.next()) {
				//Get vars
				String username = rs.getString("username");
				String password = rs.getString("password");
				String firstName = rs.getString("first_name"); 
				String lastName = rs.getString("last_name");
				
				out.print("<tr>");
				out.print("<td>");
				out.print(rs.getString("username"));
				out.print("</td>");
				out.print("<td>");
				
				
				out.print(rs.getString("first_name"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(rs.getString("last_name"));
				out.print("</td>");
				out.print("<td>");
				
				%>
					<form action="ViewReservations.jsp">
			    		<input type="submit" name="view_reservations" value="View Reservations">
			    		<input type="hidden" name=username value="<%=username%>">
				    	<input type="hidden" name=first_name value="<%=firstName%>">
				    	<input type="hidden" name=last_name value="<%=lastName%>">
			    	</form>
			    <%
				out.print("</td>");
				out.print("<td>");
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