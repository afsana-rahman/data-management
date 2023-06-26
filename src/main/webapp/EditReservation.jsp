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
	    String lastName = request.getParameter("last_name");
	    String firstName = request.getParameter("first_name");
		String username = request.getParameter("username");
		String flightClass = request.getParameter("class");
		String seatNumber = request.getParameter("seat_number");
		String totalFare = request.getParameter("total_fare");
		String bookingFee = request.getParameter("booking_fee");

	%>
	<h1>Editing Flight</h1>
	<form action="ProcessEdit.jsp" method="POST">
		Edit username
		<input type="text" name="editUsername" placeholder=<%out.print(username);%> />
		<br>
		Edit first name
		<input type="text" name="editFirstName" placeholder=<%out.print(firstName);%> />
		<br>
		Edit last name
		<input type="text" name="editLastName" placeholder=<%out.print(lastName);%> />
		<br>
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
		Edit arrival airport
		<input type="text" name="editArrAirport" placeholder=<%out.print(arrAirport);%> />
		<br>
		Edit class
		<input type="text" name="editClass" placeholder=<%out.print(flightClass);%> />
		<br>
		Edit seat number
		<input type="text" name="editSeatNumber" placeholder=<%out.print(seatNumber);%> />
		<br>
		Edit total fare
		<input type="text" name="editTotalFare" placeholder=<%out.print(totalFare);%> />
		<br>
		Edit booking fee
		<input type="text" name="editBookingFee" placeholder=<%out.print(bookingFee);%> />
		<br>
       <input type="submit" value="Save Changes"/>
	</form>
</body>
</html>