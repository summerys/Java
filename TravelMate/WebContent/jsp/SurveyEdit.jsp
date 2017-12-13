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
<link rel="stylesheet" href="../css/profile.css">
<link href="https://fonts.googleapis.com/css?family=Lato:700i" rel="stylesheet">
<title>Survey Edit</title>
</head>
<body>
<h1> Survey Edit </h1>
	<h3> Edit Survey Infornation </h3>
	
	<form method = "GET" action = "SurveyEditServlet">
	<table>
		<tr>
		
			<td> Hobby </td>
			<td> 
			<input type = "text" name = "username" placeholder = "temp"><br>
			</td>
		</tr>
		<tr>
			<td> Alcohol </td>
			<td> 
			Yes 
			 <input type="radio" name="alcohol" value="yes" checked> Yes
 			 <input type="radio" name="alcohol" value="no"> No<br>
			</td>
			
		</tr>
		<tr>
			<td> Partying </td>
			<td> 
			No
			 <input type="radio" name="alcohol" value="yes" checked> Yes
 			 <input type="radio" name="alcohol" value="no"> No<br>
			</td>
		</tr>
		<tr>
			<td> BedTime </td>
			<td> 
			<input type = "text" name = "age" placeholder = "temp">
			 <input type="radio" name="bedtime" value="am" checked> am
 			 <input type="radio" name="bedtime" value="pm"> pm<br>
			</td>
		</tr>
		<tr>
			<td> WakeUpTime </td>
			<td> 
			<input type = "text" name = "gender" placeholder = "temp">
			<input type="radio" name="bedtime" value="am" checked> am
 			 <input type="radio" name="bedtime" value="pm"> pm<br>
			</td>
		</tr>

	</table>
		 <input type="submit" value="Edit">
	</form>
</body>
</html>