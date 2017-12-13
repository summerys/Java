<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="data.*" %>
<%@ page import="database.*" %>
<%@ page import="servlet.*" %>

<%
		String des = request.getParameter("des");
		String lowdes = des.toLowerCase();
		String country = DataStorage.countryMap.get(lowdes);
		String gooddes = lowdes.replaceAll(" ","-");
		String goodcountry = country.replaceAll(" ","-");
		String url = "https://www.timeanddate.com/weather/" + goodcountry + "/" + gooddes + "/ext";
		System.out.println(url);
%>

<%=url%>