<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Flight Cancellation </title>
</head>
<body>
	<h1>Flight Cancellation</h1>
<%@ page import ="java.sql.*" %>

	<p style="float: left;"><a href="CustomerReservations.jsp">View All Reservations</a></p>
    <p style="float: right;"><a href="CustLogout.jsp">Log out</a></p>

<% 
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
   
    String username = (String) session.getAttribute("user");
    String flightClass = request.getParameter("class");
    String airlineId = request.getParameter("airline_id");
   	String aircraftId = request.getParameter("aircraft_id");
	String depDate = request.getParameter("dep_date"); 
    
    if("Business Class".equals(flightClass) || "First Class".equals(flightClass)) {
    	int x = stmt.executeUpdate("DELETE FROM tickets WHERE username = '" + username + "' AND airline_id= '"
    		+airlineId+ "'AND aircraft_id= '"+aircraftId+ "' AND departure_date= '" + depDate + "'  "); 
    			  
    }
    else{
    	out.println("Sorry, you cannot cancel this flight because it is not booked with Business or First Class.");
    }
 %>

</body>
</html>