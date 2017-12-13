<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="data.*" %>
<%@ page import="database.*" %>
<%@ page import="servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>TravelMate</title>
	<link rel="stylesheet" href="../css/navbar.css">
	<script>
	function check() {
		var xhttp = new XMLHttpRequest();
		xhttp.open("GET", "/" + window.location.pathname.split("/")[1] + "/NavbarServlet?username=" + document.loginform.username.value +
				"&password=" + document.loginform.password.value, true);
		xhttp.send();
		xhttp.onreadystatechange =  function(){
			if(this.readyState === 4 && this.status === 200){
				if(this.responseText == "notpassed"){
					document.getElementById("formerror").innerHTML = "<strong>" + "Incorrect password!" + "</strong>";
					return false;
				}
				else if(this.responseText == "notexist"){
					document.getElementById("formerror").innerHTML = "<strong>" + "Invalid Username" + "</strong>";
					return false;
				}
				else{
					document.getElementById("formerror").innerHTML = "<strong>" + "Success!" + "</strong>";
					window.location = "MainMember.jsp";
				}
			}
		}
		return false;
	}		
	</script>
</head>
<body>
	<div id="navbar">
		<div id="title">
			<a href="Main.jsp"><img src="../img/logo.png" id="logo"></a>
		</div>	
		<div id="logindiv">	
				<form name = "loginform" onsubmit = "return check();">		       
	        	<input type="submit" id="login" value="Login">	        	
	        	<input type="password" name="password" id="pass" placeholder="Password">
	        	<input type="text" name="username" id="user" placeholder="Username"> 
				</form> 
				<div id="formerror">
				</div>
		</div>
		<div id="signupdiv">
			<form name = "signup" action="SignUp.jsp">
				<input type="submit" value="Signup">
			</form>
		</div>
	</div>
</body>
</html>