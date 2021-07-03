<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.ArrayList" %>
 <%@page import="com.vehicle.Vehicle" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sell your Vehicle</title>
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
    
    <% ArrayList<Vehicle> vehicleList = (ArrayList)request.getAttribute("vehicleList");
    		
    		if(!vehicleList.equals(null)) {
            	for(int i=0; i<vehicleList.size(); i++){
            	    	Vehicle vehicle = (Vehicle)vehicleList.get(i);
            	    	out.println(vehicle.getV_id());
            	    	out.println(vehicle.getType());
            	    	out.println(vehicle.getModel());
            	    	out.println(vehicle.getColor());
            	    	out.println(vehicle.getReg_date());
            	    	out.println(vehicle.getImage());
            	    	out.println(vehicle.getPrice());
            	    	out.println(vehicle.getArea());
            	    	out.println(vehicle.getCity());
            	    	out.println(vehicle.getState());
            	    	out.println(vehicle.getZip());
            	    	out.println(vehicle.getOwner_id());
            	    	out.println(vehicle.getFuel_type());
            	    	out.println(vehicle.getGear());
            	    	out.println(vehicle.isAvail());
            	    }
    		}
            
    %>
    
    <h2>You can Register your vehicle for sale!</h2>
	<h3>Please fill the details below to register your vehicle</h3>

	<form action="/Vehicle/sell" method="POST">
		<label>Name: </label>
		<input type="text" name="name">
		<br><br><label>Address: </label>
		<textarea name="address" rows="3" cols="50">Enter Your Address</textarea>
		<br><br><label>Phone: </label>
		<input type="tel" name="phone">
		<br><br><label>Email: </label>
		<input type="email" name="email">

		<br><p>Your Vehicle Detail</p>

		<label>Type: </label>
		<select name="type">
			<option value="2">2</option>
			<option value="4">4</option>
		</select>
		<br><br><label>Model: </label>
		<input type="text" name="model">
		<br><br><label>Color: </label>
		<input type="text" name="color">
		<br><br><label>Registration Date: </label>
		<input type="date" name="reg_date">
		<br><br><label>Image URL: </label>
		<input type="text" name="image">
		<br><br><label>Price: </label>
		<input type="text" name="price">
		<br><br><label>Area: </label>
		<input type="text" name="area">
		<br><br><label>City: </label>
		<input type="text" name="city">
		<br><br><label>State: </label>
		<input type="text" name="state">
		<br><br><label>Zip: </label>
		<input type="text" name="zip">
		<br><br><label>Fuel_type: </label>
		<input type="text" name="fuel_type">
		<br><br><label>Gear: </label>
		<input type="text" name="gear">
		<br><br>
		<button type="submit">Register Vehicle</button>
	</form>
</body>
</html>