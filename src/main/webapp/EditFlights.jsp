<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Flights</title>
</head>
<h1>Edit Flights</h1>
<body>
		<%  
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM flights";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make columns
			out.print("<table>");
			out.print("<tr>");
			
			out.print("<td>");
			out.print("Edit");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Airline");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Aircraft");
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
			out.print("Arrival Date");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Arrival Time");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Trip Type");
			out.print("</td>");
			
			out.print("<td>");
			out.print("# of Stops");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Economy Price");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Business Price");
			out.print("</td>");
			
			out.print("<td>");
			out.print("First Class Price");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Availability");
			out.print("</td>");
			
			out.print("<td>");
			out.print("</tr>");

			
			//parse out the results
			while (result.next()) {
				
				//Get vars
				String airlineId = result.getString("airline_id");
				String aircraftId = result.getString("aircraft_id");
				String depAirport = result.getString("departure_airport"); 
				String depDate = result.getString("departure_date");
			    String depTime = result.getString("departure_time");
			    String arrAirport = result.getString("arrival_airport");
			    String arrDate = result.getString("arrival_date");
			    String arrTime = result.getString("arrival_time");
			    String tripType = result.getString("triptype");
			    String numStops = result.getString("num_stops");
				String econPrice = result.getString("econ_price");
				String businessPrice = result.getString("business_price");
				String firstclassPrice = result.getString("firstclass_price");
				String availability = result.getString("availability");
				
				out.print("<tr>");
				out.print("<td>");
				
				%>
				<form action="EditFlight.jsp">
		    		<input type="submit" name="editflight" value="Edit">
		    		<input type="hidden" name=airline_id value="<%=airlineId%>">
			    	<input type="hidden" name=aircraft_id value="<%=aircraftId%>">
			    	<input type="hidden" name=departure_airport value="<%=depAirport%>">
			    	<input type="hidden" name=departure_date value="<%=depDate%>">
			    	<input type="hidden" name=departure_time value="<%=depTime%>">
			    	<input type="hidden" name=arrival_airport value="<%=arrAirport%>">
			    	<input type="hidden" name=economy_price value="<%=econPrice%>">
			    	<input type="hidden" name=business_price value="<%=businessPrice%>">
			    	<input type="hidden" name=firstclass_price value="<%=firstclassPrice%>">
			    	<input type="hidden" name=availability value="<%=availability%>">
		    	</form>
		    	<%
				out.print("</td>");
		    	
				out.print("<td>");
				out.print(result.getString("airline_id"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("aircraft_id"));
				out.print("</td>");
				out.print("<td>");
				
				
				out.print(result.getString("departure_airport"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("departure_date"));
				out.print("</td>");
				out.print("<td>");
				
				
				out.print(result.getString("departure_time"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("arrival_airport"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("arrival_date"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("arrival_time"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("triptype"));
				out.print("</td>");
				out.print("<td>");

				out.print(result.getString("num_stops"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("econ_price"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("business_price"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("firstclass_price"));
				out.print("</td>");
				out.print("<td>");
				
				if (result.getString("availability").equals("1"))
				{
					out.print("Available");
				}
				else
				{
					out.print("NOT Available");
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
</body>
</html>