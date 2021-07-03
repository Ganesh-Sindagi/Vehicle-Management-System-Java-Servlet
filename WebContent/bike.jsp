<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.ArrayList" %>
 <%@page import="com.vehicle.Vehicle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bikes</title>
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
    <h1>This is the Bike section</h1>
    
    <% ArrayList<Vehicle> bikeList = (ArrayList)request.getAttribute("bikeList"); %>
    
    <h2>Available bikes <%=bikeList.size()%></h2>
    
    <%
      	for(int i=0; i<bikeList.size(); i++){
      	    	Vehicle bike = (Vehicle)bikeList.get(i);
      	    	out.println(bike.getV_id());
      	    	out.println(bike.getType());
      	    	out.println(bike.getModel());
      	    	out.println(bike.getColor());
      	    	out.println(bike.getReg_date());
      	    	out.println(bike.getImage());
      	    	out.println(bike.getPrice());
      	    	out.println(bike.getArea());
      	    	out.println(bike.getCity());
      	    	out.println(bike.getState());
      	    	out.println(bike.getZip());
      	    	out.println(bike.getOwner_id());
      	    	out.println(bike.getFuel_type());
      	    	out.println(bike.getGear());
      	    	out.println(bike.isAvail());
      	    }
      %>


</body>
</html>