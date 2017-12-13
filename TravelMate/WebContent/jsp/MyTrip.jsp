<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "data.*" %>
<%@ include file="NavbarMember.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/mytrip.css">
<title>Insert title here</title>
<%
	String result = DataStorage.myTriphelper();

%>
</head>
<body>
	<div id="wholediv">
		<div id="newdiv">
			<form name = "newtripform" action = "NewTripPage.jsp">
				<input type="submit" id="newtripbutton" value="Create A Trip!"> 
			</form>
		</div>
		<%= result %>
	</div>
</body>
</html>