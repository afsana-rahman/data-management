<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservations</title>
</head>
<body>
	<h1>Reservations of <%out.print(request.getParameter("first_name") + " " + request.getParameter("last_name")); %></h1>
		<%  
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();

			String firstName = request.getParameter("first_name");
			String lastName = request.getParameter("last_name");
			
			ResultSet rs = stmt.executeQuery("SELECT * FROM tickets WHERE first_name = '" + firstName + "' AND last_name = '" + lastName + "'");
			String user = "";
			
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
				out.print("</td>");
				out.print("<td>");
				String username = rs.getString("username");
				user =  username;
				out.print(username);
				out.print("</td>");
				out.print("<td>");
				

				out.print(rs.getString("first_name"));
				out.print("</td>");
				out.print("<td>");
				

				out.print(rs.getString("last_name"));
				out.print("</td>");
				out.print("<td>");
				
				String airline_id = rs.getString("airline_id");
				out.print(airline_id);
				out.print("</td>");
				out.print("<td>");
				
				String aircraft_id = rs.getString("aircraft_id");
				out.print(aircraft_id);
				out.print("</td>");
				out.print("<td>");
				

				out.print(rs.getString("departure_airport"));
				out.print("</td>");
				out.print("<td>");
				
				String dep_date = rs.getString("departure_date");
				out.print(dep_date);
				out.print("</td>");
				out.print("<td>");
				

				out.print(rs.getString("departure_time"));
				out.print("</td>");
				out.print("<td>");
				

				out.print(rs.getString("arrival_airport"));
				out.print("</td>");
				out.print("<td>");
				
				String flight_class = rs.getString("class");
				out.print(flight_class);
				out.print("</td>");
				out.print("<td>");
				

				out.print(rs.getString("seat_number"));
				out.print("</td>");
				out.print("<td>");
				

				out.print("$" + rs.getString("totalfare"));
				out.print("</td>");
				out.print("<td>");

				out.print("</td>");
				
				out.print("<td>");
				%>
				<form action="DeleteFlight.jsp">
			    	<input type="submit" name="book" value="Delete">
			    	<input type="hidden" name=firstName value="<%=firstName%>">
				    <input type="hidden" name=lastName value="<%=lastName%>">
				    <input type="hidden" name=username value="<%=username%>">
				    <input type="hidden" name=class value="<%=flight_class%>">
				    <input type="hidden" name=airline_id value="<%=airline_id%>">
				    <input type="hidden" name=aircraft_id value="<%=aircraft_id%>">
				    <input type="hidden" name=dep_date value="<%=dep_date%>">
			    </form>
				<%
				out.print("</td>");
				
				out.print("</tr>");
			}
			out.print("</table>");
			%>
			<form action="AddReservation.jsp">
			    <input type="submit" name="book" value="Add Reservation">
			    <input type="hidden" name=first_name value="<%=firstName%>">
				<input type="hidden" name=last_name value="<%=lastName%>">
				<input type="hidden" name=username value="<%=user%>">
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