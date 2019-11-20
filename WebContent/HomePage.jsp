<!DOCTYPE html>
<html>
	<head>
		<title>Music Party Home</title>		
		<link rel="stylesheet" type="text/css" href="HomePage.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
		<link href="https://fonts.googleapis.com/css?family=Bungee+Shade&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Tomorrow&display=swap" rel="stylesheet">
	</head>
	<body>
		
		<div id="header">
			<h1>Music Party</h1>
		</div>
		<div id="page">
		
			<div class="row justify-content-center" id="login">
          		<button onclick="window.location.href = 'Login.jsp';" type="submit" class="btn btn-dark"> Login</button>
          	</div>
          	<div = class="row justify-content-center" id="register">
          		<button onclick="window.location.href = 'Register.jsp';" type="submit" class="btn btn-dark"> Register</button>
          	</div>
          	
          	<form action="HomeServlet" method="GET" class="row justify-content-center" id="join-room">
          	
          		<input type="text" name="join" class="form-control col-2" placeholder="Room ID" id="form-input">
            		
            	<div class="col-1 offset-3">
           		<button type="submit" class="btn btn-dark" id="join-button">Join </button>
           		</div>
          	</form>
	    </div>
	</body>
</html>