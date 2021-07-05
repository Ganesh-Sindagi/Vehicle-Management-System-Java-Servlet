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

<style>
	body {
	    /* background: linear-gradient(to right, #02aab0, #00cdac) !important; */
	    /* background: linear-gradient(to right, #2193b0, #6dd5ed); */
	    background: linear-gradient(to right, #d53369, #cbad6d);
	    margin: 0 !important;
	    padding: 0 !important;
	}
	
	*, *:after, *:before {
	    box-sizing: border-box;
	    margin: 0;
	    padding: 0;
	  }
	
	.img {
	    width: 100%;
	    height: 100vh;
	    position: absolute;
	    z-index: -1;
	    margin-top: 0px;
	}
	
	.card {
	    width: 50rem;
	    margin-top: 6rem;
	    margin-left: 22rem;
	    box-shadow: 5px 5px 5px rgba(29, 32, 32, 0) !important;
	    border-radius: 12px;
	    padding: 2rem;
	}
	
	.card-img {
	    width: 200px;
	    height: 200px;
	    border-radius: 50%;
	    margin-bottom: 1rem;
	    margin-left: 16rem;
	}
	
	nav{
	    background: linear-gradient(to right, #02aab0, #00cdac) !important;
	    font-family: 'Roboto', sans-serif;
	    box-shadow: 5px 5px 5px rgba(4, 20, 20, 0) !important;
	}
	
	.navbar-brand {
	    font-size: 2.8rem;
	    margin-left: 6rem;
	    color: #112d4e !important;
	    padding-top: 15px !important;
	}
	
	.mov-head {
	    font-family: 'Poppins', sans-serif;
	    text-align: center;
	    font-weight: 700;
	}
	
	.head2 {
	    font-family: 'Poppins', sans-serif;
	    text-align: center;
	    font-weight: 500;
	}
	
	.head3 {
	    font-family: 'Poppins', sans-serif;
	    text-align: center;
	    font-weight: 400;
	    margin-top: 10px;
	    margin-bottom: 20px;
	}
	
	.btn {
	    font-family: 'Poppins', sans-serif;
	    font-size: 18px;
	}
	
	.btn-dark {
	    padding-left: 1rem;
	    padding-right: 1rem;
	    margin-left: 14.5rem;
	}
	
	.btn-success {
	    padding-left: 1.8rem;
	    padding-right: 1.8rem;
	    margin-left: 2rem;
	}
	
	.fab {
	    padding-right: 10px;
	    font-size: 20px;
	}
	
	.btn-danger {
	    margin-left: 16.1rem;
	}
</style>

<body>
	<div class="card">
        <div class="card-body">
            <img src="https://images.unsplash.com/photo-1510883056135-32472f0e11b8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjZ8fGNhcnN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" class="card-img" alt="...">
            <h1 class="mov-head">Motor-Hub</h1>
            <h2 class="head2">Fast and Secure App to buy and sell<br> Cars and Bikes.</h2>
            <h3 class="head3">Register or Login</h3>
            <a href="/Vehicle/register"><button type="button" class="btn btn-dark">Register</button></a>
            <a href="/Vehicle/login"><button type="button" class="btn btn-success">Login</button></a><br><br>
        </div>
      </div>
</body>
</html>