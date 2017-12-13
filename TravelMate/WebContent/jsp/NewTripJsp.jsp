<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="data.*" %>
<%@ page import="database.*" %>
<%@ page import="servlet.*" %>

<%
	String name = request.getParameter("name");
	String location = request.getParameter("location");
	String destination = request.getParameter("destination");
	String startdate = request.getParameter("startdate");
	String enddate = request.getParameter("enddate");
	String organizer = DataStorage.loggedInUser;
	String max = request.getParameter("max");
	String housing = request.getParameter("housing");
	String des = request.getParameter("des");
	
	if(name.equals("") || location.equals("") || destination.equals("") || startdate.equals("") || enddate.equals("") || max.equals("")){
%>
	Please provide enough information
<%
	}
	else {
		data.DataStorage.AddanEventhelper(name, location, destination, startdate, 
										enddate, organizer, Integer.parseInt(max), housing, des);
	}
%>