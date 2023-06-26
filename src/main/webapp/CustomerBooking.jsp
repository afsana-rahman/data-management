<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Flights</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
	If flight is full, click on the waitlist button to be added to the waiting queue.
	<br>
<%
    String depAirport = request.getParameter("dep_airport") + "";   
	String depDate = request.getParameter("dep_date") + "";   
	
    String arrAirport = request.getParameter("arr_airport") + "";
    String arrDate = request.getParameter("arr_date") + "";   
    
    String tripType = request.getParameter("triptype") + "";   
    String sort = request.getParameter("button1") + ""; 
    
    String filter1 = request.getParameter("price") + "";   
    String filter2 = request.getParameter("stops") + "";
    String filter3 = request.getParameter("airline") + "";
    
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet rs1;
    String sql= "";
    
    String query = "SELECT * FROM flights WHERE ";
    boolean addAnd = false;
    
    //Check arrival airport
    if (!arrAirport.isEmpty() && arrAirport != null)
    {
    	if (addAnd)
    		query += " AND ";
    	query += "arrival_airport = '" + arrAirport + "' ";
    	addAnd = true;
    }
    
    if (!depAirport.isEmpty() && depAirport != null)
    {
    	if (addAnd)
    		query += " AND ";
    	query += "departure_airport = '" + depAirport + "' ";
    	addAnd = true;
    }
    
    if (!depDate.isEmpty() && depDate != null)
    {
    	if (addAnd)
    		query += " AND ";
    	query += "departure_date = '" + depDate + "' ";
    	addAnd = true;
    }
    
    if (!arrDate.isEmpty() && arrDate != null)
    {
    	if (addAnd)
    		query += " AND ";
    	query += "arrival_date = '" + arrDate + "' ";
    	addAnd = true;
    }
    
    if (!tripType.isEmpty() && tripType != null)
    {
    	if (addAnd)
    		query += " AND ";
    	query += "triptype = '" + tripType + "' ";
    	addAnd = true;
    }
    
    rs1 = stmt.executeQuery(query);
   
    while(rs1.next()){
 		String airlineId = rs1.getString(1);
    	String aircraftId = rs1.getString(2);
    	
    	String getDepAirport = rs1.getString(3);
    	String getDepDate = rs1.getString(4);
    	String getDepTime = rs1.getString(5);
    	
    	String getArrAirport = rs1.getString(6);
    	String getArrDate = rs1.getString(7);
    	String getArrTime = rs1.getString(8);
    	
		String getTripType = rs1.getString(9);
		String getNumStops = rs1.getString(10);
    	
    	String getEconPrice = rs1.getString(11);
    	String getBusinessPrice = rs1.getString(12);
    	String getFirstclassPrice = rs1.getString(13);
    	String getAvailability = rs1.getString(14);
    	
    	out.println(rs1.getString(1) + rs1.getString(2));
    	out.println(rs1.getString(3));
    	out.println(rs1.getString(4));
    	out.println(rs1.getString(5));
    	out.println(rs1.getString(6));
    	out.println(rs1.getString(7));
    	out.println(rs1.getString(8));
    	out.println(rs1.getString(9));
    	out.println(rs1.getString(10));
    	out.println(rs1.getString(11));
    	out.println(rs1.getString(12));
    	out.println(rs1.getString(13));
    	out.println(rs1.getString(14));
    	%>
    	<form action="CustomerConfirmation.jsp">
	    	<input type="submit" name="button_clicked" value="Book for Economy Class">
	    	<input type="submit" name="button_clicked" value="Book for Business Class">
	    	<input type="submit" name="button_clicked" value="Book for First Class">
	    	<input type="hidden" name=airline_id value="<%=airlineId%>">
	    	<input type="hidden" name=aircraft_id value="<%=aircraftId%>">
	    	<input type="hidden" name=dep_airport value="<%=getDepAirport%>">
	    	<input type="hidden" name=depdate value="<%=getDepDate%>">
	    	<input type="hidden" name=dep_time value="<%=getDepTime%>">
	    	<input type="hidden" name=arr_airport value="<%=getArrAirport%>">
	    	<input type="hidden" name=eprice value="<%=getEconPrice%>">
	    	<input type="hidden" name=bprice value="<%=getBusinessPrice%>">
	    	<input type="hidden" name=fprice value="<%=getFirstclassPrice%>">
	    	<input type="hidden" name=avail value="<%=getAvailability%>">
    	</form>
    	
    	<form action="CustWaitingList.jsp">
	    	<input type="submit" name="button_clicked" value="Waiting Queue">
	    	<input type="hidden" name=airline_id value="<%=airlineId%>">
	    	<input type="hidden" name=aircraft_id value="<%=aircraftId%>">
	    	<input type="hidden" name=depdate value="<%=getDepDate%>">
    	</form>
    	
    	
    	<%} %>
</body>
</html>