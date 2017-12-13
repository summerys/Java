<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="data.*" %>
<%@ page import="database.*" %>
<%@ page import="servlet.*" %>

<%
	String loc = request.getParameter("loc");
	String des = request.getParameter("des");
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	String max = request.getParameter("max");
		System.out.println("length0");
		String lowloc = loc.toLowerCase();
		String lowdes = des.toLowerCase();
		String goodloc =  DataStorage.airportsMap.get(lowloc);
		String gooddes =  DataStorage.airportsMap.get(lowdes);
		
		String goodstart = "";
		String goodend = "";
		goodstart += start.charAt(6);
		goodstart += start.charAt(7);
		goodstart += start.charAt(8);
		goodstart += start.charAt(9);
		goodstart += "-";
		goodstart += start.charAt(0);
		goodstart += start.charAt(1);
		goodstart += "-";
		goodstart += start.charAt(3);
		goodstart += start.charAt(4);
		
		goodend += end.charAt(6);
		goodend += end.charAt(7);
		goodend += end.charAt(8);
		goodend += end.charAt(9);
		goodend += "-";
		goodend += end.charAt(0);
		goodend += end.charAt(1);
		goodend += "-";
		goodend += end.charAt(3);
		goodend += end.charAt(4);
		
		String url = "https://www.kayak.com/flights/" + goodloc + "-" + gooddes + "/" + goodstart + "/" + goodend + "/" + max + "adults";
		System.out.println(url);
%>

<%=url%>