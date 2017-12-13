<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Navbar.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/signup.css">
		<script>
		function adduser() {
			var xhttp = new XMLHttpRequest();
			xhttp.open("POST", "SignUpJsp.jsp?username=" + document.classform.username.value+
					"&password=" + document.classform.password.value + "&nickname=" +
					document.classform.nickname.value + "&age=" +
					document.classform.age.value + "&gender=" +
					document.classform.gender.value , false);
			xhttp.send();
  			if (xhttp.responseText.trim().length > 0) { 
 				document.getElementById("formerror").innerHTML = xhttp.responseText;
			}
 			else {
 	 			window.location.href = "Main.jsp";
 			}
  			return false;
		}		
		</script>
<title>Insert title here</title>
</head>
<body>
	 <div id="newdiv">    
	      <div id="main">
				<form name="classform" method="GET" onsubmit="return adduser();">
					<input type="text" name="username" value="" placeholder="Username"/>
					<input type="password" name="password" placeholder="Password"/>
					<input type="text" name="nickname" placeholder="Nickname"/>
					<input type="text" name="age" placeholder="Age"/>
					<input type="text" name="gender" placeholder="Gender(Male/Female)"/>
					<input type="submit" name="submit" value="submit"/>
					<div id = "formerror">
					</div>
				</form>	
	      </div>
	</div>
</body>
</html>