<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.ArrayList" %>
 <%@page import="com.vehicle.Vehicle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
    
    <% if(!bikeList.isEmpty()) { %>
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
					<th scope="col">Book</th>
				</tr>
			</thead>
			
			<tbody>
      		<% for(int i=0; i<bikeList.size(); i++){ %>
      	    	<% Vehicle bike = (Vehicle)bikeList.get(i); %>
				<tr>
					<td><% out.println(bike.getV_id()); %></td>
					<td><% out.println(bike.getType()); %></td>
					<td><% out.println(bike.getModel()); %></td>
					<td><% out.println(bike.getColor()); %></td>
					<td><% out.println(bike.getReg_date()); %></td>
					<td><% out.println(bike.getImage()); %></td>
					<td><% out.println(bike.getPrice()); %></td>
					<td><% out.println(bike.getArea()); %></td>
					<td><% out.println(bike.getCity()); %></td>
					<td><% out.println(bike.getState()); %></td>
					<td><% out.println(bike.getZip()); %></td>
					<td><% out.println(bike.getOwner_id()); %></td>
					<td><% out.println(bike.getFuel_type()); %></td>
					<td><% out.println(bike.getGear()); %></td>
					<td><% out.println(bike.isAvail()); %></td>
					<td>	
						<form action="/Vehicle/book" method="POST">
							<input type="hidden" name="owner_id" value="<%= bike.getOwner_id() %>">
							<button type="submit" class="btn btn-dark" name="v_id" value="<%= bike.getV_id() %>">Book</button>
						</form>
					</td>
				</tr>
       	    	<% } %>
       	    	</tbody>
       	</table>
    <% } %>


</body>
</html>