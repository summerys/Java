<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="data.*" %>
<%@ page import="database.*" %>
<%@ page import="servlet.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ include file="NavbarMember.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/edit.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script> 
<script src="//geodata.solutions/includes/countrystatecity.js"></script>	
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false"></script> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<link href="https://fonts.googleapis.com/css?family=Lato:700i" rel="stylesheet">
<%
	Event e = new Event();
	String event_name = request.getParameter("eventNum"); 
	for (Event value : DataStorage.eventsMap.values()) {
		if(event_name.trim().equals(value.getName())){
			e = value;
		}
	}
%>
	<script>
	function validate() {
		var xhttp = new XMLHttpRequest();
/* 		xhttp.open("POST", "${pageContext.request.contextPath}/jsp/Event_error.jsp?des=" + document.classform.des.value+
				"&country_destination=" + document.event.country_destination.value +  
				"&state_destination=" + document.event.state_destination.value +  
				"&city_destination=" + document.event.city_destination.value+
				"&country_location=" + document.event.country_location.value+
				"&state_location=" + document.event.state_location.value +  
				"&city_location=" + document.event.city_location.value +
				"&startdate=" + document.classform.startdate.value + "&enddate=" +
				document.classform.enddate.value + "&max=" + document.classform.max.value +
				"&housing=" + document.classform.housing.value + 
				"&event=" + document.classform.event.value, false);
		xhttp.send(); */
		xhttp.open("POST", "${pageContext.request.contextPath}/jsp/Event_error.jsp?des=" + document.classform.des.value+
				"&location=" + document.classform.location.value + "&destination=" +
				document.classform.destination.value + "&startdate=" +
				document.classform.startdate.value + "&enddate=" +
				document.classform.enddate.value + "&max=" + document.classform.max.value +
				"&housing=" + document.classform.housing.value + 
				"&event=" + document.classform.event.value, false);
		xhttp.send();
			if (xhttp.responseText.trim().length > 0) { 
				document.getElementById("formerror").innerHTML = xhttp.responseText;
		}
		else {
			window.location.href = "${pageContext.request.contextPath}/jsp/Profile.jsp";
		}
		return false;
	}
	</script>
	<script>
	$( function() {
	  $('.datepicker').datepicker({ minDate: 0 });
	} );
	</script>
	 

<title>Event</title>
</head>

<body> 
	<div id="map" style="width: 40vw; height: 40vh; margin-left: 30vw; margin-top: 1vh; margin-bottom: -5vh;"></div>
	 <div id="editdiv">    
	      <div id="main">
				<form name="classform" method="GET" onsubmit="return validate();">
<!-- 					<table align="center">
						<tr>
							<td> Destination </td>
							<td> 
								<select name="country_destination" class="countries" id="countryId">
								<option value="">Select Country</option>
								</select><br>
								<select name="state_destination" class="states" id="stateId">
								<option value="">Select State</option>
								</select><br>
								<select name="city_destination" class="cities" id="cityId">
								<option value="">Select City</option>
								</select>
							</td>
						</tr>	
						<tr>
							<td> Location </td>			
							<td> 		
							<select name="country_location" class="countries" id="countryId"> 
							<option value="">Select Country</option>
							</select><br>
							<select name="state_location" class="states" id="stateId">
							<option value="">Select State</option>
							</select><br>
							<select name="city_location" class="cities" id="cityId">
							<option value="">Select City</option>
							</select>
							</td>
						</tr>
					</table> -->
	 				<input type="text" name="location" placeholder="Starting Location (<%=e.getLocation() %>)"/>
					<input type="text" name="destination" placeholder="Destination (<%=e.getDestination() %>)"/>
					<input type="text" class="datepicker" name="startdate" placeholder="Start Date (<%= e.getStartDate() %>)"/>
					<input type="text" class="datepicker" name="enddate" placeholder="End Date (<%= e.getEndDate() %>)"/>
					<input type="text" name="max" placeholder="Maximum Traveler (<%=e.getMaxTraveler() %>)"/>
					<input type="text" name="housing" placeholder="Housing Option (<%=e.getHousing() %>)"/>
					<input type="text" id="des" name="des" placeholder="Trip Description"/>
					<input type="hidden" name = "event" value = "<%=event_name %>">
					<input type="submit" name="submit" value="Update"/>
					<div id = "formerror"> 
					</div>
				</form>	
	      </div>
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
	       
	        var location = "<%= e.getLocation() %>";
	        var destination = "<%= e.getDestination() %>";
	        
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

	<script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDQtAHNSuOyqeyJ984S-td9CJKwSJKsxIU&callback=initMap">
    </script>
</body>
</html>