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
	<% String code = request.getParameter("roomID"); %>
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
	
	<script>
		let songs = ["", "EverydayLife", "OldFriends", "BadGuy"];
		
	</script>
	
	<script>
		let artists = ["", "Coldplay", "Coldplay", "Billie Eilish"];
	</script>
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
					<select name="song-name" id="song-id" class="form-control">
						<option value="" selected disabled>-- Add a Song --</option>
						<option value="1"><%=song1 %></option>
						<option value="2"><%=song2 %></option>
						<option value="3"><%=song3 %></option>
					</select>
					
					<input type="hidden" id="username" name="username" value="<%=username%>">
				</div>
				<div class="col-2">
					<button id="submit"  onclick = "return addSong()" type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div> <!-- .form-group -->
		</form>
	</div> 
	
	<div id="songaudio">
		<!-- <audio controls>
			<source src="BadGuy.mp3" type="audio/mpeg">
		</audio> -->
	</div>
	
	<div id="queue">
		<ol id = "my-list">
		
			<%-- <div class="row justify-content-center">
				<div class="col-6">
					<!-- <li> -->
						<%=song1 %> 
						<%=artist1 %>
				</div>
				
				<div class="score col-2">
					<div class="triangle-up"></div>
					<div class="count"><%=count2%></div>
					<div class="triangle-down"></div>
				</div> --%>
<!-- 	 				</li>
 --> 		<%-- </div>
 			
 			<div class="row justify-content-center">
				<div class="col-6">
					<!-- <li> -->
						<%=song2 %> 
						<%=artist2 %>
				</div>
						<div class="score col-2">
							<div class="triangle-up"></div>
							<div class="count"><%=count2%></div>
							<div class="triangle-down"></div>
						</div> --%>
<!-- 	 				</li> -->
  			<!-- </div> -->
			<%-- 
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
 			</div--%>
		</ol>
	</div>
	<script>
	function addSong(){
		console.log("add song js");
		
		var type;
		var xhttp = new XMLHttpRequest();
		xhttp.open("GET", "MainServlet?username=" + "john" + "&type=" + "ADD_SONG" + "&pageName=start" + "&playList=" +  "U45XYgJk" + "&songName=" + document.querySelector("#song-id").value, false);
		xhttp.send();
		var allSongs = xhttp.responseText.trim();
		
		var xhttp = new XMLHttpRequest();
		xhttp.open("GET", "addSongServlet?username=" + document.querySelector("#username").value + "&song-name=" + document.querySelector("#song-id").value , false);
		xhttp.send();
		
		var songsFromServlet = xhttp.responseText.trim();
		console.log(songsFromServlet);
		if(xhttp.responseText.trim().length > 0){
			//document.querySelector("#response").innerHTML = songsFromServlet;
			//var array = songsFromServlet.split("&");
			var array = allSongs.split(",");
			console.log(array);
			let orderedList = document.querySelector("#my-list");
			/* while(orderedList.hasChildNodes()) {
				orderedList.removeChild(orderedList.lastChild);
			} */
			for(let i = array.length-2; i < array.length; i++) {
				if(array[i] == "") {
					continue;
				}
				console.log("ADDING NEW ELEMENT WITH NAME: " + songs[array[i]]);
				let listItem = document.createElement("div");
				listItem.setAttribute("class","row justify-content-center");
				
				let songdiv = document.createElement("div");
				songdiv.setAttribute("class", "col-6 hi");
				songdiv.innerHTML = songs[parseInt(array[i])];
				songdiv.innerHTML += " by " + artists[parseInt(array[i])];
				
				let votediv = document.createElement("div");
				votediv.setAttribute("class","score col-2");
				
				let triangle = document.createElement("div");
				triangle.setAttribute("class","triangle-up");
				
				let count = document.createElement("div");
				count.setAttribute("class", "count");
				
				count.innerHTML = 0;
				
				votediv.append(triangle);
				votediv.append(count); 
			
				listItem.append(songdiv);
				listItem.append(votediv);
				
				orderedList.append(listItem);
				
				if(i == 0){
					var audiodiv = document.querySelector("#songaudio");
					var audioelement = document.createElement("audio");
					var songmp3 = songs[array[i]]+".mp3";
					
					audioelement.controls = true;
					audioelement.setAttribute("src", songmp3); 
					
					audiodiv.append(audioelement);
				}
			}
			
			let triangle = document.querySelectorAll(".triangle-up");
			let count = document.querySelectorAll(".count");
			
			for(let j = 0; j < triangle.length; j++){
				triangle[j].onclick = function(){	
					let temp = parseInt(count[j].innerHTML);
					let a = "hello";
					let title0 = document.querySelectorAll(".hi");
					console.log("check");
					for(let w = 0; w < title0.length; w++){
						//alert("1");
						if(w == j){
							console.log("worked");
							a = title0[w].innerHTML;
						}
					}
					console.log(a);
					
					let songName = a.split(" by ");
					console.log(songName, " ", songName[0]);
					
					let idx = songs.indexOf(songName[0]);
					console.log(idx);
					
					var type;
					var xhttp = new XMLHttpRequest();
					xhttp.open("GET", "MainServlet?username=" + "john" + "&type=" + "UP_VOTE" + "&pageName=start" + "&playList=" +  "U45XYgJk" + "&songName=" + idx, false);
					xhttp.send();
					var allSongs = xhttp.responseText.trim();
					
					var array = allSongs.split(",");
					console.log(array);
					let orderedList = document.querySelector("#my-list");
					
					let title = document.querySelectorAll(".hi");
					for(let k = 0; k < title.length; k++){
						title[k].innerHTML = songs[parseInt(array[k])];
						title[k].innerHTML += " by " + artists[parseInt(array[k])];
					}
					
					var type;
					var xhttp = new XMLHttpRequest();
					xhttp.open("GET", "MainServlet?username=" + "john" + "&type=" + "GET_NUM" + "&pageName=start" + "&playList=" +  "U45XYgJk", false);
					xhttp.send();
					var allNum = xhttp.responseText.trim();
					var array1 = allNum.split(",");
					console.log(array1);
					
					let countNum = document.querySelectorAll(".count");
					for(let p = 0; p < countNum.length; p++){
						countNum[p].innerHTML = parseInt(array1[p]);
					}
					//count[j].innerHTML = temp + 1;
				} 
			}  
		
			
			return false;
		}
		
		
		
		
		
	}
	</script>
	
</body>
</html>
