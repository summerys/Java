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
<%@ page import="java.util.ArrayDeque" %>
<%@ include file="Navbar.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Search Results</title>
	<link rel="stylesheet" href="../css/search.css">
	<% 
	String from = request.getParameter("from");
	String to = request.getParameter("to");
	String start = request.getParameter("startdate");
	String end = request.getParameter("enddate");
	ArrayDeque<Event> tempsave = DataStorage.search(from,to,start,end);
	String result = "";
	if(tempsave.isEmpty()) {
		result += "<div class=\"nodiv\">";
		result += "No Result Found";
		result += "</div>";
	} 
	else {
		for(Event e : tempsave){
			result += "<div class=\"searchdiv\">";
			result += "<p>" + e.name + "</p>"
					+ "<p>" + "Starting Location:  " + e.location
					+ "</p>" + "<p>" + "Destination:  " + e.destination + "</p>" +
					"<p>" +"Starts from:  " + e.startDate + "</p>" + "<p>" +
					"Ends at: " + e.endDate + "</p>";
			result += "</div>";
		}
	}
	%>
</head>
<body>
	<div id="wholediv">
		<%= result %>
	</div>
</body>
</html>