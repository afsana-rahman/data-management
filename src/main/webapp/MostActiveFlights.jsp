<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Most Active Flights</title>
</head>
<body>
<h1>Most Active Flights</h1>
    <%
        try {
                ApplicationDB db = new ApplicationDB();    
                Connection con = db.getConnection();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT airline_id, aircraft_id, COUNT(username) FROM tickets GROUP BY tickets.username ORDER BY COUNT(username) DESC");    
                
                //Make columns
                out.print("<table>");
                out.print("<tr>");
                
                out.print("<td>");
                out.print("Airline ID");
                out.print("</td>");
                
                out.print("<td>");
                out.print("Aircraft ID");
                out.print("</td>");
                
                out.print("<td>");
                out.print("Tickets Bought");
                out.print("</td>");
                
                out.print("<td>");
                out.print("</tr>");

                
                //parse out the rss
                int max = 0;
                if (rs.next()) {
                    
                    out.print("<tr>");
                    out.print("<td>");
                    out.print(rs.getString("airline_id"));
                    out.print("</td>");
                    out.print("<td>");
                    
                    out.print(rs.getString("aircraft_id"));
                    out.print("</td>");
                    out.print("<td>");
                    
                    
                    out.print(rs.getString("COUNT(username)"));
                    out.print("</td>");
                    out.print("<td>");

                    out.print("</td>");
                    out.print("</tr>");
                    max = Integer.parseInt(rs.getString("COUNT(username)"));

                }
                while (rs.next()) {
                    if(Integer.parseInt(rs.getString("COUNT(username)")) < max) {
                        break;
                    }
                    out.print("<tr>");
                    out.print("<td>");
                    out.print(rs.getString("airline_id"));
                    out.print("</td>");
                    out.print("<td>");
                    
                    out.print(rs.getString("aircraft_id"));
                    out.print("</td>");
                    out.print("<td>");
                    
                    
                    out.print(rs.getString("COUNT(username)"));
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