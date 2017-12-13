<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="data.*" %>
<%@ page import="database.*" %>
<%@ page import="servlet.*" %>
<%@ page import="data.Event" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="NavbarMember.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/main.css">
<link href="https://fonts.googleapis.com/css?family=Lato:700i" rel="stylesheet">
	<title>TravelMate</title>

</head>
<body>
<%-- <% 
	Map<String, Event> eventsMap = new HashMap<>();
	DataStorage ds = (DataStorage)session.getAttribute("data"); // need to take care of this part 
//	eventsMap = ds.getEventMap();
	
//hard code for now to check the content 
	Event e = new Event();
	eventsMap.put("Egypt", e);
	eventsMap.put("China", e);
	eventsMap.put("Hungary", e);
	eventsMap.put("France", e);
	eventsMap.put("S.Korea", e);
	eventsMap.put("USA", e);
	eventsMap.put("Canada", e);
	eventsMap.put("Kenya", e);

ArrayList<String> colors = new ArrayList<String>();
	
	colors.add("#5DCABF");
	colors.add("#001f3f");
	colors.add("#027CD9");
	colors.add("#B93636");
	colors.add("#DE481A");
	colors.add("#EAC81C");
	colors.add("#3D9970");
	colors.add("#123490");
	int i = 0;
%>
	<div id = "content_container">
<%
	for ( String key : eventsMap.keySet() ) {
%>
		<div id = "content" style="background-color:<%=colors.get(i)%>" >
			<a href=""> <%=key %> </a>
		</div>	
<% 
		i++;
	}	
%>
	</div> 
	 --%>
	<% 
	if(DataStorage.usersMap.isEmpty()){
		SqlDriver sqld = new SqlDriver();
		sqld.connect();
		sqld.getUsersData();
		sqld.getEventsData();
		sqld.getJoinersData();
	}
	ArrayList<String> locations = DataStorage.randomTrips();
	%>
	<div id="newdiv">
		<form name = "otherform" action = "Others.jsp">
			<input type="submit" id="otherbutton" value="Get more travel information!"> 
		</form>
	</div>
	<div id = "content_container">
		<div class = "content" id="one">
			<a href="Search.jsp?from=''&to=<%=locations.get(0)%>&startdate=''&enddate=''"> <%=locations.get(0) %> </a>
		</div>	
		<div class = "content" id="two">
			<a href="Search.jsp?from=''&to=<%=locations.get(1)%>&startdate=''&enddate=''"> <%=locations.get(1) %> </a>
		</div>		
		<div class = "content" id="three">
			<a href="Search.jsp?from=''&to=<%=locations.get(2)%>&startdate=''&enddate=''"> <%=locations.get(2) %> </a>
		</div>		
		<div class = "content" id="four">
			<a href="Search.jsp?from=''&to=<%=locations.get(3)%>&startdate=''&enddate=''"> <%=locations.get(3) %> </a>
		</div>		
		<div class = "content" id="five">
			<a href="Search.jsp?from=''&to=<%=locations.get(4)%>&startdate=''&enddate=''"> <%=locations.get(4) %> </a>
		</div>		
		<div class = "content" id="six">
			<a href="Search.jsp?from=''&to=<%=locations.get(5)%>&startdate=''&enddate=''"> <%=locations.get(5) %> </a>
		</div>		
		<div class = "content" id="seven">
			<a href="Search.jsp?from=''&to=<%=locations.get(6)%>&startdate=''&enddate=''"> <%=locations.get(6) %> </a>
		</div>		
		<div class = "content" id="eight">
			<a href="Search.jsp?from=''&to=<%=locations.get(7)%>&startdate=''&enddate=''"> <%=locations.get(7) %> </a>
		</div>
	</div> 
</body>
</html>