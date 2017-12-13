<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="data.*" %>
<%@ page import="database.*" %>
<%@ page import="servlet.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Collections" %>
<%@ include file="NavbarMember.jsp" %>
<% 
	SqlDriver sqld = new SqlDriver();
	sqld.connect();
	sqld.getUsersData();
	sqld.getEventsData();
	sqld.getJoinersData();
	String currentuser = DataStorage.loggedInUser;
	User user= DataStorage.usersMap.get(currentuser);
	Map<String, Event> eventMap = DataStorage.getEventMap();
%> 
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="../css/profile.css">
	<link href="https://fonts.googleapis.com/css?family=Lato:700i" rel="stylesheet">
	<title>TravelMate</title>
		<title>Profile</title>
	</head>
	<body>
		<div id="Profile">
			<h2 id ="Title"> TravelMate Profile </h2>	
				<p> Username :   <%=user.getUsername()%>  </p>
				<p> Password : 
				<%String pw = user.getPassword();
				for(int i = 0; i < pw.length(); i++){	%>
				* <%}%></p>
				<p> Nickname:  <%=user.getNickname()%> </p>
				<p> Age: <%=user.getAge()%> </p>
				<p> Gender: 
				<% if (user.getGender() == 1){ %>
				Male <%}else {%> Female <%} %> </p>
<%-- 				<p> Email: <% if(user.getEmail() == null) { %> 
				None <%} else{ %> <%=user.getEmail() %> <%} %> 
				</p>  --%>
				<form method="GET" action="Profile_Edit.jsp">   
     				<input type="submit" id="button" value="Edit"/>
     			</form>
		</div>
		<div id = "Mytrip">
			<h2 id ="Title"> My Trip </h2>	
			<%	
				for(Map.Entry<String, Event> entry : eventMap.entrySet()){
			%>		
					<% 
					Event e = entry.getValue();
					if( (e.getOrganizer()).equals(currentuser) ){ 				
					%>
					<p>
					<form method="GET" name = "event" value = "<%=entry.getKey() %>" action="Event_Edit.jsp">  
						<%= e.getShortInfo() %> 
						<input type = "hidden" name = "eventNum" value = "<%=entry.getKey() %>">
						<input type="submit" id="button" value="Edit"/>
					</form>
					</p>
					<%} 
				%>
			<%
				}
			%> 	     			
		</div> 
	</body>
</html>