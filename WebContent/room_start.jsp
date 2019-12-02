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
	<% String username = "Bob"; %>
	<% String code = "U45"; %>
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
		
		
		<%-- <h1 class="col-6"><%=username %>'s Room</h1> --%>
		<h1 class="col-6">
		<%=username %>'s Room</h1>
		
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
						<option value="1">Everyday Life</option>
						<option value="2">Old Friends</option>
						<option value="3">Bad Guy</option>
						<option value="4">Cry Cry Cry</option>
					</select>
					
					<input type="hidden" id="username" name="username" value="<%=username%>">
				</div>
				<div class="col-2">
					<button id="submit"  onclick = "return addSong()" type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div> <!-- .form-group -->
		</form>
	</div> 
	
	<div id="songaudio" class="text-center">
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
	console.log(sessionStorage.getItem("currUser"));
	
	//document.querySelector("#owner").innerHTML = sessionStorage.getItem("currUser");
	
	function endOfSong() {
		console.log("remove song js");
		
		var audioname = document.querySelector("audio").src;
		
		console.log(audioname);
		
		var index = audioname.indexOf("music/");
		console.log(index);
		
		var index2 = audioname.indexOf(".mp3");
		
		var name = audioname.substring(index+6,index2);
		
		var songID = songs.indexOf(name);
		console.log("songid "+songID);
		
		var type;
		var xhttp = new XMLHttpRequest();
		
		xhttp.open("GET", "MainServlet?username=" + "john" + "&type=" + "REMOVE_SONG" + "&pageName=start" + "&playList=" +  "U45XYgJk" + "&songName=" + songID, false);
		xhttp.send();
		var allSongs = xhttp.responseText.trim();
		console.log("allsongs after remove"+allSongs);
		
		display(allSongs);
		return false;
	}
	
	function addSong(){
		console.log("add song js");
		
		var type;
		var xhttp = new XMLHttpRequest();
		xhttp.open("GET", "MainServlet?username=" + "john" + "&type=" + "ADD_SONG" + "&pageName=start" + "&playList=" +  "U45XYgJk" + "&songName=" + document.querySelector("#song-id").value, false);
		xhttp.send();
		var allSongs5 = xhttp.responseText.trim();
		
		var xhttp = new XMLHttpRequest();
		xhttp.open("GET", "MainServlet?username=" + "john" + "&type=" + "UPDATE_SONG" + "&pageName=start" + "&playList=" +  "U45XYgJk", false);
		xhttp.send();
		var allSongs = xhttp.responseText.trim();
		console.log(allSongs);
		
		
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
			console.log("checking array size" + array.length);
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
					audioelement.setAttribute("onended", "endOfSong()");

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
					console.log("SONGNAME" + idx);
					
					var type;
					var xhttp = new XMLHttpRequest();
					xhttp.open("GET", "MainServlet?username=" + "john" + "&type=" + "UP_VOTE" + "&pageName=start" + "&playList=" +  "U45XYgJk" + "&songName=" + idx, false);
					xhttp.send();
					var allSongs1 = xhttp.responseText.trim();
					
					var xhttp = new XMLHttpRequest();
					xhttp.open("GET", "MainServlet?username=" + "john" + "&type=" + "UPDATE_SONG" + "&pageName=start" + "&playList=" +  "U45XYgJk", false);
					xhttp.send();
					var allSongs3 = xhttp.responseText.trim();
					console.log("UPDATED SONGLIST3 " + allSongs3);
					
					var array8 = allSongs3.split(",");
					//console.log("UPDATED SONGLIST2 " + array8);
					
					
					let orderedList = document.querySelector("#my-list");
					
					//console.log("LENGTH " + array.length);
					
					let title = document.querySelectorAll(".hi");
					/* for(let k = 0; k < title.length; k++){
						console.log("ARRAY SONG " + array8[k]);
						title[k].innerHTML = songs[parseInt(array8[k])];
						title[k].innerHTML += " by " + artists[parseInt(array8[k])];
					}  */
					
					var type;
					var xhttp = new XMLHttpRequest();
					xhttp.open("GET", "MainServlet?username=" + "john" + "&type=" + "GET_NUM" + "&pageName=start" + "&playList=" +  "U45XYgJk", false);
					xhttp.send();
					var allNum = xhttp.responseText.trim();
					var array1 = allNum.split(",");
					console.log("allNum:" + array1);
					
					var type;
					var xhttp = new XMLHttpRequest();
					xhttp.open("GET", "MainServlet?username=" + "john" + "&type=" + "GET_NUMF" + "&pageName=start" + "&playList=" +  "U45XYgJk", false);
					xhttp.send();
					var allNum1 = xhttp.responseText.trim();
					var array2 = allNum1.split(",");
					console.log("allNum2:" + array2);
					
					let countNum = document.querySelectorAll(".count");
					/* for(let p = 0; p < countNum.length; p++){
						countNum[p].innerHTML = parseInt(array2[p]);
					}  */
					//count[j].innerHTML = temp + 1;
				} 
			}  
		
			return false;
		}	
	}
	var con = setInterval(function(){
		updatesGuest();
	},4000);
	function updatesGuest(){
		var type;
		var xhttp = new XMLHttpRequest();
		xhttp.open("GET", "MainServlet?username=" + "user" + "&type=" + "UPDATE_SONG" + "&pageName=start" + "&playList=" +  "U45XYgJk", false);
		xhttp.send();
		var allSongs = xhttp.responseText.trim();
		console.log(allSongs);
		
		if(xhttp.responseText.trim().length > 0){
			var array = allSongs.split(",");
			console.log("ALLSONGS: " + array);
			let orderedList = document.querySelector("#my-list");
			let check = "";
			let title = document.querySelectorAll(".hi");
			for(let k = 0; k < title.length; k++){
				console.log("ARRAY SONG " + array[k]);
				if(array[k] == ""){
					check = "missing";
					title[k].innerHTML = "";
					continue;
				}
				title[k].innerHTML = songs[parseInt(array[k])];
				title[k].innerHTML += " by " + artists[parseInt(array[k])];
			}
			var type;
			var xhttp = new XMLHttpRequest();
			xhttp.open("GET", "MainServlet?username=" + "user" + "&type=" + "GET_NUMF" + "&pageName=start" + "&playList=" +  "U45XYgJk", false);
			xhttp.send();
			var allNum1 = xhttp.responseText.trim();
			var array2 = allNum1.split(",");
			console.log("allNumTime:" + array2);
			
			let countNum = document.querySelectorAll(".count");
			let triangle = document.querySelectorAll(".triangle-up");
			console.log(triangle);
			if(check == "missing"){
				let all = document.querySelector("#my-list");
				console.log(all);
				if(all != null){
					all.removeChild(all.lastChild);
					let title1 = document.querySelectorAll(".hi");
					console.log("CHECK THIS: ");
					console.log(title1);
					for(let k = 0; k < title1.length; k++){
						console.log(title1[k]);
						if(k == 0){
							let f = title1[k].innerHTML;
							let songNameF = f.split(" by ");
							console.log(songNameF[0]);
							
							let idx = songs.indexOf(songNameF[0]);
							console.log("SONGNAME" + idx);
							//var audiodiv = document.querySelector("#songaudio");
							var audioelement = document.querySelector("audio");
							var songmp3 = songs[idx]+".mp3";
							
							audioelement.controls = true;
							audioelement.setAttribute("src", songmp3); 
							audioelement.setAttribute("onended", "endOfSong()");
	
							//audiodiv.append(audioelement);
						}
					} 
				}
			}
			check = "";
			//console.log(all);
			for(let p = 0; p < countNum.length; p++){
				countNum[p].innerHTML = parseInt(array2[p]);
				console.log("count 2 " + countNum[p].innerHTML);
			}
		}
		return false;
	}
	
	function display(allSongs){
		console.log("displaySongs begin");
		let orderedList = document.querySelector("#my-list");
		while(orderedList.hasChildNodes()) {
			orderedList.removeChild(orderedList.lastChild);
		} 
		
		let songaudio = document.querySelector("#songaudio");
		while(songaudio.hasChildNodes()) {
			songaudio.removeChild(songaudio.lastChild);
		} 
		
		if(allSongs.length > 0){
			//document.querySelector("#response").innerHTML = songsFromServlet;
			//var array = songsFromServlet.split("&");
			var array = allSongs.split(",");
			console.log(array);
			let orderedList = document.querySelector("#my-list");
			while(orderedList.hasChildNodes()) {
				orderedList.removeChild(orderedList.lastChild);
			}
			console.log(array.length);
			for(let i = 0; i < array.length-1; i++) {
				if(array[i] == "") {
					continue;
				}
				console.log("ADDING NEW ELEMENT WITH NAME: after remove " + songs[array[i]]);
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
					audioelement.setAttribute("onended", "endOfSong()");

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
					console.log("SONGNAME" + idx);
					
					var type;
					var xhttp = new XMLHttpRequest();
					xhttp.open("GET", "MainServlet?username=" + "john" + "&type=" + "UP_VOTE" + "&pageName=start" + "&playList=" +  "U45XYgJk" + "&songName=" + idx, false);
					xhttp.send();
					var allSongs1 = xhttp.responseText.trim();
					
					var xhttp = new XMLHttpRequest();
					xhttp.open("GET", "MainServlet?username=" + "john" + "&type=" + "UPDATE_SONG" + "&pageName=start" + "&playList=" +  "U45XYgJk", false);
					xhttp.send();
					var allSongs3 = xhttp.responseText.trim();
					console.log("UPDATED SONGLIST3 " + allSongs3);
					
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
					xhttp.open("GET", "MainServlet?username=" + "john" + "&type=" + "GET_NUM" + "&pageName=start" + "&playList=" +  "U45XYgJk", false);
					xhttp.send();
					var allNum = xhttp.responseText.trim();
					var array1 = allNum.split(",");
					console.log("allNum:" + array1);
					
					var type;
					var xhttp = new XMLHttpRequest();
					xhttp.open("GET", "MainServlet?username=" + "john" + "&type=" + "GET_NUMF" + "&pageName=start" + "&playList=" +  "U45XYgJk", false);
					xhttp.send();
					var allNum3 = xhttp.responseText.trim();
					var array3 = allNum3.split(",");
					console.log("allNum3:" + array3);
					
					var type;
					var xhttp = new XMLHttpRequest();
					xhttp.open("GET", "MainServlet?username=" + "john" + "&type=" + "GET_NUMF" + "&pageName=start" + "&playList=" +  "U45XYgJk", false);
					xhttp.send();
					var allNum1 = xhttp.responseText.trim();
					var array2 = allNum1.split(",");
					console.log("allNum2:" + array2);
					
					let countNum = document.querySelectorAll(".count");
					for(let p = 0; p < countNum.length; p++){
						
						countNum[p].innerHTML = parseInt(array2[p]);
						console.log("count 1 " + countNum[p].innerHTML);
					} 
					//count[j].innerHTML = temp + 1;
				} 
			}  
		}
		console.log("displaySongs END");
	}
	</script>
	
</body>
</html>
