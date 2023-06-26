<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Waiting List</title>
</head>
<body>
<%@ page import ="java.sql.*" %> 
<%
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
	
	String username = (String) session.getAttribute("user");
	String firstName = (String) session.getAttribute("firstname");
	String lastName = (String) session.getAttribute("lastname");
	String airlineId = request.getParameter("airline_id");
	String aircraftId = request.getParameter("aircraft_id");
	String depAirport = request.getParameter("departure_airport");
	String depDate = request.getParameter("departure_date");
	String depTime = request.getParameter("departure_time");
	String arrAirport = request.getParameter("arrival_airport");
	String flightClass = request.getParameter("class");
	String tripType = request.getParameter("triptype");
	String fare = request.getParameter("fare");
%>
	<%out.print(airlineId);%> <%out.print(aircraftId);%> is currently full.
	You will be added to the waiting list for this flight and will be notified as soon a seat is available.
	<p><a href="ViewWaitingList.jsp">View My Waiting List</a></p>
	<p><a href="CustLogout.jsp">Log out</a></p>
 
<% 
/*  	out.print("INSERT INTO waitinglist VALUES('" + username + "','" + firstName + "', '" + lastName + "', '" + airlineId + "','" + aircraftId + "' ,'" + depAirport + "','" + depDate + "' ,'" + depTime + "','" + arrAirport + "','" + flightClass + "','" + tripType + "', 0, " + fare + ")");
 */    stmt.executeUpdate("INSERT INTO waitinglist VALUES('" + username + "','" + firstName + "', '" + lastName + "', '" + airlineId + "','" + aircraftId + "' ,'" + depAirport + "','" + depDate + "' ,'" + depTime + "','" + arrAirport + "','" + flightClass + "','" + tripType + "', 0, " + fare + ")");
%>
</body>
</html>