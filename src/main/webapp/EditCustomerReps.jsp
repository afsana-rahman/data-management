<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Customer Reps</title>
</head>
<body>
		<%  
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery("SELECT * FROM customerreps");
			
			//Make columns
			out.print("<table>");
			out.print("<tr>");
			
			out.print("<td>");
			out.print("Username");
			out.print("</td>");
			
			out.print("<td>");
			out.print("Password");
			out.print("</td>");
			
			
			out.print("<td>");
			out.print("</tr>");

			
			//parse out the rss
			while (rs.next()) {
				//Get vars
				String repUser = rs.getString("repuser");
				String repPass = rs.getString("reppass");
				
				out.print("<tr>");
				out.print("<td>");
				out.print(rs.getString("repuser"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(rs.getString("reppass"));
				out.print("</td>");
				out.print("<td>");	
				%>
					<form action="EditCustomerRep.jsp">
			    		<input type="submit" name="edit_customer" value="Edit">
			    		<input type="hidden" name=repuser value="<%=repUser%>">
				    	<input type="hidden" name=reppass value="<%=repPass%>">
			    	</form>
			    <%
				out.print("</td>");
				out.print("<td>");	
				%>
					<form action="DeleteCustomerRep.jsp">
						<input type="submit" name="delete_customer" value="Delete">
			    		<input type="hidden" name=repuser value="<%=repUser%>">
				    	<input type="hidden" name=reppass value="<%=repPass%>">
			    	</form>
			    <%
			}
			out.print("</table>");
			 %>
			 	<br>
				<form action="CreateRepAcc.jsp" method="POST">
				Create New Customer Representative Account:<br>
					<input type="text" name="username" placeholder="New Username"> <br>
					<input type="text" name="password" placeholder="New Password"> <br>
					<input type="submit" value="Create">
				</form>
			<%
			
			//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>
</body>
</html>