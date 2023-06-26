<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Confirmation</title>
</head>
<body>
<%@ page import ="java.sql.*" %>

 	<h1>Thank you for booking your flight!</h1>
 	<br>
 	Please note that the booking fee is a flat rate of $100.
 	<a href="CustomerReservations.jsp">View All Reservations</a>
 	<br>
    <a href="CustLogout.jsp">Log out</a>
 	
<% 	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
   
    String buttonClicked = request.getParameter("book");
    
    String username = (String) session.getAttribute("user");
	String airlineId = request.getParameter("airline_id");
   	String aircraftId = request.getParameter("aircraft_id");
	String firstName = request.getParameter("first_name");
   	String lastName = request.getParameter("last_name");
   	String tripType = request.getParameter("triptype");
   	
   	String depAirport = request.getParameter("departure_airport");
	String depDate = request.getParameter("departure_date");
	String depTime = request.getParameter("departure_time");
	String arrAirport = request.getParameter("arrival_airport");
   	
	int seatNum = (int) (Math.floor(Math.random() * 200) + 1);
	int ticketId = (int) (Math.floor(Math.random() * 1000) + 1);

 	if ("Book This Flight Now".equals(buttonClicked))
 	{
 	   	String flightClass = request.getParameter("class");
	 	int fare = Integer.parseInt(request.getParameter("fare"));		 
		int total = fare + 100;
 		stmt.executeUpdate("INSERT INTO tickets VALUE ('" + username + "','" + firstName + "','" + lastName + "','" + airlineId+ "' ,'" +aircraftId+ "' ,'" +depAirport+ "','" +depDate+ "','" +depTime+ "','" + arrAirport + "', '" + flightClass + "', " + seatNum + ", " + total + ", '" + tripType + "', '" + ticketId + "')");
  	}
 
	if("Book Economy".equals(buttonClicked)){
	 	int econPrice = Integer.parseInt(request.getParameter("econ_price"));
		 ResultSet rs1 = stmt.executeQuery("select current_timestamp");
		 
		 rs1.next();
		 String curr = rs1.getString("current_timestamp");
		 String cl = "Economy Class";
		 int total = econPrice + 100;
		 
		 int x = stmt.executeUpdate("INSERT INTO tickets VALUE ('" +username + "','" + firstName + "','" + lastName + "','" + airlineId+ "' ,'" +aircraftId+ "' ,'" +depAirport+ "','" +depDate+ "','" +depTime+ "','" + arrAirport + "', 'Economy', " + seatNum + ", " + total + ", '" + tripType + "', '" + ticketId + "')");
	}
	else if("Book Business".equals(buttonClicked)){
		int businessPrice = Integer.parseInt(request.getParameter("business_price"));
		 ResultSet rs1 = stmt.executeQuery("select current_timestamp");
		 rs1.next();
		 String curr = rs1.getString("current_timestamp");
		 String cl = "Business Class";
		 int total = businessPrice + 100;
		 
		 int x = stmt.executeUpdate("INSERT INTO tickets VALUE ('" + username + "','" + firstName + "','" + lastName + "','" + airlineId+ "' ,'" +aircraftId+ "' ,'" +depAirport+ "','" +depDate+ "','" +depTime+ "','" + arrAirport + "', 'Business Class', " + seatNum + ", " + total + ", '" + tripType + "', '" + ticketId + "')");

	}
	else if("Book First Class".equals(buttonClicked)){
		int firstclassPrice = Integer.parseInt(request.getParameter("firstclass_price"));
		 ResultSet rs1 = stmt.executeQuery("select current_timestamp");
		 rs1.next();
		 String curr = rs1.getString("current_timestamp");
		 String cl = "First Class";
		 int total = firstclassPrice + 100;
		 
		 int x = stmt.executeUpdate("INSERT INTO tickets VALUE ('" +username + "','" + firstName + "','" + lastName + "','" +airlineId+ "' ,'" +aircraftId+ "' ,'" +depAirport+ "','" +depDate+ "','" +depTime+ "','" + arrAirport + "', 'First Class', " + seatNum + ", " + total + ", '" + tripType + "', '" + ticketId + "')");
	}

/* 	-------------------------------------UPDATED (end)--------------------------------------------------------------------------
 */	
	
%>
</body>
</html>