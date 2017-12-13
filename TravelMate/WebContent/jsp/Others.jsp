<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="data.*" %>
<%@ page import="database.*" %>
<%@ page import="servlet.*" %>
<%@ page import="WebSpyder.*" %>
<%@ include file="NavbarMember.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/others.css">
<title>Insert title here</title>
</head>
<body>
<%
	WebCrawler crawler = new WebCrawler();
	String others = crawler.GetBackURL();
%>
	<p>Other information</p>
	<div id="otherdiv">
		<%=others %>
	</div>
</body>
</html>