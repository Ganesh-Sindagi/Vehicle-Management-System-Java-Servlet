<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&family=Ubuntu:wght@700&display=swap" rel="stylesheet">
</head>

<style>
	body {
	    background: linear-gradient(to right, #d53369, #cbad6d);
	}
	
	.card {
	    margin-top: 9rem;
	    width: 50rem;
	    height: 30rem;
	    padding: 1rem;
	    margin-left: 35rem;
	    font-family: 'Poppins', sans-serif;
	}
	
	.card-title {
	    font-weight: 700;
	    font-size: 2.5rem;
	}
	
	#emaillabel {
	    margin-top: 1rem;
	    font-weight: 500;
	    font-size: 1.5rem;
	}
	
	#exampleInputEmail1 {
	    margin-top: 5px;
	    font-weight: 500;
	}
	
	#exampleInputPassword1 {
	    margin-top: 5px;
	}
	
	#plabel {
	    margin-top: 1rem;
	    font-weight: 500;
	    font-size: 1.5rem;
	}
	
	.btn-dark {
	    font-weight: 500;
	    margin-top: 1.5rem;
	    margin-bottom: 10px;
	} 
	
	.btn-success {
	    font-weight: 500;
	} 
</style>

<body>
    
    <div class="card" style="width: 23rem;">
        <div class="card-body">
          <h5 class="card-title">Register</h5>

          <form action="/Vehicle/register" method="POST">
            <div class="form-group">
              <label>Name</label>
              <input name="name" type="text" class="form-control" required>
            </div>
            <div class="form-group">
              <label id="emaillabel" for="exampleInputEmail1">Email</label>
              <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
              <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
            <div class="form-group">
              <label id="plabel" for="exampleInputPassword1">Password</label>
              <input name="password" type="password" class="form-control" id="exampleInputPassword1" required>
            </div>
            <button id="signup" type="submit" class="btn btn-dark">Register</button>
          </form>
        </div>
    </div>
   
</body>
</html>