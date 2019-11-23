<!DOCTYPE html>
<html>
	<head>
		<title>Music Party Join or Start Room</title>		
		<link rel="stylesheet" type="text/css" href="HomePage.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
		<link href="https://fonts.googleapis.com/css?family=Bungee+Shade&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Tomorrow&display=swap" rel="stylesheet">
	</head>
	<body>
		
		<div id="header">
			<h1>Join or Start a Room</h1>
		</div>
		<div id="page">
		
			<form action="room_join.jsp" method="GET" class="row justify-content-center" id="join-room">
	          	
	        	<input type="text" name="join" class="form-control col-2" placeholder="Room ID" id="form-input">
	          		
	          	<div class="col-1 offset-3">
	        		<button type="submit" class="btn btn-dark" id="join-button">Join </button>
	        	</div>
	        </form>
	        
	        <form action="room_start.jsp" method="GET" class="row justify-content-center" id="join-room">
	          	
	          	<input type="text" name="join" class="form-control col-2" placeholder="Room ID" id="form-input">
	            		
	            <div class="col-1 offset-3">
	           		<button type="submit" class="btn btn-dark" id="join-button">Start </button>
	           	</div>
	        </form>
	    </div>
	</body>
</html>