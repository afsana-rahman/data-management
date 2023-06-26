<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Aircrafts</title>
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
			String str = "SELECT * FROM aircraft";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make columns
			out.print("<table>");
			out.print("<tr>");
			
			out.print("<td>");
			out.print("Aircraft");
			out.print("</td>");
			
			out.print("<td>");
			out.print("</td>");
			
			out.print("<td>");
			out.print("</tr>");

			
			//parse out the results
			while (result.next()) {
				//Get vars
				String aircraftId = result.getString("aircraft_id");
				
				out.print("<tr>");
				
		    	
				out.print("<td>");
				out.print(result.getString("aircraft_id"));
				out.print("</td>");
				
				out.print("<td>");
				%>
				<form action="EditAircraft.jsp">
		    		<input type="submit" name="editflight" value="Edit">
		    		<input type="hidden" name=aircraft_id value="<%=aircraftId%>">
		    	</form>
		    	<%
				out.print("</td>");
		    	out.print("<td>");
		    	%>
				<form action="DeleteAircraft.jsp">
		    		<input type="submit" name="deleteflight" value="Delete">
		    		<input type="hidden" name=aircraft_id value="<%=aircraftId%>">
		    	</form>
		    	<%
				out.print("</td>");
				
				out.print("</tr>");

			}
			out.print("</table>");
			%>
			<br>
			<form action="AddAircraft.jsp" method="POST">
	    		Add Aircraft<br>
				<input type="text" name="aircraft" placeholder="Aircraft Number">
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