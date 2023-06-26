<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Flight</title>
</head>
<body>
	<%
		String airlineId = request.getParameter("airline_id");
		String aircraftId = request.getParameter("aircraft_id");
		String depAirport = request.getParameter("departure_airport");
		String depDate = request.getParameter("departure_date");
	    String depTime = request.getParameter("departure_time");
	    String arrAirport = request.getParameter("arrival_airport");
	    String arrDate = request.getParameter("arrival_date");
	    String arrTime = request.getParameter("arrival_time");
	    String tripType = request.getParameter("triptype");
	    String numStops = request.getParameter("num_stops");
		String econPrice = request.getParameter("economy_price");
		String businessPrice = request.getParameter("business_price");
		String firstclassPrice = request.getParameter("firstclass_price");
		String availability = request.getParameter("availability");
	%>
	<h1>Editing Flight</h1>
	<form action="ProcessEdit.jsp" method="POST">
		Edit airline
		<input type="text" name="editAirlineId" placeholder=<%out.print(airlineId);%> />
		<br>
		Edit aircraft
		<input type="text" name="editAircraftId" placeholder=<%out.print(aircraftId);%> />
		<br>
		Edit departure airport
		<input type="text" name="editDepAirport" placeholder=<%out.print(depAirport);%> />
		<br>
		Edit departure date
		<input type="text" name="editDepDate" placeholder=<%out.print(depDate);%>/>
		<br>
		Edit departure time
		<input type="text" name="editDepTime" placeholder=<%out.print(depTime);%>/>
		<br>
		Edit arrival airport
		<input type="text" name="editArrAirport" placeholder=<%out.print(arrAirport);%> />
		<br>
		Edit arrival date
		<input type="text" name="editArrDate" placeholder=<%out.print(arrDate);%> />
		<br>
		Edit arrival time
		<input type="text" name="editArrTime" placeholder=<%out.print(arrTime);%> />
		<br>
		Edit trip type
		<input type="text" name="editTriptype" placeholder=<%out.print(tripType);%> />
		<br>
		Edit number of stops
		<input type="text" name="editNumStops" placeholder=<%out.print(numStops);%> />
		<br>
		Edit economy price
		<input type="text" name="editEconPrice" placeholder=<%out.print(econPrice);%> />
		<br>
		Edit business price
		<input type="text" name="editBusinessPrice" placeholder=<%out.print(businessPrice);%> />
		<br>
		Edit first class price
		<input type="text" name="editFirstclassPrice" placeholder=<%out.print(firstclassPrice);%> />
		<br>
		Edit availability
		<input type="text" name="editAvailability" placeholder=<%out.print(availability);%> />
		<br>
       	<input type="submit" value="Save Changes"/>
   		<input type="hidden" name=airline_id value="<%=airlineId%>">
    	<input type="hidden" name=aircraft_id value="<%=aircraftId%>">
    	<input type="hidden" name=departure_airport value="<%=depAirport%>">
    	<input type="hidden" name=departure_date value="<%=depDate%>">
    	<input type="hidden" name=departure_time value="<%=depTime%>">
    	<input type="hidden" name=arrival_airport value="<%=arrAirport%>">
		<input type="hidden" name=arrival_time value="<%=arrTime%>">
		<input type="hidden" name=arrival_date value="<%=arrDate%>">
		<input type="hidden" name=triptype value="<%=tripType%>">
	    <input type="hidden" name=num_stops value="<%=numStops%>">
    	<input type="hidden" name=economy_price value="<%=econPrice%>">
    	<input type="hidden" name=business_price value="<%=businessPrice%>">
    	<input type="hidden" name=firstclass_price value="<%=firstclassPrice%>">
    	<input type="hidden" name=availability value="<%=availability%>">
	</form>
</body>
</html>