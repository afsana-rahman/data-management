<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorted Flights</title>
</head>
<body>
		<%  
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String attribute = request.getParameter("orderby");

			String query;
			query = "SELECT * FROM flights ORDER BY " + attribute;

			
			if (attribute.equals("duration"))
				query = "select *, TIMESTAMPDIFF(SECOND, departure_time, arrival_time) / 60 from flights ORDER BY TIMESTAMPDIFF(SECOND, departure_time, arrival_time) / 60";

						
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(query);
			
			//Make columns
			out.print("<table>");
			out.print("<tr>");
			
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
			
			if (attribute.equals("duration")) {
				out.print("<td>");
				out.print("Flight Duration");
				out.print("</td>");
			}
			
			out.print("<td>");
			out.print("Availability");
			out.print("</td>");
			

			
			out.print("<td>");
			out.print("Book Economy");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Book Business");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Book First Class");
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
				String firstName = (String) session.getAttribute("firstname");
				String lastName = (String) session.getAttribute("lastname");
				
				out.print("<tr>");
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
				
				if (attribute.equals("duration")) {
					out.print(result.getString("TIMESTAMPDIFF(SECOND, departure_time, arrival_time) / 60"));
					out.print("</td>");
					out.print("<td>");
				}

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
				
				if (result.getString("availability").equals("1"))
				{
					%>
					<form action="CustomerConfirmation.jsp">
			    		<input type="submit" name="book" value="Book Economy">
			    		<input type="hidden" name=airline_id value="<%=airlineId%>">
				    	<input type="hidden" name=aircraft_id value="<%=aircraftId%>">
				    	<input type="hidden" name=departure_airport value="<%=depAirport%>">
				    	<input type="hidden" name=departure_date value="<%=depDate%>">
				    	<input type="hidden" name=departure_time value="<%=depTime%>">
				    	<input type="hidden" name=arrival_airport value="<%=arrAirport%>">
				    	<input type="hidden" name=econ_price value="<%=econPrice%>">
				    	<input type="hidden" name=business_price value="<%=businessPrice%>">
				    	<input type="hidden" name=firstclass_price value="<%=firstclassPrice%>">
				    	<input type="hidden" name=first_name value="<%=firstName%>">
				    	<input type="hidden" name=last_name value="<%=lastName%>">
				    	<input type="hidden" name=triptype value="<%=tripType%>">
			    	</form>
			    	<%
					out.print("</td>");
					out.print("<td>");
					
					%>
					<form action="CustomerConfirmation.jsp">
			    		<input type="submit" name="book" value="Book Business">
			    		<input type="hidden" name=airline_id value="<%=airlineId%>">
				    	<input type="hidden" name=aircraft_id value="<%=aircraftId%>">
				    	<input type="hidden" name=departure_airport value="<%=depAirport%>">
				    	<input type="hidden" name=departure_date value="<%=depDate%>">
				    	<input type="hidden" name=departure_time value="<%=depTime%>">
				    	<input type="hidden" name=arrival_airport value="<%=arrAirport%>">
				    	<input type="hidden" name=economy_price value="<%=econPrice%>">
				    	<input type="hidden" name=business_price value="<%=businessPrice%>">
				    	<input type="hidden" name=firstclass_price value="<%=firstclassPrice%>">
				    	<input type="hidden" name=first_name value="<%=firstName%>">
				    	<input type="hidden" name=last_name value="<%=lastName%>">
				    	<input type="hidden" name=triptype value="<%=tripType%>">
			    	</form>
			    	<%
					out.print("</td>");
					out.print("<td>");
				
					%>
					<form action="CustomerConfirmation.jsp">
			    		<input type="submit" name="book" value="Book First Class">
			    		<input type="hidden" name=airline_id value="<%=airlineId%>">
				    	<input type="hidden" name=aircraft_id value="<%=aircraftId%>">
				    	<input type="hidden" name=departure_airport value="<%=depAirport%>">
				    	<input type="hidden" name=departure_date value="<%=depDate%>">
				    	<input type="hidden" name=departure_time value="<%=depTime%>">
				    	<input type="hidden" name=arrival_airport value="<%=arrAirport%>">
				    	<input type="hidden" name=economy_price value="<%=econPrice%>">
				    	<input type="hidden" name=business_price value="<%=businessPrice%>">
				    	<input type="hidden" name=firstclass_price value="<%=firstclassPrice%>">
				    	<input type="hidden" name=first_name value="<%=firstName%>">
				    	<input type="hidden" name=last_name value="<%=lastName%>">
				    	<input type="hidden" name=triptype value="<%=tripType%>">
			    	</form>
			    	<%
					out.print("</td>");
					out.print("<td>");
				}
				else
				{
					%>
					<form action="CustWaitingList.jsp">
			    		<input type="hidden" name=airline_id value="<%=airlineId%>">
				    	<input type="hidden" name=aircraft_id value="<%=aircraftId%>">
				    	<input type="hidden" name=departure_airport value="<%=depAirport%>">
				    	<input type="hidden" name=departure_date value="<%=depDate%>">
				    	<input type="hidden" name=departure_time value="<%=depTime%>">
				    	<input type="hidden" name=arrival_airport value="<%=arrAirport%>">
				    	<input type="hidden" name=fare value="<%=econPrice%>">
				    	<input type="hidden" name=class value="<%="Economy"%>">
				    	<input type="hidden" name=triptype value="<%=tripType%>">
				    	<input type="hidden" name=first_name value="<%=firstName%>">
				    	<input type="hidden" name=last_name value="<%=lastName%>">
			    		<input type="submit" name="economy" value="Go on Waiting List for Economy">
			    	</form>
			    	<%
					out.print("</td>");
					out.print("<td>");
			    				
					%>
					<form action="CustWaitingList.jsp">
			    		<input type="hidden" name=airline_id value="<%=airlineId%>">
				    	<input type="hidden" name=aircraft_id value="<%=aircraftId%>">
				    	<input type="hidden" name=departure_airport value="<%=depAirport%>">
				    	<input type="hidden" name=departure_date value="<%=depDate%>">
				    	<input type="hidden" name=departure_time value="<%=depTime%>">
				    	<input type="hidden" name=arrival_airport value="<%=arrAirport%>">
				    	<input type="hidden" name=fare value="<%=businessPrice%>">
				    	<input type="hidden" name=triptype value="<%=tripType%>">
				    	<input type="hidden" name=first_name value="<%=firstName%>">
				    	<input type="hidden" name=class value="<%="Business"%>">
				    	<input type="hidden" name=last_name value="<%=lastName%>">
			    		<input type="submit" name="business" value="Go on Waiting List for Business">
			    	</form>
			    	<%
					out.print("</td>");
					out.print("<td>");
			    				
					%>
					<form action="CustWaitingList.jsp">
			    		<input type="hidden" name=airline_id value="<%=airlineId%>">
				    	<input type="hidden" name=aircraft_id value="<%=aircraftId%>">
				    	<input type="hidden" name=departure_airport value="<%=depAirport%>">
				    	<input type="hidden" name=departure_date value="<%=depDate%>">
				    	<input type="hidden" name=departure_time value="<%=depTime%>">
				    	<input type="hidden" name=arrival_airport value="<%=arrAirport%>">
				    	<input type="hidden" name=fare value="<%=firstclassPrice%>">
				    	<input type="hidden" name=triptype value="<%=tripType%>">
				    	<input type="hidden" name=first_name value="<%=firstName%>">
				    	<input type="hidden" name=last_name value="<%=lastName%>">
				    	<input type="hidden" name=class value="<%="First Class"%>">
			    		<input type="submit" name="firstclass" value="Go on Waiting List for First Class">
			    	</form>
			    	<%
					out.print("</td>");
					out.print("<td>");
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
			<p><a href="CustLoginSuccess.jsp">Go to main menu.</a></p>
</body>
</html>