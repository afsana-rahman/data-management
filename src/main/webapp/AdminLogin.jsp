<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
</head>
<body>
	<h1>Admin Login</h1>
	<form action="ValidateAdminLogin.jsp" method="POST">
       Username: <input type="text" name="Username"/> <br/>
       Password: <input type="password" name="Password"/> <br/>
       <input type="submit" value="Login"/>
     </form>
     <p><a href="Welcome.jsp">Back to Home Page</a></p>
</body>
</html>