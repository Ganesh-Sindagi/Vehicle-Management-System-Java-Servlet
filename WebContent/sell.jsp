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
       
       .nav-name {
			color: #F8F3D4 !important;
		}
		
		.vehicle-vehicled {
			width: 65.5rem;
			margin-top: 2rem;
			border-radius: 10px;
			box-shadow: 5px 5px 5px rgb(60, 81, 85);
			margin-left: 15rem;
		}
		
		.veh-img {
			width: 500px;
			height: 300px;
			border-radius: 30px;
			margin-left: 10rem;
		}
		
		.vehicled-head {
			margin-top: 20px;
			margin-left: 15rem;
		}
		
		.book-btn {
			margin-left: 25rem;
			margin-bottom: 1rem;
		}
		
		.table {
			margin-top: 20px;
		}
		
		.reg-form {
			width: 65.5rem;
			margin-top: 2rem;
			border-radius: 10px;
			box-shadow: 5px 5px 5px rgb(60, 81, 85);
			margin-left: 15rem;
			padding: 1rem 2rem 1rem;
		}
       
       .form-control {
       		width: 50%;
       }
       
       .form-select {
       		width: 50% !important;
       }
       
       	/* Footer Section */

		#ganesh {
		    font-family: 'Ubuntu', sans-serif;
		    font-size: 20px;
		    padding-bottom: 20px;
		    margin-left: 3rem;
		}
		
		.fth {
		    margin-top: 70px;
		}
		
		.footer {
		    position: absolute;
		    margin-top: 2rem;
		}
		
		.footer-item {
		    padding-top: 10px;
		    margin-left: 550px;
		}
		
		.social-icon {
		    color: #000;
		    margin-left: 50px;
		    font-size: 30px;
		    padding-bottom: 20px;
		}
		
		#copyright {
		    font-family: 'Ubuntu', sans-serif;
		    font-size: 16px;
		    margin-left: 80px;
		}
		
		.nav-name {
			color: #F8F3D4 !important;
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
                    	<a class="nav-link active" href="/Vehicle/car">Buy a Car</a>
                    </li>
                    <li class="nav-item">
                    	<a class="nav-link active" href="/Vehicle/bike">Buy a Bike</a>
                    </li>
                    <li class="nav-item">
                    	<a class="nav-link active act-cust" href="/Vehicle/sell">Sell your vehicle</a>
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
	
	<div class="vehicled">
	  <div class="vehicled-body">
	    
	    <div class="row">
	    	
	    	<div class="col-md-9">
			<% ArrayList<Vehicle> vehicleList = (ArrayList)request.getAttribute("vehicleList"); %>
			<h2 class="vehicled-head">Your vehicles: <%=vehicleList.size()%></h2>
    
   			<% if(!vehicleList.isEmpty()) { %>
				<% for(int i=0; i<vehicleList.size(); i++){ %>
					<% Vehicle vehicle = (Vehicle)vehicleList.get(i); %>
					<div class="vehicled vehicle-vehicled">
						<div class="vehicled-body">
							<div class="row">
								<div class="col-md-12">
									<img class="veh-img" src="<% out.println(vehicle.getImage()); %>">
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
												<td><% out.println(vehicle.getV_id()); %></td>
												<td><% out.println(vehicle.getType()); %></td>
												<td><% out.println(vehicle.getModel()); %></td>
												<td><% out.println(vehicle.getColor()); %></td>
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
												<td><% out.println(vehicle.getReg_date()); %></td>
												<td><% out.println(vehicle.getPrice()); %></td>
												<td><% out.println(vehicle.getArea()); %></td>
												<td><% out.println(vehicle.getCity()); %></td>
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
												<td><% out.println(vehicle.getState()); %></td>
												<td><% out.println(vehicle.getZip()); %></td>
												<td><% out.println(vehicle.getOwner_id()); %></td>
												<td><% out.println(vehicle.getFuel_type()); %></td>
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
												<td><% out.println(vehicle.getGear()); %></td>
											</tr>
										</tbody>		
									</div>
								</div>
							</table>
							<div class="row">
								<div class="col-md-12">
									<form action="/Vehicle/deletevehicle" method="POST">
										<input type="hidden" name="owner_id" value="<%= vehicle.getOwner_id() %>">
										<button type="submit" class="btn btn-danger book-btn" name="v_id" value="<%= vehicle.getV_id() %>">Delete</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				<% } %>
			<% } %>
		</div>
	    	
	    </div>
	    
	  </div>
	</div>

    <div class="card reg-form">
	  <div class="card-body">
	    <h2>You can Register your vehicle for sale!</h2>
		<h3>Please fill the details below to register your vehicle</h3>
		
		<form action="/Vehicle/sell" method="POST">
			<label class="form-label">Name: </label>
			<input class="form-control" type="text" name="name" required>
			<br><br><label class="form-label">Address: </label>
			<textarea name="address" rows="4" cols="50" class="form-control" required></textarea>
			<br><br><label class="form-label">Phone: </label>
			<input type="tel" name="phone" class="form-control" required>
			<br><br><label class="form-label">Email: </label>
			<input type="email" name="email" class="form-control" required>
	
			<br><p>Your Vehicle Detail</p>
	
			<label class="form-label">Type: </label>
			<select name="type" class="form-select">
				<option value="2">2 Wheeler</option>
				<option value="4">4 Wheeler</option>
			</select>
			<br><br><label class="form-label">Model: </label>
			<input type="text" name="model" class="form-control" required>
			<br><br><label class="form-label">Color: </label>
			<input type="text" name="color" class="form-control" required>
			<br><br><label class="form-label">Registration Date: </label>
			<input type="date" name="reg_date" class="form-control" required>
			<br><br><label class="form-label">Image URL: </label>
			<input type="text" name="image" class="form-control" required>
			<br><br><label class="form-label">Price: </label>
			<input type="text" name="price" class="form-control" required>
			<br><br><label class="form-label">Area: </label>
			<input type="text" name="area" class="form-control" required>
			<br><br><label class="form-label">City: </label>
			<input type="text" name="city" class="form-control" required>
			<br><br><label class="form-label">State: </label>
			<input type="text" name="state" class="form-control" required>
			<br><br><label class="form-label">Zip: </label>
			<input type="text" name="zip" class="form-control" required>
			<br><br><label class="form-label">Fuel_type: </label>
			<input type="text" name="fuel_type" class="form-control" required>
			<br><br><label class="form-label">Gear: </label>
			<input type="text" name="gear" class="form-control" required>
			<br><br>
			<button type="submit" class="btn btn-success">Register Vehicle</button>
		</form>
		
		
	  </div>
	</div>
            
    
	<!-- Footer -->
    <footer class="footer">
        <div class="footer-item">
        <h1 id="ganesh">Developed by Ganesh Sindagi</h1>
        <a href="https://www.facebook.com/ganesh.sindagi.3"><i class="social-icon fab fa-facebook-f"></i></a>
        <a href="https://twitter.com/GaneshSindagi"><i class="social-icon fab fa-twitter"></i></a>
        <a href="https://www.instagram.com/ganesh_sindagi/"><i class="social-icon fab fa-instagram"></i></a>
        <a href = "mailto:ganeshsindagi7@gmail.com"><i class="social-icon fas fa-envelope"></i></a>
        <p id="copyright">Copyright 2020 MotorHub</p>
        </div>
    </footer>

    <!-- jQuery and JS bundle w/ Popper.js -->
    <script src="https://kit.fontawesome.com/b6a0edf9cb.js" crossorigin="anonymous"></script>
    
    <!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
</body>
</html>