<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Flights</title>
</head>
<body>
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in!
<br>
<a href="CustomerLogin.jsp">Please login.</a>

<%
	} else {
%>
	<h1>Welcome, user <%=session.getAttribute("user") %>!</h1>
	<p><a href="CustomerReservations.jsp">View My Reservations</a></p>
	<p><a href="ViewWaitingList.jsp">View My Waiting List</a></p>
	<p><a href="AllFlights.jsp">View All Flights</a></p>
	<p><a href="CustomerLogout.jsp">Log out</a></p>
	<p><a href="QA.jsp">View Q&A</a></p>
	<br>
	
	<h3>Sort By:</h3>
	<form action="SortFlights.jsp">
		<input type="radio" name="orderby" value="econ_price" required> Economy Price
		<input type="radio" name="orderby" value="business_price" required> Business Class Price
		<input type="radio" name="orderby" value="firstclass_price" required> First Class Price
	    <input type="radio" name="orderby" value="departure_time" required> Departure Time
	    <input type="radio" name="orderby" value="arrival_time" required> Arrival Time
		<input type="radio" name="orderby" value="duration" required> Flight Duration
	<br>
		<input type="submit" value="Sort Flights by these Attributes">
	</form>
	<br><br>
	
	<h3>Filter By:</h3>
	<form method = "post" action ="FlightsByTripType.jsp">
		Please choose the two airports. Keywords are accepted. Leave blank if you have no preference for airports.
		<br>
		<input type="text" name="dep_airport" placeholder="Departure Airport"/> 
		<input type="text" name="arr_airport" placeholder="Arrival Airport"/> 
		<br>
		Please pick the desired trip type.
		<input type="radio" name="trip_type" value="round trip" required/> Round Trip
		<input type="radio" name="trip_type" value="one way" required/> One Way Trip
		<input type="radio" name="trip_type" value="any" required/> Any trip type
		<br>
		Please select the desired departure date.
		<br>
		<input type="radio" name="dep_date" value="any" required/> Any date
		<br>
		<input type="radio" name="dep_date" value="flex" required/> Enter flexible dates. Provide a range of 2 dates.
		<input type="text" name="dep_date_start" placeholder="YYYY-MM-DD form"/> to <input type="text" name="dep_date_end" placeholder="YYYY-MM-DD form"/>
		<br>
		<input type="radio" name="dep_date" value="inflex" required/> Enter an inflexible date (single date)
		<input type="text" name="dep_date_single" placeholder="YYYY-MM-DD form"/>
		<br>
		Please select the desired arrival date.
		<br>
		<input type="radio" name="arr_date" value="any" required/> Any date
		<br>
		<input type="radio" name="arr_date" value="flex" required/> Enter flexible dates. Provide a range of 2 dates.
		<input type="text" name="arr_date_start" placeholder="YYYY-MM-DD form"/> to <input type="text" name="arr_date_end" placeholder="YYYY-MM-DD form"/>
		<br>
		<input type="radio" name="arr_date" value="inflex" required/> Enter an inflexible date (single date)
		<input type="text" name="arr_date_single" placeholder="YYYY-MM-DD form"/>
		<br>
		<input type="text" name="num_stops" placeholder="Enter an integer"/> Enter number of desired stops. Leave blank if no preference.
		<br>
		<input type="submit" value="Filter By These Attributes">
	</form>	
<%
    }
%>
</body>
</html>