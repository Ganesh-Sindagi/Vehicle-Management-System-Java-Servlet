<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>vehicle-Login</title>
</head>
<body>
	<h1>Login</h1>
    <form action="/Vehicle/login" method="POST">
        <input type="email" name="email" placeholder="Enter your email"><br><br>
        <input type="password" name="password" placeholder="Enter your password"><br><br>
        <button type="submit" name="login-btn">Login</button>
    </form>
</body>
</html>