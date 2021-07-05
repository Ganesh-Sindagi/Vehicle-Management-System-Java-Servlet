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
<title>Cars</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&family=Ubuntu:wght@700&display=swap" rel="stylesheet">
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    	if(session.getAttribute("user_id") == null)
	    		response.sendRedirect("/Vehicle/login");
	  
	    	session = request.getSession();
	    	String name = (String)session.getAttribute("name");
	%>

	<style>
    	body {
            /* background-color: #EEEEEE; */
            font-family: 'Poppins', sans-serif;
        }
        
        .navbar {
            background-color: #00ADB5 !important;
        }
            
		.logout {
			color: white;
			margin-right: 5rem;
		}
        
        .navbar-brand {
        	margin-left: 5rem !important;
        	font-family: 'Poppins', sans-serif !important;
        	font-size: 2.5rem !important;
        }
        
        .act-cust {
        	color: #D6E4F0!important;
        	border-bottom: 4px solid white !important;
        }
       
       .nav-item {
       		font-family: 'Poppins', sans-serif !important;
       		font-size: 1.2rem;
       		margin-left: 1rem;
       }
       
       .nav-link {
       		/*color: white !important;*/
       }
       
       /* Styles for filers */
	   .form-range {
		   width: 80%;
	   } 
       
	   .filters-div {
		   margin-left: 20px;
	   }
	   
	   .nav-name {
			color: #F8F3D4 !important;
		}
		
		.vehicle-card {
			width: 65.5rem;
			margin-top: 2rem;
			border-radius: 10px;
			box-shadow: 5px 5px 5px rgb(60, 81, 85);
		}
		
		.veh-img {
			width: 500px;
			height: 300px;
			border-radius: 30px;
			margin-left: 10rem;
		}
		
		.card-head {
			margin-top: 20px;
		}
		
		.book-btn {
			margin-left: 25rem;
		}
		
		.table {
			margin-top: 20px;
		}
		
    </style>
	
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">MotorHub</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                    <a class="nav-link active" href="/Vehicle/dashboard">Dashboard</a>
                    </li>
                    <li class="nav-item">
                    	<a class="nav-link active act-cust" href="/Vehicle/car">Buy a Car</a>
                    </li>
                    <li class="nav-item">
                    	<a class="nav-link active" href="/Vehicle/bike">Buy a Bike</a>
                    </li>
                    <li class="nav-item">
                    	<a class="nav-link active" href="/Vehicle/sell">Sell your vehicle</a>
                    </li>
                    <li class="nav-item">
                    	<a class="nav-link active" href="/Vehicle/orders">My Orders</a>
                    </li>
                    <li class="nav-item">
                    	<a class="nav-link active nav-name"><%= name %></a>
                    </li>
                </ul>
                <a href="/Vehicle/logout"><Button class="btn btn-danger logout">Logout</Button></a><br /><br />
            </div>
        </div>
     </nav>
     
    
    <div class="container-fluid">
	  <div class="row">
	    <div class="col-md-3">
	      <div class="filters-div">
	      
	      <h3 style="margin-top: 2rem;">Filters</h3>
	      <p>Filter By Price</p>
		    <form action="/Vehicle/filterpricecar" method="POST">
			    <label for="customRange2" class="form-label">Select Price Range</label>
				<input name="price_range" type="range" class="form-range" min="100000" max="10000000" step="5000" value="5000000" id="customRange2" onChange="this.form.submit()">
				<p>Rs 10L<span style="margin-left: 9rem;">Rs 1 Crore</</span></p>
		    </form>
		    
		    <form action="/Vehicle/filterareacar" method="POST">
		    	<p style="margin-top: 30px;">Filter By Area</p>
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
		    
		    <form action="/Vehicle/filtercitycar" method="POST">
		    	<p style="margin-top: 30px;">Filter By City</p>
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
		    
		    <form action="/Vehicle/filterstatecar" method="POST">
		    	<p style="margin-top: 30px;">Filter By State</p>
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
		    
		    <form action="/Vehicle/filterzipcar" method="POST">
		    	<p style="margin-top: 30px;">Filter By Zip</p>
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
	      </div>
	    </div>
	    
	    
	    <div class="col-md-9">
			<% ArrayList<Vehicle> carList = (ArrayList)request.getAttribute("carList"); %>
			<h2 class="card-head">Available cars <%=carList.size()%></h2>
    
   			<% if(!carList.isEmpty()) { %>
				<% for(int i=0; i<carList.size(); i++){ %>
					<% Vehicle car = (Vehicle)carList.get(i); %>
					<div class="card vehicle-card">
						<div class="card-body">
							<div class="row">
								<div class="col-md-12">
									<img class="veh-img" src="<% out.println(car.getImage()); %>">
								</div>
								
							</div>
							
							<table class="table table-hover table-borderless">
								<div class="row">
									<div class="col-md-12">
										<thead>
											<tr>
												<th scope="col">Vehicle_id</th>
												<th scope="col">Type</th>
												<th scope="col">Model</th>
												<th scope="col">Color</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><% out.println(car.getV_id()); %></td>
												<td><% out.println(car.getType()); %></td>
												<td><% out.println(car.getModel()); %></td>
												<td><% out.println(car.getColor()); %></td>
											</tr>
										</tbody>		
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
										<thead>
											<tr>
												<th scope="col">Reg. Date</th>
												<th scope="col">Price</th>
												<th scope="col">Area</th>
												<th scope="col">City</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><% out.println(car.getReg_date()); %></td>
												<td><% out.println(car.getPrice()); %></td>
												<td><% out.println(car.getArea()); %></td>
												<td><% out.println(car.getCity()); %></td>
											</tr>
										</tbody>		
									</div>
								</div>


								<div class="row">
									<div class="col-md-12">
										<thead>
											<tr>
												<th scope="col">State</th>
												<th scope="col">Zip</th>
												<th scope="col">Owner_id</th>
												<th scope="col">Fuel_type</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><% out.println(car.getState()); %></td>
												<td><% out.println(car.getZip()); %></td>
												<td><% out.println(car.getOwner_id()); %></td>
												<td><% out.println(car.getFuel_type()); %></td>
											</tr>
										</tbody>		
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
										<thead>
											<tr>
												<th scope="col">Gear</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><% out.println(car.getGear()); %></td>
											</tr>
										</tbody>		
									</div>
								</div>
							</table>
							<div class="row">
								<div class="col-md-12">
									<form action="/Vehicle/book" method="POST">
										<input type="hidden" name="owner_id" value="<%= car.getOwner_id() %>">
										<button type="submit" class="btn btn-dark book-btn" name="v_id" value="<%= car.getV_id() %>">Book Vehicle</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				<% } %>
			<% } %>
		</div>
	</div>
 
</body>
</html>