<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Error</title>
</head>
<body>
<%
    String userid = request.getParameter("Username");   
    String pass = request.getParameter("Password");
    
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet rs1;
    rs1 = stmt.executeQuery("select * from customers where username='" + userid + "'");
    if (rs1.next()){
    	 ResultSet rs2;
    	    rs2 = stmt.executeQuery("select * from customers where username='" + userid + "' and password='" + pass + "'");
    	    if (rs2.next()) {
    	    	session.setAttribute("user", userid);
    	    	
    	    	ResultSet rs3 = stmt.executeQuery("select * from customers where username='" + userid + "' and password='" + pass + "'");
    	    	while (rs3.next()) {
    	    		String firstName = rs3.getString("first_name");
    	    		session.setAttribute("firstname", firstName);
    	    		String lastName = rs3.getString("last_name");
    	    		session.setAttribute("lastname", lastName);
    	    	}
    	    	
    	    	
    	        response.sendRedirect("CustLoginSuccess.jsp");
    	    } else {
    	        out.println("Invalid password <a href='CustomerLogin.jsp'>try again</a>");
    	    }
    }
    else
    {
    	out.println("Username doesn't exist <a href= 'InputNewCust.jsp'>Create an Account</a>");
    }
%>

</body>
</html>