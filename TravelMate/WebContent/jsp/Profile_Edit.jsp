<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="data.*" %>
<%@ page import="database.*" %>
<%@ page import="servlet.*" %>
<%@ include file="NavbarMember.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/edit.css">
<link href="https://fonts.googleapis.com/css?family=Lato:700i" rel="stylesheet">

	<script>	
		function validate() {			
			var xhttp = new XMLHttpRequest();
			xhttp.open("POST", "${pageContext.request.contextPath}/jsp/Profile_error.jsp?password=" + document.profile.password.value +
 			 "&confirmedpassword=" + document.profile.confirmedpassword.value + "&nickname=" + document.profile.nickname.value + 
 			"&age=" + document.profile.age.value + "&gender=" + document.profile.gender.value, false);
			xhttp.send();			
  			if (xhttp.responseText.trim().length > 0) { 
 				document.getElementById("formerror").innerHTML = xhttp.responseText;
			}
 			else {
 	 			window.location.href = "Profile.jsp";
 			}			
			return false;
		}
	 </script> 	 
<title>Profile Edit</title>
</head>
<body>

<% 
	String currentuser = DataStorage.loggedInUser;
	User user= DataStorage.usersMap.get(currentuser);
%> 

	<div id="editdiv">    
	      <div id="main">
				<form name="profile" method="GET" onsubmit="return validate();">
					<input type="password" name="password" placeholder="Password"/>
					<input type="password" name="confirmedpassword" placeholder="Confirm Password"/>
					<input type="text" name="nickname" placeholder="Nickname"/>
					<input type="text" name="age" placeholder="Age"/>
					<input type="text" name="gender" placeholder="Gender(Male/Female)"/>
					<input type="submit" name="submit" value="Update"/>
					<div id = "formerror">
					</div>
				</form>	
	      </div>
	 </div>
</body>
</html>