<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.ArrayList" %>
 <%@page import="com.vehicle.Vehicle" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cars</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    	if(session.getAttribute("user_id") == null)
	    		response.sendRedirect("/Vehicle/login");
	  
	    	session = request.getSession();
	    	String name = (String)session.getAttribute("name");
	%>

    <h1>Welcome <%=name%></h1>
    <h1>This is the car section</h1>
    
    <% ArrayList<Vehicle> carList = (ArrayList)request.getAttribute("carList"); %>
    
    <h2>Available cars <%=carList.size()%></h2>
    
    <%
        	for(int i=0; i<carList.size(); i++){
        	    	Vehicle car = (Vehicle)carList.get(i);
        	    	out.println(car.getV_id());
        	    	out.println(car.getType());
        	    	out.println(car.getModel());
        	    	out.println(car.getColor());
        	    	out.println(car.getReg_date());
        	    	out.println(car.getImage());
        	    	out.println(car.getPrice());
        	    	out.println(car.getArea());
        	    	out.println(car.getCity());
        	    	out.println(car.getState());
        	    	out.println(car.getZip());
        	    	out.println(car.getOwner_id());
        	    	out.println(car.getFuel_type());
        	    	out.println(car.getGear());
        	    	out.println(car.isAvail());
        	    }
        %>
 
</body>
</html>