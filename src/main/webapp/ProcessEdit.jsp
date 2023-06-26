<!-- fix -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	    ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
	    String availability = request.getParameter("availability");
		String airlineId = request.getParameter("airline_id");
	   	String aircraftId = request.getParameter("aircraft_id");
		String numStops = request.getParameter("num_stops");
	   	String tripType = request.getParameter("triptype");
	   	String depAirport = request.getParameter("departure_airport");
		String depDate = request.getParameter("departure_date");
		String depTime = request.getParameter("departure_time");
		String arrAirport = request.getParameter("arrival_airport");
		String arrDate = request.getParameter("arrival_date");
		String arrTime = request.getParameter("arrival_time");
	 	int econPrice = Integer.parseInt(request.getParameter("economy_price"));
		int businessPrice = Integer.parseInt(request.getParameter("business_price"));
		int firstclassPrice = Integer.parseInt(request.getParameter("firstclass_price"));
		String query;

	if (!request.getParameter("editAvailability").isEmpty()) {
		query = "UPDATE flights SET availability =" + request.getParameter("editAvailability");
	    ResultSet rs;
	    rs = stmt.executeQuery(query);
	}
	
	if (!request.getParameter("editAirlineId").isEmpty()) {
		query = "UPDATE flights SET airline_id = '" + request.getParameter("editAirlineId") + "'";
	    ResultSet rs;
	    rs = stmt.executeQuery(query);
	}
	
	if (!request.getParameter("editAircraftId").isEmpty()) {
		query = "UPDATE flights SET aircraft_id = '" + request.getParameter("editAircraftId") + "' WHERE ";
	    ResultSet rs;
	    rs = stmt.executeQuery(query);
	}
	
	if (!request.getParameter("editDepDate").isEmpty()) {
		query = "UPDATE flights SET departure_date = '" + request.getParameter("editDepDate") + "'";
	    ResultSet rs;
	    rs = stmt.executeQuery(query);
	}
	
	if (!request.getParameter("editDepTime").isEmpty()) {
		query = "UPDATE flights SET departure_time = '" + request.getParameter("editDepTime") + "'";
	    ResultSet rs;
	    rs = stmt.executeQuery(query);
	}
	
	if (!request.getParameter("editArrAirport").isEmpty()) {
		query = "UPDATE flights SET arrival_airport = '" + request.getParameter("editArrAirport") + "'";
	    ResultSet rs;
	    rs = stmt.executeQuery(query);
	}
	
	if (!request.getParameter("editArrDate").isEmpty()) {
		query = "UPDATE flights SET arrival_date = '" + request.getParameter("editArrDate") + "'";
	    ResultSet rs;
	    rs = stmt.executeQuery(query);
	}
	
	if (!request.getParameter("editArrTime").isEmpty()) {
		query = "UPDATE flights SET arrival_time = '" + request.getParameter("editArrTime") + "'";
	    ResultSet rs;
	    rs = stmt.executeQuery(query);
	}
	
	if (!request.getParameter("editEconPrice").isEmpty()) {
		query = "UPDATE flights SET econ_price =" + request.getParameter("editEconPrice");
	    ResultSet rs;
	    rs = stmt.executeQuery(query);
	}
	
	if (!request.getParameter("editBusinessPrice").isEmpty()) {
		query = "UPDATE flights SET business_price =" + request.getParameter("editBusinessPrice");
	    ResultSet rs;
	    rs = stmt.executeQuery(query);
	}
	
	if (!request.getParameter("editFirstclassPrice").isEmpty()) {
		query = "UPDATE flights SET firstclass_price =" + request.getParameter("editFirstclassPrice");
	    ResultSet rs;
	    rs = stmt.executeQuery(query);
	}
	%>
</body>
</html>