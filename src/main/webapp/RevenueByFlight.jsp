<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Revenue by Flight</title>
</head>
<body>
    <h1>Revenue of <%out.print(request.getParameter("airline_id") + " " + request.getParameter("aircraft_id")); %></h1>
        <%
        try {
            //Get the database connection
            ApplicationDB db = new ApplicationDB();
            Connection con = db.getConnection();

            //Create a SQL statement
            Statement stmt = con.createStatement();

            String airlineId = request.getParameter("airline_id");
            String aircraftId = request.getParameter("aircraft_id");
            ResultSet rs = stmt.executeQuery("SELECT SUM(totalfare) FROM tickets WHERE airline_id = '" + airlineId + "' AND aircraft_id = '" + aircraftId + "'");

            //Make columns
            out.print("<table>");
            out.print("<tr>");

            out.print("<td>");
            out.print("Revenue");
            out.print("</td>");

            out.print("<td>");
            out.print("</tr>");


            //parse out the rss
            while (rs.next()) {
                out.print("<tr>");
                out.print("<td>");
                out.print("$" + rs.getString("SUM(totalfare)"));
                out.print("</td>");
                out.print("<td>");

                out.print("</td>");
                out.print("</tr>");

            }
            out.print("</table>");

            //close the connection.
            db.closeConnection(con);
        } catch (Exception e) {
            out.print(e);
        }
    %>
</body>
</html>