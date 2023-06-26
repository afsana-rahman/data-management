<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Flight Deleted </title>
</head>
<body>
	<h1>Flight Deleted</h1>
<%@ page import ="java.sql.*" %>

<% 
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
	
    String airlineId = request.getParameter("airline_id");
   	String aircraftId = request.getParameter("aircraft_id");
	String depDate = request.getParameter("departure_date"); 
    
   	int x = stmt.executeUpdate("DELETE FROM flights WHERE airline_id= '"
    		+airlineId+ "'AND aircraft_id= '"+aircraftId+ "' AND departure_date= '" + depDate + "'  "); 
   	response.sendRedirect("ViewFlights.jsp");
 %>

</body>
</html>