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
        String airport = request.getParameter("airport_id");
        String query;

        if (!request.getParameter("editAirportId").isEmpty()) {
            query = "UPDATE airport SET " + request.getParameter("editAirportId") + "WHERE airport_id='" + airport + "'";
               stmt.executeUpdate("UPDATE airport SET airport_id='" + request.getParameter("editAirportId") + "'" + " WHERE airport_id='" + airport + "'");
        }
        response.sendRedirect("EditAirports.jsp");
    %>
</body>
</html>