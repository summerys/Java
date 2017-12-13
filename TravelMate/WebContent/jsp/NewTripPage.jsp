<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "data.*" %>
<%@ include file="NavbarMember.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../css/newtrip.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
		function addtrip() {
			var xhttp = new XMLHttpRequest();
			xhttp.open("POST", "NewTripJsp.jsp?name=" + document.classform.name.value+
					"&location=" + document.classform.location.value + "&destination=" +
					document.classform.destination.value + "&startdate=" +
					document.classform.startdate.value + "&enddate=" +
					document.classform.enddate.value + "&max=" + document.classform.max.value +
					"&housing=" + document.classform.housing.value + "&des=" + 
					document.classform.des.value, false);
			xhttp.send();
  			if (xhttp.responseText.trim().length > 0) { 
 				document.getElementById("formerror").innerHTML = xhttp.responseText;
			}
 			else {
 	 			window.location.href = "MyTrip.jsp";
 			}
  			return false;
		}		
		$( function() {
			  $('.datepicker').datepicker({ minDate: 0 });
			} );
		</script>
<title>Insert title here</title>
</head>
<body>
	 <div id="newdiv">    
	      <div id="main">
				<form name="classform" method="GET" onsubmit="return addtrip();">
					<input type="text" name="name" value="" placeholder="Trip Name"/>
					<input type="text" name="location" placeholder="Starting Location"/>
					<input type="text" name="destination" placeholder="Destination"/>
					<input type="text" class="datepicker" name="startdate" placeholder="Start Date"/>
					<input type="text" class="datepicker" name="enddate" placeholder="End Date"/>
					<input type="text" name="max" placeholder="Maximum Traveler"/>
					<input type="text" name="housing" placeholder="Housing Option"/>
					<input type="text" name="des" placeholder="Trip Description"/>
					<input type="submit" name="submit" value="submit"/>
					<div id = "formerror">
					</div>
				</form>	
	      </div>
	 </div>
</body>
</html>