<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
</head>
<body>
	<%
    	if ((session.getAttribute("user") == null)) {
	%>
		You are not logged in!<br/>
		<a href="CustomerRepLogin.jsp">Please Login</a>
	<%
		} else {
	%>
	 <h1>Welcome, customer representative
	 <%=session.getAttribute("user") %>!</h1>
	<br><br>
	<form action="ViewReservations.jsp" method="POST">
		Edit Reservations for a Particular Customer:
		<br>
		<input type="text" name="first_name" placeholder="Customer's first name">
		<input type="text" name="last_name" placeholder="Customer's last name"> 
		<input type="submit" value="Go">
	</form>
	<p><a href="ViewCustomers.jsp">View All Customers</a></p>
	<br>
	<form action="ViewFlightsForAirport.jsp" method="POST">
		View All Flights for a Particular Airport:
		<br>
		<input type="text" name="airport" placeholder="Enter Airport Code">
		<input type="submit" value="Go">
	</form>
	<p><a href="ViewFlights.jsp">View All Flights</a></p>
	<a href="EditAirports.jsp" ><button>Edit Airports</button></a>
	<a href="EditAircrafts.jsp" ><button>Edit Aircrafts</button></a>
	<br><br><br>
	<form action="CustRepWaitingList.jsp" method="POST">
		Retrieve Passenger Waiting List:<br>
		<input type="text" name="airline_id" placeholder="Enter Airline"> 
		<input type="text" name="aircraft_id" placeholder="Enter Aircraft"> 
		<input type="date" name="dep_date" placeholder="Departing Date"> 
		<input type="submit" value="Retrieve">
	</form>	
	<br>
	<p><a href="AnswerQs.jsp">Answer Questions From Customers</a></p>
	<br>
	<p><a href="CustomerRepLogout.jsp">Log out</a></p>
	
	<%
	    }
	%>
</body>
</html>