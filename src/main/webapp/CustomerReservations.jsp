<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Reservations</title>
</head>
<h1>My Reservations</h1>
<body>
<%@ page import ="java.sql.*" %>
    <p style="float: right;"><a href="CustLogout.jsp">Log out</a></p>
<% 
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet rs1;
    
    String userid = (String) session.getAttribute("user");

    rs1 = stmt.executeQuery("select * from tickets where username= '"+userid+"'"); 

    while(rs1.next()){
    	String flightClass = rs1.getString(10);
    	String airlineId = rs1.getString(4);
    	String aircraftId = rs1.getString(5);
    	String depDate = rs1.getString(7);
    	
	    out.println(rs1.getString(2));
		out.println(rs1.getString(3));
		out.println(rs1.getString(4));
		out.println(rs1.getString(5));
		out.println(rs1.getString(6));
		out.println(rs1.getString(7));
		out.println(rs1.getString(8));
		out.println(rs1.getString(9)); 
		out.println(rs1.getString(10));
		
		%>
	    	<form action="CustomerCancellation.jsp">
		    	<input type="submit" name="button_clicked" value="Cancel Flight">
		    	<input type="hidden" name=class value="<%=flightClass%>">
		    	<input type="hidden" name=airline_id value="<%=airlineId%>">
		    	<input type="hidden" name=aircraft_id value="<%=aircraftId%>">
		    	<input type="hidden" name=dep_date value="<%=depDate%>">
		    	
	    	</form>
    	<%} %>
    			<p><a href="CustLoginSuccess.jsp">Go to main menu.</a></p>
</body>
</html>