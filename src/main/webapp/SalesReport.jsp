<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Revenue by Month</title>
</head>
<body>

        <%  
        try {
            //Get the database connection
            ApplicationDB db = new ApplicationDB();    
            Connection con = db.getConnection();        

            //Create a SQL statement
            Statement stmt = con.createStatement();

            String month = request.getParameter("month");
            
            String monthName = "";
            if (month.equals("01"))
                monthName = "January";
            if (month.equals("02"))
                monthName = "February";
            if (month.equals("03"))
                monthName = "March";
            if (month.equals("04"))
                monthName = "April";
            if (month.equals("05"))
                monthName = "May";
            if (month.equals("06"))
                monthName = "June";
            if (month.equals("07"))
                monthName = "July";
            if (month.equals("08"))
                monthName = "August";
            if (month.equals("09"))
                monthName = "September";
            if (month.equals("10"))
                monthName = "October";
            if (month.equals("11"))
                monthName = "November";
            if (month.equals("12"))
                monthName = "December";
        %>
            <h1>Revenue for the month of <%out.print(monthName); %></h1>
        <%
            ResultSet rs = stmt.executeQuery("SELECT SUM(totalfare) FROM tickets WHERE departure_date LIKE '%-" + month + "-%'");
            
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