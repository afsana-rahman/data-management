<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%
	String userid = request.getParameter("username");
	String pass = request.getParameter("password");
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    
    ResultSet rs;
    rs = stmt.executeQuery("select * from customerreps where repuser='" + userid + "'");
    if (rs.next()) {
    	out.println("Username exists, please try another <a href='InputNewCust.jsp'>try again</a>");
    } else {
    	int x = stmt.executeUpdate("insert into customerreps values('" +userid+ "', '" + pass + "')");
        response.sendRedirect("EditCustomerReps.jsp");
    	
    }
%>

</body>
</html>