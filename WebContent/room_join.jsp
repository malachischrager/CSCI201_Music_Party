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
<body onload = "addST()">
	<% String username = "Bob"; %>
	<% String code = "U45"; %>
	<% String person = "Guest"; %>
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
		let songs = ["", "EverydayLife", "OldFriends", "BadGuy", "CryCryCry"];
		
	</script>
	
	<script>
		let artists = ["", "Coldplay", "Coldplay", "Billie Eilish", "Coldplay"];
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
	<%-- <div id="form" class="mt-5 mb-5">
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
	</div>  --%>
	
	<div id="queue">
		<ol id = "my-list">
			<%-- <div class="row justify-content-center">
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
 			</div> --%>
		</ol>
	</div>
	
<!-- 	<div id=response>
	
	</div> -->
	<script>
		function addST(){
			var xhttp = new XMLHttpRequest();
			xhttp.open("GET", "MainServlet?username=" + "guest" + "&type=" + "addST" + "&pageName=join" + "&playList=" +  "U45XYgJk", false);
			xhttp.send();
			
		}
		var con = setInterval(function(){
				var type;
				var xhttp = new XMLHttpRequest();
				xhttp.open("GET", "MainServlet?username=" + "guest" + "&type=" + "UPDATE_SONG" + "&pageName=join" + "&playList=" +  "U45XYgJk", false);
				xhttp.send();
				var allSongs = xhttp.responseText.trim();
				console.log("INTERVAL :" + allSongs);
				if(xhttp.responseText.trim().length > 0){
					//document.querySelector("#response").innerHTML = songsFromServlet;
					//var array = songsFromServlet.split("&");
					var array = allSongs.split(",");
					console.log(array);
					let orderedList = document.querySelector("#my-list");
					while(orderedList.hasChildNodes()) {
						orderedList.removeChild(orderedList.lastChild);
					}
					
					var type;
					var xhttp = new XMLHttpRequest();
					xhttp.open("GET", "MainServlet?username=" + "guest" + "&type=" + "GET_NUMF" + "&pageName=join" + "&playList=" +  "U45XYgJk", false);
					xhttp.send();
					var allNum = xhttp.responseText.trim();
					var arrayNum = allNum.split(",");
					console.log(arrayNum);
					
					for(let i = 0; i < array.length; i++) {
						/* if(array[i] == "") {
							continue;
						}
						console.log("ADDING NEW ELEMENT WITH NAME: " + songs[array[i]]);
						let listItem = document.createElement("li");
						listItem.innerHTML = songs[parseInt(array[i])];
						orderedList.append(listItem); */
						
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
						
						count.innerHTML = arrayNum[i];
						
						votediv.append(triangle);
						votediv.append(count); 
					
						listItem.append(songdiv);
						listItem.append(votediv);
						
						orderedList.append(listItem);
						
					}
					//document.querySelector("#response").innerHTML += array;
					
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
							console.log("SONGNAME" + idx);
							
							var type;
							var xhttp = new XMLHttpRequest();
							xhttp.open("GET", "MainServlet?username=" + "guest" + "&type=" + "UP_VOTE" + "&pageName=join" + "&playList=" +  "U45XYgJk" + "&songName=" + idx, false);
							xhttp.send();
							var allSongs1 = xhttp.responseText.trim();
							
							var xhttp = new XMLHttpRequest();
							xhttp.open("GET", "MainServlet?username=" + "guest" + "&type=" + "UPDATE_SONG" + "&pageName=join" + "&playList=" +  "U45XYgJk", false);
							xhttp.send();
							var allSongs3 = xhttp.responseText.trim();
							console.log("UPDATED SONGLIST-JOIN " + allSongs3);
							
							var array8 = allSongs3.split(",");
							//console.log("UPDATED SONGLIST2 " + array8);
							
							
							let orderedList = document.querySelector("#my-list");
							
							//console.log("LENGTH " + array.length);
							
							let title = document.querySelectorAll(".hi");
							for(let k = 0; k < title.length; k++){
								console.log("ARRAY SONG " + array8[k]);
								title[k].innerHTML = songs[parseInt(array8[k])];
								title[k].innerHTML += " by " + artists[parseInt(array8[k])];
							}
							
							
							var type;
							var xhttp = new XMLHttpRequest();
							xhttp.open("GET", "MainServlet?username=" + "guest" + "&type=" + "GET_NUMF" + "&pageName=join" + "&playList=" +  "U45XYgJk", false);
							xhttp.send();
							var allNum1 = xhttp.responseText.trim();
							var array2 = allNum1.split(",");
							console.log("allNum2:" + array2);
							
							let countNum = document.querySelectorAll(".count");
							for(let p = 0; p < countNum.length; p++){
								countNum[p].innerHTML = parseInt(array2[p]);
							}
							//count[j].innerHTML = temp + 1;
						} 
					} 
					return false;
				}
			}, 3000);
	</script>
	
</body>
</html>
