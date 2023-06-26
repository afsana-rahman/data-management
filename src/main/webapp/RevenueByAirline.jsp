<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Revenue by Airline</title>
</head>
<body>
    <h1>Revenue by Airline</h1>
        <%
        try {
            //Get the database connection
            ApplicationDB db = new ApplicationDB();
            Connection con = db.getConnection();

            //Create a SQL statement
            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT sum(totalFare), airline_id FROM tickets GROUP BY airline_id");
            //Make columns
            out.print("<table>");
            out.print("<tr>");

            out.print("<td>");
            out.print("Airline ID");
            out.print("</td>");

            out.print("<td>");
            out.print("Revenue");
            out.print("</td>");

            out.print("<td>");
            out.print("</tr>");


            //parse out the rss
            while (rs.next()) {
                out.print("<tr>");
                out.print("<td>");
                out.print(rs.getString("airline_id"));
                out.print("</td>");
                out.print("<td>");

                out.print("$" + rs.getString("sum(totalFare)"));
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
