<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Revenue by Month</title>
</head>
<body>
	<h1>Reservations of <%out.print(request.getParameter("airline_id") + " " + request.getParameter("aircraft_id")); %></h1>
		<%  
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();

			String airlineId = request.getParameter("airline_id");
			String aircraftId = request.getParameter("aircraft_id");

			ResultSet rs = stmt.executeQuery("SELECT * FROM tickets WHERE airline_id = '" + airlineId + "' AND aircraft_id = '" + aircraftId + "'");
			
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
			out.print("Airline ID");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Aircraft ID");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Departure Airport");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Departure Date");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Departure Time");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Arrival Airport");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Class");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Seat Number");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Total Fare");
			out.print("</td>");
			
			out.print("<td>");
			out.print("</tr>");

			
			//parse out the rss
			while (rs.next()) {
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

				out.print(rs.getString("airline_id"));
				out.print("</td>");
				out.print("<td>");

				out.print(rs.getString("aircraft_id"));
				out.print("</td>");
				out.print("<td>");

				out.print(rs.getString("departure_airport"));
				out.print("</td>");
				out.print("<td>");

				out.print(rs.getString("departure_date"));
				out.print("</td>");
				out.print("<td>");

				out.print(rs.getString("departure_time"));
				out.print("</td>");
				out.print("<td>");

				out.print(rs.getString("arrival_airport"));
				out.print("</td>");
				out.print("<td>");

				out.print(rs.getString("class"));
				out.print("</td>");
				out.print("<td>");

				out.print(rs.getString("seat_number"));
				out.print("</td>");
				out.print("<td>");

				out.print("$" + rs.getString("totalfare"));
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