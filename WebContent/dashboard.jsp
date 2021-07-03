<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vehicle Management System</title>
</head>
<body>
    <% 
    	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    	if(session.getAttribute("user_id") == null)
    		response.sendRedirect("/Vehicle/login");
  
    	session = request.getSession();
    	String name = (String)session.getAttribute("name");
    %>

    <h1>Welcome <%= name %></h1>
    <a href="/Vehicle/logout"><Button>Logout</Button></a><br /><br />
    
    <a href="/Vehicle/car"><Button>Buy a Car</Button></a>
    <a href="/Vehicle/bike"><Button>Buy a Bike</Button></a>
    <a href="/Vehicle/sell"><Button>Sell your vehicle</Button></a>
    <a href="/Vehicle/orders"><Button>My Orders</Button></a>
    
</body>
</html>