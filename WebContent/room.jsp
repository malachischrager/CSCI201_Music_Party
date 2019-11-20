<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room</title>
	<link rel="stylesheet" type="text/css" href="room.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Bungee+Shade&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Tomorrow&display=swap" rel="stylesheet">
	
</head>
<body>
	<% String username = "John"; %>
	<% String code = "U45XYgJk"; %>
	<% String person = "User"; %>
	<% String song1= "song1"; %>
	<% String song2= "song2"; %>
	<% String song3= "song3"; %>
	
	<% String count1= "19"; %>
	<% String count2= "9"; %>
	<% String count3= "-4"; %>
	
	<% String artist1= "artist1"; %>
	<% String artist2= "artist2"; %>
	<% String artist3= "artist3"; %>
	
	<div id="header_row">
		<div id="code" class="border-3 col-3 rounded">
			<h5>Room Code</h5>
			<h5><%=code %></h5>
		</div>
		
		
		<h1 class="col-6"><%=username %>'s Room</h1>
		
		<div id="view" class="col-3 border-3 rounded">
			<h5><%=person %> View</h5>
		</div>
	</div> 
	
	<div class="clearfloat"></div>
	<div id="form" class="mt-5 mb-5">
		<form action="" method="">
			<div class="form-group row justify-content-center">
				<div class="col-5">
					<select name="sound_id" id="sound-id" class="form-control">
						<option value="" selected disabled>-- Add a Song --</option>
						<option value=<%=song1 %>><%=song1 %></option>
						<option value=<%=song2 %>><%=song2 %></option>
						<option value=<%=song3 %>><%=song3 %></option>
					</select>
				</div>
				<div class="col-2">
					<button id="submit" type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div> <!-- .form-group -->
		</form>
	</div> 
	
	<div id="queue">
		<ol>
			<div class="row justify-content-center">
				<div class="col-6">
					<li>
						<%=song1 %> 
						<%=artist1 %>
				</div>
						<div class="score col-2">
							<div class="triangle-up"></div>
							<div class="count"><%=count1%></div>
							<div class="triangle-down"></div>
						</div>
	 				</li>
 			</div>
 			
 			<div class="row justify-content-center">
				<div class="col-6">
					<li>
						<%=song2 %> 
						<%=artist2 %>
				</div>
						<div class="score col-2">
							<div class="triangle-up"></div>
							<div class="count"><%=count2%></div>
							<div class="triangle-down"></div>
						</div>
	 				</li>
 			</div>
			
			<div class="row justify-content-center">
				<div class="col-6">
					<li>
						<%=song3 %> 
						<%=artist3 %>
				</div>
						<div class="score col-2">
							<div class="triangle-up"></div>
							<div class="count"><%=count3%></div>
							<div class="triangle-down"></div>
						</div>
	 				</li>
 			</div>
		</ol>
	</div>
	
	
</body>
</html>