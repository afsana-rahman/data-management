<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add New Flight</title>
</head>
<body>
	<h1>Adding New Flight</h1>
<%@ page import ="java.sql.*" %>

<%
		String airlineId = request.getParameter("airline");
		String aircraftId = request.getParameter("aircraft");
		String depAirport = request.getParameter("depairport");
		String depDate = request.getParameter("depdate");
	    String depTime = request.getParameter("deptime");
	    String arrAirport = request.getParameter("arrairport");
	    String arrDate = request.getParameter("arrdate");
	    String arrTime = request.getParameter("arrtime");
		int econPrice = Integer.parseInt(request.getParameter("econprice"));
		int businessPrice = Integer.parseInt(request.getParameter("busprice"));
		int firstclassPrice = Integer.parseInt(request.getParameter("fcprice"));
		
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
	    
	    int x = stmt.executeUpdate("insert into flights values('" +  
	    	airlineId + "', '" + aircraftId + "', '" +
	    	depAirport + "', '" + depAirport + "', '"+ depDate + "', '" + depTime + "', '" +
	    	arrAirport + "', '" + arrDate + "', '" + arrTime + "', 'one way', 0, " +
	    	econPrice + ", " + businessPrice  + ", "+ firstclassPrice  + ", '1');");
	    
	    
	    response.sendRedirect("ViewFlights.jsp");
%>

</body>
</html>