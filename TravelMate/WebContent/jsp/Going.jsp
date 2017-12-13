<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="data.*" %>
<%@ page import="database.*" %>
<%@ page import="servlet.*" %>

<%
	String govalue = request.getParameter("govalue");	
	String eventname = request.getParameter("eventname");	
	Event tempEvent = new Event();
	for(Event value : DataStorage.eventsMap.values()){
		if(value.name.equals(eventname)){
			tempEvent = value;
		}
	}
	SqlDriver sqld = new SqlDriver();
	sqld.connect();
	sqld.getJoinersData();
	if(govalue.equals("Going")) {	
		sqld.addAJoiner(DataStorage.loggedInUser, eventname);
		
	} else {
		sqld.deleteJoiner(DataStorage.loggedInUser, eventname);
	}
	
	
	
	String travelers = "";	
	travelers += "<p>" + "Travelers" + "</p>";
	for(int b=0; b<tempEvent.Joiners.size(); b++) {	
		travelers += "<li>" + tempEvent.Joiners.get(b) + "</li>";
	}
	
	
%>


<ul>
<%=travelers %>
</ul>
