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
        String aircraft = request.getParameter("aircraft_id");
        String query;

        if (!request.getParameter("editAircraftId").isEmpty()) {
               stmt.executeUpdate("UPDATE aircraft SET aircraft_id='" + request.getParameter("editAircraftId") + "'" + " WHERE aircraft_id='" + aircraft + "'");
        }
        response.sendRedirect("EditAircrafts.jsp");
    %>
</body>
</html>