<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Waiting List</title>
</head>
<h1>Waiting List</h1>
<body>
<%@ page import ="java.sql.*" %> 

<% 
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
	ResultSet rs1;

	String airlineId = request.getParameter("airline_id");
	String aircraftId = request.getParameter("aircraft_id");
	String depDate = request.getParameter("dep_date"); 
		
	rs1 = stmt.executeQuery("select username from waitinglist where airline_id= '"+ airlineId +"' and aircraft_id= '" + aircraftId + "' and departure_date= '" + depDate + "'"); 
	 
	  while(rs1.next()){
	    	out.println(rs1.getString(1));
	    	%>
	    	

    	<%} %>
</body>
</html>