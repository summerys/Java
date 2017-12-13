<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="data.*" %>
<%@ page import="database.*" %>
<%@ page import="servlet.*" %>

<%  
/* 	String country_destination = request.getParameter("country_destination");
	String state_destination = request.getParameter("state_destination");
	String city_destination = request.getParameter("city_destination");
	String country_location = request.getParameter("country_location");
	String state_location = request.getParameter("state_location");
	String city_location = request.getParameter("city_location"); */
	String destination = request.getParameter("destination");
	String location = request.getParameter("location");
	String startDate =  request.getParameter("startdate");
	String endDate =  request.getParameter("enddate");
	String maxTraveler =  request.getParameter("max");
	String housing =  request.getParameter("housing");
	String description =  request.getParameter("des");
	String event =  request.getParameter("event");
	
	Event tempEvent = new Event();
	for (Event value : DataStorage.eventsMap.values()) {
		if(event.trim().equals(value.getName())){
			tempEvent = value;
		}
	}
	SqlDriver sqld = new SqlDriver();
	sqld.connect();
	if(!destination.equals("")){
		sqld.UpdateDestination(destination, event);
	}
	if(!location.equals("")){
		sqld.UpdateLocation(location, event);
	}
	if( !startDate.equals("")){
		sqld.UpdateStart(startDate, event);
	}
	if( !endDate.equals("")){
		sqld.UpdateEnd(endDate, event);
	}
	if(!maxTraveler.equals("")){
		if(Integer.parseInt(maxTraveler) < tempEvent.Joiners.size()) {
%>
		Please provide correct max traveler information.
<%
		}	
		else {
			sqld.UpdateMax(Integer.parseInt(maxTraveler), event);
		}
	}
	if(!housing.equals("")){
		sqld.UpdateHousing(housing, event);
	}
	if(!description.equals("")){
		sqld.UpdateDes(description, event);
	}
%>
