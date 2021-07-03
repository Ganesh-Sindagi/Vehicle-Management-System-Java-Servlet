<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.ArrayList" %>
 <%@page import="com.vehicle.Vehicle" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sell your Vehicle</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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

    <% ArrayList<Vehicle> vehicleList = (ArrayList)request.getAttribute("vehicleList"); %>
    		
	<% if(!vehicleList.isEmpty()) { %>
		<h3>Your Vehicles: </h1>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">Vehicle_id</th>
					<th scope="col">Type</th>
					<th scope="col">Model</th>
					<th scope="col">Color</th>
					<th scope="col">Reg. Date</th>
					<th scope="col">Image</th>
					<th scope="col">Price</th>
					<th scope="col">Area</th>
					<th scope="col">City</th>
					<th scope="col">State</th>
					<th scope="col">Zip</th>
					<th scope="col">Owner_id</th>
					<th scope="col">Fuel_type</th>
					<th scope="col">Gear</th>
					<th scope="col">Available</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>
		
			</tbody>
				<% for(int i=0; i<vehicleList.size(); i++){ %>
					<% Vehicle vehicle = (Vehicle)vehicleList.get(i);%>
						<tr>
						<td><% out.println(vehicle.getV_id()); %></td>
						<td><% out.println(vehicle.getType()); %></td>
						<td><% out.println(vehicle.getModel()); %></td>
						<td><% out.println(vehicle.getColor()); %></td>
						<td><% out.println(vehicle.getReg_date()); %></td>
						<td><% out.println(vehicle.getImage()); %></td>
						<td><% out.println(vehicle.getPrice()); %></td>
						<td><% out.println(vehicle.getArea()); %></td>
						<td><% out.println(vehicle.getCity()); %></td>
						<td><% out.println(vehicle.getState()); %></td>
						<td><% out.println(vehicle.getZip()); %></td>
						<td><% out.println(vehicle.getOwner_id()); %></td>
						<td><% out.println(vehicle.getFuel_type()); %></td>
						<td><% out.println(vehicle.getGear()); %></td>
						<td><% out.println(vehicle.isAvail()); %></td>
						<td>
							<form action="/Vehicle/deletevehicle" method="POST">
								<input type="hidden" name="owner_id" value="<%= vehicle.getOwner_id() %>">
								<button type="submit" class="btn btn-danger" name="v_id" value="<%= vehicle.getV_id() %>">Delete</button>
							</formm>
						</td>
					</tr>
				<% } %>
			</tbody>
		</table>	
	<% } %>
            
    <h2>You can Register your vehicle for sale!</h2>
	<h3>Please fill the details below to register your vehicle</h3>

	<form action="/Vehicle/sell" method="POST">
		<label>Name: </label>
		<input type="text" name="name">
		<br><br><label>Address: </label>
		<textarea name="address" rows="3" cols="50"></textarea>
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