<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vehicle Management System</title>
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
            background-color: #EEEEEE;
            font-family: 'Poppins', sans-serif;
        }
        
        .navbar {
            background-color: #00ADB5 !important;
        }
            
		.logout {
			color: white;
			margin-right: 5rem;
			font-size: 1.1rem;
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
       
       .namehead {
       		font-family: 'Poppins', sans-serif !important;
       		font-size: 3rem;
       		margin-top: 2rem;
       		margin-left: 9rem;
       		color: #222831;
       }
       
       .card {
		    margin: 3rem 2rem;
		    object-fit: scale-down;
		    border-radius: 7%;
		    overflow: hidden;
		    box-shadow: 5px 5px 5px rgb(60, 81, 85);
		    transition-delay: 100ms;
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
       
       .card:hover{ 
		    transform: translateY(-5%);
		}
		
		.flight-img {
		    height: 11.8rem;
		}
		
		.go-btn {
		    background-color: #00ADB5;
		    color: white;
		}
		
		.go-btn:hover {
		    background-color: #3FC1C9;
		    color: white;
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
                    <a class="nav-link active act-cust" href="/Vehicle/dashboard">Dashboard</a>
                    </li>
                    <li class="nav-item">
                    	<a class="nav-link active" href="/Vehicle/car">Buy a Car</a>
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
	
    <h1 class="namehead">Welcome <%= name %></h1>
    
    
    <!-- Cards -->
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <div class="card" style="width: 18rem;">
            <img src="https://images.unsplash.com/photo-1597404294360-feeeda04612e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Y2FyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" class="card-img-top flight-img" alt="...">
            <div class="card-body">
              <h5 class="card-title">Cars</h5>
              <p class="card-text">View and Order Cars</p>
              <a href="/Vehicle/car" class="btn go-btn">Cars</a>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card" style="width: 18rem;">
            <img src="https://images.unsplash.com/photo-1558981403-c5f9899a28bc?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YmlrZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">Bikes</h5>
              <p class="card-text">View and Order Bikes</p>
              <a href="/Vehicle/bike" class="btn go-btn">Bikes</a>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card" style="width: 18rem;">
            <img src="https://images.unsplash.com/photo-1617724054780-ef6bd6b21e17?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FyJTIwb3duZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">Sell</h5>
              <p class="card-text">Sell Your Vehicle</p>
              <a href="/Vehicle/sell" class="btn go-btn">Sell</a>
            </div>
          </div>
        </div>
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