<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="data.*" %>
<%@ page import="database.*" %>
<%@ page import="servlet.*" %>
<%@ include file="NavbarMember.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script> 
<script src="//geodata.solutions/includes/countrystatecity.js"></script>	
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false"></script> 
<link href="https://fonts.googleapis.com/css?family=Lato:700i" rel="stylesheet">
<script>
	function check() {
		goelement = document.getElementById("goicon");
		if(goelement.value.match("Going")) {	
			var xhttp = new XMLHttpRequest();
			xhttp.open("POST", "Going.jsp?govalue=" + document.goform.goicon.value + "&eventname=" + document.goform.currname.value, false);
			goelement.value = "Not going";
			xhttp.send();
			if (xhttp.responseText.trim().length > 0) { 
					document.getElementById("Goingdiv").innerHTML = xhttp.responseText;
			}
			
			return false;
		}
		else{
			var xhttp = new XMLHttpRequest();
			xhttp.open("POST", "Going.jsp?govalue=" + document.goform.goicon.value + "&eventname=" + document.goform.currname.value, false);
			goelement.value = "Going";
			xhttp.send();
				if (xhttp.responseText.trim().length > 0) { 
					document.getElementById("Goingdiv").innerHTML = xhttp.responseText;
			}
			return false;
		}
	
	}
	
	function kayak() {	
		var xhttp = new XMLHttpRequest();
		xhttp.open("POST", "${pageContext.request.contextPath}/jsp/Buy.jsp?loc=" + document.buyform.loc.value +
			 "&des=" + document.buyform.des.value + "&start=" + document.buyform.start.value + 
			"&end=" + document.buyform.end.value + 
			"&max=" + document.buyform.max.value, false);
		xhttp.send();			
		if (xhttp.responseText.trim().length > 0) { 
				window.location.href = xhttp.responseText.trim();
		}		
		return false;
	}
	
 	function weather() {	
		var xhttp = new XMLHttpRequest();
		xhttp.open("POST", "${pageContext.request.contextPath}/jsp/Weather.jsp?des=" + document.weatherform.des.value, false);
		xhttp.send();			
		if (xhttp.responseText.trim().length > 0) { 
				window.location.href = xhttp.responseText.trim();
		}		
		return false;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/event.css">
<title>Insert title here</title>
<%
	SqlDriver sqld = new SqlDriver();
	sqld.connect();
	sqld.getJoinersData();
	sqld.getAirportsData();
	String title = "";
	title = request.getParameter("title");
	if(title == null) {
		title = DataStorage.currEvent;
	}
	DataStorage.currEvent = title;
	Event tempEvent = new Event();
	for(Event value : DataStorage.eventsMap.values()){
		if(value.name.equals(title)){
			tempEvent = value;
		}
	}
	User organizer = DataStorage.usersMap.get(tempEvent.organizer);
	String gender = "";
	if(organizer.getGender()==0) {
		gender += "Female";
	} else {
		gender += "Male";
	}
	String goingdiv = "";
	boolean instatus = false;
	for(int a=0; a<tempEvent.Joiners.size(); a++) {
		if(DataStorage.loggedInUser.equals(tempEvent.Joiners.get(a))) {
			instatus = true;
		}
	}
	boolean fullstatus = false;
	if(tempEvent.maxTraveler <= tempEvent.Joiners.size()) {
		fullstatus = true;
	}
	boolean ownerstatus = false;
	if(organizer.getUsername().equals(DataStorage.loggedInUser)) {
		ownerstatus = true;
	}
	if(instatus && !ownerstatus) {
		goingdiv += "<form name=\"goform\" method=\"GET\" onsubmit=\"return check();\"> <input id=\"goicon\" name=\"goicon\" type=\"submit\" value=\"Not going\"><input name=\"currname\" type=\"hidden\" value=\"" + tempEvent.name + "\"></form>";	
	} 
	else if(!instatus && !fullstatus){
		goingdiv += "<form name=\"goform\" method=\"GET\" onsubmit=\"return check();\"> <input id=\"goicon\" name=\"goicon\" type=\"submit\" value=\"Going\"><input name=\"currname\" type=\"hidden\" value=\"" + tempEvent.name + "\"></form>";
	}
	String traveler = "";
	for(int a=0; a<tempEvent.Joiners.size(); a++) {		
		traveler += "<li>" + tempEvent.Joiners.get(a) + "</li>";
	}
	
%>
</head>
<body>
	<div id="buydiv">
		<form style="float:left" name = "weatherform" onsubmit = "return weather();">
			<input type="submit" id="weatherbutton" value="Check the local weather before departure!"> 
			<input type="hidden" id="des" value="<%=tempEvent.destination%>">
		</form>
		<form style="float:left" name = "buyform" onsubmit = "return kayak();">
			<input type="submit" id="buybutton" value="Get your flight tickets on Kayak!"> 
			<input type="hidden" id="loc" value="<%=tempEvent.location%>"> 
			<input type="hidden" id="des" value="<%=tempEvent.destination%>"> 
			<input type="hidden" id="start" value=<%=tempEvent.startDate %>> 
			<input type="hidden" id="end" value=<%=tempEvent.endDate %>> 
			<input type="hidden" id="max" value=<%=tempEvent.maxTraveler %>> 
		</form>
	</div>
	<div id="eventdiv">
	<p><%=tempEvent.name %></p>
	<ul>
		<li>Starting Location: <%=tempEvent.location %></li>
		<li>Destination: <%=tempEvent.destination %></li>
		<li><div id="map" style="width: 30vw; height: 30vh; margin-left: 15vw;"></div></li>
		<li>Start Date: <%=tempEvent.startDate %></li>
		<li>End Date: <%=tempEvent.endDate %></li>
		<li><%=goingdiv %></li>
	</ul>
	</div>
	<div id="detaildiv">
	<p>Detailed Info</p>
	<ul>
		<li>Max Traveler: <%=tempEvent.maxTraveler %></li>
		<li>Housing Option: <%=tempEvent.housing %></li>
		<li>Description: <%=tempEvent.description %></li>
	</ul>
	</div>
	<div id="organizerdiv">
	<p>Organizer's Info</p>
	<ul>
		<li>Nickname: <%=organizer.getNickname() %></li>
		<li>Username: <%=organizer.getUsername() %></li>
		<li>Age: <%=organizer.getAge() %></li>
		<li>Gender: <%=gender %></li>
	</ul>
	</div>
	<div id="Goingdiv">
		<p>Travelers</p>
		<ul>
			<%=traveler %>
		</ul>
	</div>
	<script>	 
	 var geocoder;
	 var map;
	 function initMap() {
	        var map = new google.maps.Map(document.getElementById('map'), {
	          zoom: 8,
	          center: {lat: -34.397, lng: 150.644}
	        });
	        var geocoder = new google.maps.Geocoder();
	       
	        var location = "<%= tempEvent.getLocation() %>";
	        var destination = "<%= tempEvent.getDestination() %>";
	        
	        addTripToMap( location, destination, geocoder, map );
	      }
	 
	 function addTripToMap(startLocation, endLocation, geocoder, map)
	 {
		 // Storage place for markers for this trip so we can later rezoom	 		 
	 	var markers = [];
	    google.maps.event.addListenerOnce(map, 'bounds_changed', function(event) {
		  this.setZoom(map.getZoom()-1);
		  if (this.getZoom() > 15) {
		    this.setZoom(15);
		  }
		});
		 
	   function recenter() { 
			// Re center map
			 var bounds = new google.maps.LatLngBounds();
			 for(i=0;i<markers.length;i++) {
			    bounds.extend(markers[i].getPosition());
			 }
			 
			 // fit bounds
			 map.fitBounds(bounds);
			 
			 // center the map to the geometric center of all markers
			 map.setCenter(bounds.getCenter());			 
		};
 
		var addMarkerToMap = function (address) {
	        geocoder.geocode({'address': address}, function(results, status) {
	          if (status === 'OK') {
	            map.setCenter(results[0].geometry.location);
	            var marker = new google.maps.Marker({
	              map: map,
	              position: results[0].geometry.location
	            });
	            // Save marker for rezoom
	            markers.push(marker);
	            recenter();
	          } else {
	            alert('Geocode was not successful for the following reason: ' + status);
	          }
	        });
		 };
		 // Add Markers to map
		 addMarkerToMap(startLocation);
		 addMarkerToMap(endLocation);
	 }
	</script>

	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQtAHNSuOyqeyJ984S-td9CJKwSJKsxIU&callback=initMap"> </script>
</body>
</html>