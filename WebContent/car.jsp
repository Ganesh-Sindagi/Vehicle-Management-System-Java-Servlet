<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.ArrayList" %>
 <%@page import="com.vehicle.Vehicle" %>
 <%@page import="com.vehicle.Area" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cars</title>
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

    <h1>Welcome <%=name%></h1>
    <h1>This is the car section</h1>
    
    <h3>Filters</h3>
    <form action="/Vehicle/filterpricecar" method="POST">
    	<p>Rs 10L</p>
	    <label for="customRange2" class="form-label">Select Price Range</label>
		<input name="price_range" type="range" class="form-range" min="100000" max="10000000" step="5000" value="5000000" id="customRange2" onChange="this.form.submit()">
		<p>Rs 1 Crore</p>
    </form>
    
    <form action="/Vehicle/filterareacar" method="POST">
    	<p>Filter By Area</p>
    	<% ArrayList<Area> areaList = (ArrayList)request.getAttribute("areaList"); %>
    	<% if(!areaList.isEmpty()){ %>
    		<% for(int i=0; i<areaList.size(); i++){ %>
    			<% Area area = (Area)areaList.get(i); %>
    			<div class="form-check">
					<input name="area" class="form-check-input" type="checkbox" value="<%= area.getArea() %>" id="flexCheckDefault" onChange="this.form.submit()">
					<label class="form-check-label" for="flexCheckDefault">
					    <% out.println(area.getArea()); %>
					</label>
				</div>
    		<% } %>
    	<% } %>
    </form>
    
    
    <% ArrayList<Vehicle> carList = (ArrayList)request.getAttribute("carList"); %>
    
    <h2>Available cars <%=carList.size()%></h2>
    
    <% if(!carList.isEmpty()) { %>
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
       			<% for(int i=0; i<carList.size(); i++){ %>
       	    		<% Vehicle car = (Vehicle)carList.get(i); %>
       	    		<tr>
						<td><% out.println(car.getV_id()); %></td>
						<td><% out.println(car.getType()); %></td>
						<td><% out.println(car.getModel()); %></td>
						<td><% out.println(car.getColor()); %></td>
						<td><% out.println(car.getReg_date()); %></td>
						<td><img src="<% out.println(car.getImage()); %>"></td>
						<td><% out.println(car.getPrice()); %></td>
						<td><% out.println(car.getArea()); %></td>
						<td><% out.println(car.getCity()); %></td>
						<td><% out.println(car.getState()); %></td>
						<td><% out.println(car.getZip()); %></td>
						<td><% out.println(car.getOwner_id()); %></td>
						<td><% out.println(car.getFuel_type()); %></td>
						<td><% out.println(car.getGear()); %></td>
						<td><% out.println(car.isAvail()); %></td>
						<td>
							<form action="/Vehicle/book" method="POST">
								<input type="hidden" name="owner_id" value="<%= car.getOwner_id() %>">
								<button type="submit" class="btn btn-dark" name="v_id" value="<%= car.getV_id() %>">Book</button>
							</form>
						</td>
					</tr>
       	    	<% } %>
       	    	</tbody>
       	    </table>
       <% } %>
 
</body>
</html>