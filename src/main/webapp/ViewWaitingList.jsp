<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flights on my Waiting List</title>
</head>
<body>
<h1>My Waiting List</h1>
	<%
		try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT airline_id, aircraft_id, departure_airport, departure_date, departure_time, arrival_airport, class, triptype, status, fare FROM waitinglist WHERE username = '" + session.getAttribute("user") + "'");	
			
			//Make columns
			out.print("<table>");
			out.print("<tr>");
			
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
			out.print("Trip Type");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Fare");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Waiting List Status");
			out.print("</td>");
			
			out.print("<td>");
			out.print("</tr>");
			
			//parse out the rss
			while (rs.next()) {
				
				String airlineId = rs.getString("airline_id");
				String aircraftId = rs.getString("aircraft_id");
				String depAirport = rs.getString("departure_airport"); 
				String depDate = rs.getString("departure_date");
			    String depTime = rs.getString("departure_time");
			    String arrAirport = rs.getString("arrival_airport");
			    String tripType = rs.getString("triptype");
			    String flightClass = rs.getString("class");
			    String status = rs.getString("status");
			    String fare = rs.getString("fare");
				
				out.print("<tr>");
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
				
				out.print(rs.getString("triptype"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(rs.getString("fare"));
				out.print("</td>");
				out.print("<td>");
				
				if (rs.getString("status").equals("1")) {
					out.print("!!!This flight is now open to book!!!"); %>
					<form action="CustomerConfirmation.jsp">
			    		<input type="hidden" name=airline_id value="<%=airlineId%>">
				    	<input type="hidden" name=aircraft_id value="<%=aircraftId%>">
				    	<input type="hidden" name=departure_airport value="<%=depAirport%>">
				    	<input type="hidden" name=departure_date value="<%=depDate%>">
				    	<input type="hidden" name=departure_time value="<%=depTime%>">
				    	<input type="hidden" name=arrival_airport value="<%=arrAirport%>">
				    	<input type="hidden" name=triptype value="<%=tripType%>">
				    	<input type="hidden" name=class value="<%=flightClass%>">
				    	<input type="hidden" name=fare value="<%=fare%>">
				    	<input type="hidden" name=first_name value="<%=session.getAttribute("firstname")%>">
				    	<input type="hidden" name=last_name value="<%=session.getAttribute("lastname")%>">
				    	<input type="hidden" name=last_name value="<%=session.getAttribute("lastname")%>">
				    	<input type="submit" name="book" value="Book This Flight Now">
			    	</form>
				<%}
				else {
					out.print("You are still on the waiting list.");
				}
				
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
		<p><a href="CustLoginSuccess.jsp">Go to main menu.</a></p>
		
</body>
</html>