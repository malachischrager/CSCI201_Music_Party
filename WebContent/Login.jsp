<!DOCTYPE html>
<html>
	<head>
		<title>Log In Music Party</title>		
		<link rel="stylesheet" type="text/css" href="test.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	</head>
	<body>
		
		<div id="header">
			<h1>Log In</h1>
		</div>
		<div id="page">
          	
          	<form action="HomeServlet" method="GET" class="container" id="join-room">
          	
          		<div class="row justify-content-center form-input">
          			<input type="text" name="username" class="form-control col-4" placeholder="Username">
          		</div>
          		<div class="row justify-content-center form-input">
          			<input type="password" name="password" class="form-control col-4" placeholder="Password">
          		</div>            		
            	<div class="row justify-content-center">
           			<button type="submit" class="btn btn-dark col-1" id="join-button">Submit</button>
           		</div>
          	</form>	
	    </div>
	</body>
</html>