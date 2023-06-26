<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Airports</title>
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
			String str = "SELECT * FROM airport";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make columns
			out.print("<table>");
			out.print("<tr>");
			
			out.print("<td>");
			out.print("Airport");
			out.print("</td>");
			
			out.print("<td>");
			out.print("</td>");
			
			out.print("<td>");
			out.print("</tr>");

			
			//parse out the results
			while (result.next()) {
				//Get vars
				String airportId = result.getString("airport_id");
				
				out.print("<tr>");
				
		    	
				out.print("<td>");
				out.print(result.getString("airport_id"));
				out.print("</td>");
				
				out.print("<td>");
				%>
				<form action="EditAirport.jsp">
		    		<input type="submit" name="editflight" value="Edit">
		    		<input type="hidden" name=airport_id value="<%=airportId%>">
		    	</form>
		    	<%
				out.print("</td>");
		    	out.print("<td>");
		    	%>
				<form action="DeleteAirport.jsp">
		    		<input type="submit" name="deleteflight" value="Delete">
		    		<input type="hidden" name=airport_id value="<%=airportId%>">
		    	</form>
		    	<%
				out.print("</td>");
				
				out.print("</tr>");

			}
			out.print("</table>");
			%>
			<br>
			<form action="AddAirport.jsp" method="POST">
	    		Add Airport<br>
				<input type="text" name="airport" placeholder="Airport Name">
				<input type="submit" value="Add">
	    	</form>
	    	<%

			//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>
</body>
</html>