<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Travlemate</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbarMember.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	$( function() {
	  $('.datepicker').datepicker({ minDate: 0 });
	} );
	</script>
</head>
<body>
	<div id="navbar">
		<div id="searchdiv">			
			<form name = "search" method = "GET" action="Search.jsp">
	        	<input type="text" name = "from" id="from" placeholder="From"> 
	        	<input type="text" name = "to"id="to" placeholder="To">      		
	        	<input type="text" name = "startdate" class="datepicker" placeholder="Start Date"> 
	        	<input type="text" name = "enddate" class="datepicker" placeholder="End Date">
        	<input type="submit" value="Search">
			</form> 
		</div>
		<div id="title">
			<a href="MainMember.jsp"><img src="${pageContext.request.contextPath}/img/logo.png" id="logo"></a>
		</div>
		<div id="menudiv">
			<a href="Main.jsp"><img src="${pageContext.request.contextPath}/img/logout.png" id="logout" title="Logout"></a>
			<a href="MyTrip.jsp"><img src="${pageContext.request.contextPath}/img/mytrip.png" id="mytrip" title="My Trip"></a>
			<a href="Profile.jsp"><img src="${pageContext.request.contextPath}/img/profile.png" id="profile" title="My Profile"></a>
		</div>
	</div>
</body>
</html>