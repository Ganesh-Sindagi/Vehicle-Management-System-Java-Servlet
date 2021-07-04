<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList" %>
<%@page import="com.vehicle.Vehicle" %>
<%@page import="com.vehicle.Area" %>
<%@page import="com.vehicle.City" %>
<%@page import="com.vehicle.State" %>
<%@page import="com.vehicle.Zip" %>  
 
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
    
    <h3>Filters</h3>
    <form action="/Vehicle/filterpricebike" method="POST">
    	<p>Rs 10K</p>
	    <label for="customRange2" class="form-label">Select Price Range</label>
		<input name="price_range" type="range" class="form-range" min="10000" max="1000000" step="5000" value="200000" id="customRange2" onChange="this.form.submit()">
		<p>Rs 10Lakh</p>
    </form>
    
    <form action="/Vehicle/filterareabike" method="POST">
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
    
    <form action="/Vehicle/filtercitybike" method="POST">
    	<p>Filter By City</p>
    	<% ArrayList<City> cityList = (ArrayList)request.getAttribute("cityList"); %>
    	<% if(!cityList.isEmpty()){ %>
    		<% for(int i=0; i<cityList.size(); i++){ %>
    			<% City city = (City)cityList.get(i); %>
    			<div class="form-check">
					<input name="city" class="form-check-input" type="checkbox" value="<%= city.getCity() %>" id="flexCheckDefault" onChange="this.form.submit()">
					<label class="form-check-label" for="flexCheckDefault">
					    <% out.println(city.getCity()); %>
					</label>
				</div>
    		<% } %>
    	<% } %>
    </form>
    
    <form action="/Vehicle/filterstatebike" method="POST">
    	<p>Filter By State</p>
    	<% ArrayList<State> stateList = (ArrayList)request.getAttribute("stateList"); %>
    	<% if(!stateList.isEmpty()){ %>
    		<% for(int i=0; i<stateList.size(); i++){ %>
    			<% State state = (State)stateList.get(i); %>
    			<div class="form-check">
					<input name="state" class="form-check-input" type="checkbox" value="<%= state.getState() %>" id="flexCheckDefault" onChange="this.form.submit()">
					<label class="form-check-label" for="flexCheckDefault">
					    <% out.println(state.getState()); %>
					</label>
				</div>
    		<% } %>
    	<% } %>
    </form>
    
    <form action="/Vehicle/filterzipbike" method="POST">
    	<p>Filter By Zip</p>
    	<% ArrayList<Zip> zipList = (ArrayList)request.getAttribute("zipList"); %>
    	<% if(!zipList.isEmpty()){ %>
    		<% for(int i=0; i<zipList.size(); i++){ %>
    			<% Zip zip = (Zip)zipList.get(i); %>
    			<div class="form-check">
					<input name="zip" class="form-check-input" type="checkbox" value="<%= zip.getZip() %>" id="flexCheckDefault" onChange="this.form.submit()">
					<label class="form-check-label" for="flexCheckDefault">
					    <% out.println(zip.getZip()); %>
					</label>
				</div>
    		<% } %>
    	<% } %>
    </form>
    
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
					<td><img src="<% out.println(bike.getImage()); %>"></td>
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