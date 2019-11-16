<!DOCTYPE html>
<html>
	<head>
		<title>Register Music Party</title>		
		<link rel="stylesheet" type="text/css" href="test.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	</head>
	<body>
		
		<div id="header">
			<h1>Create an Account</h1>
		</div>
		<div id="page">
		
			<div id=error_mesg></div>
          	
          	<form name="reg" onsubmit="return validate();" method="GET" class="container" id="join-room">
          	
          		<div class="row justify-content-center form-input">
          			<input type="text" name="user" class="form-control col-4" placeholder="Username">
          		</div>
          		<div class="row justify-content-center form-input">
          			<input type="password" name="password" class="form-control col-4" placeholder="Password">
          		</div>
          		<div class="row justify-content-center form-input">
          			<input type="password" name="confirm" class="form-control col-4" placeholder="confirm password">
          		</div>
          		
            		
            	<div class="row justify-content-center">
           			<button type="submit" class="btn btn-dark col-1" id="join-button">Submit</button>
           		</div>
          	</form>	
	    </div>
	</body>
	<script>
	
		function validate() {
			
			console.log("in validate");
			
			var type;
		    var xhttp = new XMLHttpRequest();
		    xhttp.open("GET", "Verify?username=" + document.reg.user.value + "&password=" + document.reg.password.value + "&confirm=" + document.reg.confirm.value + "&type=" + "reg", false);
		    xhttp.send();
		    if(xhttp.responseText.trim().length > 0) {
			    document.getElementById("error_msg").innerHTML = xhttp.responseText;
			    document.getElementById("error_msg").style.color = "red";
			    return false;
		    }
		    sessionStorage.setItem("loggedIn", "1");
		    sessionStorage.setItem("currUser", document.reg.user.value);
		    return true;
			
			
		}
	</script>
</html>